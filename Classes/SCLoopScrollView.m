//
//  SCLoopScrollView.m
//  ShiCang
//
//  Created by ShiCang on 15/3/18.
//  Copyright (c) 2015年 ShiCang. All rights reserved.
//

#import "SCLoopScrollView.h"
#import "SCLoopManager.h"
#import "UIView+FindUIViewController.h"

#define SELF_WIDTH          self.frame.size.width
#define SELF_HEIGHT         self.frame.size.height

#define MIN_BORDER  0.0f
#define MAX_BORDER  SELF_WIDTH*2

typedef void(^BLOCK)(NSInteger);

@interface SCLoopScrollView () <
UIScrollViewDelegate
>
@end

@implementation SCLoopScrollView {
    BLOCK _tapedBlock;
    BLOCK _scrolledBlock;
    
    SCLoopManager *_manager;
    UIScrollView  *_scrollView;
    UIImageView   *_firstImageView;
    UIImageView   *_centerImageView;
    UIImageView   *_lastImageView;
}

#pragma mark - Init Methods
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

#pragma mark - Config Methods
- (void)initialize {
    _manager = [[SCLoopManager alloc] init];
}

- (void)viewConfigure {
    [self layoutIfNeeded];
    NSInteger itemCount = _dataSource.count;
    
    if (!_scrollView) {
        [self scrollViewConfigure];
    }
    
    if (!_firstImageView && itemCount) {
        _firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, SELF_WIDTH, SELF_HEIGHT)];
        _firstImageView.contentMode = UIViewContentModeScaleAspectFill;
        _firstImageView.clipsToBounds = YES;
        [_scrollView addSubview:_firstImageView];
    }
    if (!_centerImageView) {
        _centerImageView = [[UIImageView alloc] init];
        _centerImageView.contentMode = UIViewContentModeScaleAspectFill;
        _centerImageView.clipsToBounds = YES;
        [_scrollView addSubview:_centerImageView];
    }
    if (!_lastImageView && itemCount) {
        _lastImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SELF_WIDTH*2, 0.0f, SELF_WIDTH, SELF_HEIGHT)];
        _lastImageView.contentMode = UIViewContentModeScaleAspectFill;
        _lastImageView.clipsToBounds = YES;
        [_scrollView addSubview:_lastImageView];
    }
    
    if (itemCount == 1) {
        [_firstImageView removeFromSuperview];
        _firstImageView = nil;
        [_lastImageView removeFromSuperview];
        _lastImageView = nil;
    }
    
    _scrollView.frame = CGRectMake(0.0f, 0.0f, SELF_WIDTH, SELF_HEIGHT);
    _centerImageView.frame = CGRectMake((itemCount ? SELF_WIDTH : 0.0f), 0.0f, SELF_WIDTH, SELF_HEIGHT);
    _scrollView.scrollEnabled = itemCount >> 1;
    [self display];
}

- (void)scrollViewConfigure {
    _scrollView = [self scrollViewInstance];
    [self addSubview:_scrollView];
    
    [self configureFirstAvailableViewController];
}

- (void)configureFirstAvailableViewController {
    UIViewController *viewController = [_scrollView firstAvailableUIViewController];
    NSArray *subViews = viewController.view.subviews;
    __block NSUInteger count = 0;
    [subViews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            count ++;
        }
    }];
    if (!count) {
        viewController.edgesForExtendedLayout -= 1;
    }
}

- (UIScrollView *)scrollViewInstance {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(SELF_WIDTH * 3, 0.0f);
    [scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer)]];
    return scrollView;
}

#pragma mark - Setter And Getter Methods
- (NSInteger)index {
    return _manager.currentItem.index;
}

- (void)setDataSource:(NSArray *)dataSource {
    if (dataSource.count) {
        _dataSource = dataSource;
        _manager.dataSource = dataSource;
    }
    [self viewConfigure];
}

#pragma mark - Public Methods
- (void)show:(void(^)(NSInteger))taped scrolled:(void(^)(NSInteger))scrolled {
    [self showWithAutoScroll:NO taped:taped scrolled:scrolled];
}

- (void)showWithAutoScroll:(BOOL)autoScroll taped:(void(^)(NSInteger))taped scrolled:(void(^)(NSInteger))scrolled {
    _autoScroll    = autoScroll;
    _tapedBlock    = taped;
    _scrolledBlock = scrolled;
}

#pragma mark - Private Methods
- (void)display {
    [self handelInitConfigImageView:_firstImageView];
    [self handelInitConfigImageView:_centerImageView];
    [self handelInitConfigImageView:_lastImageView];
    [self refreshImage];
}

- (void)handelInitConfigImageView:(UIImageView *)imageView {
    if (imageView) {
        imageView.backgroundColor = [UIColor clearColor];
        imageView.image = _defaultImage;
    }
}

/**
 *  单击事件
 */
- (void)tapGestureRecognizer {
    if (_tapedBlock) {
        _tapedBlock(_manager.currentItem.index);
    }
}

/**
 *  左滑事件
 */
- (void)swipeLeft {
    [_manager swipeRight];
    [self refreshImage];
    if (_scrolledBlock) {
        _scrolledBlock(_manager.currentItem.index);
    }
}

/**
 *  右滑事件
 */
- (void)swipeRight {
    [_manager swipeLeft];
    [self refreshImage];
    if (_scrolledBlock) {
        _scrolledBlock(_manager.currentItem.index);
    }
}

/**
 *  刷新三个子视图所显示的Image
 */
- (void)refreshImage {
    [_manager.currentItem request:^(SCLoopItem *item) {
        _centerImageView.image = [UIImage imageWithData:item.data];
        if (_dataSource.count > 1) {
            if (item.preItem) {
                [item.preItem request:^(SCLoopItem *item) {
                    _firstImageView.image = [UIImage imageWithData:item.data];
                }];
            } else {
                _firstImageView.image = nil;
            }
            
            if (item.nextItem) {
                [item.nextItem request:^(SCLoopItem *item) {
                    _lastImageView.image = [UIImage imageWithData:item.data];
                }];
            } else {
                _lastImageView.image = nil;
            }
        }
    }];
    [self resetOffset];
}

/**
 *  重设ScrollView偏移位置
 */
- (void)resetOffset {
    _scrollView.contentOffset = CGPointMake(((_dataSource.count > 1) ? SELF_WIDTH : 0.0f), 0.0f);
}

#pragma mark - UISrollView Delegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    if (offsetX <= MIN_BORDER) {
        [self swipeRight];
    } else if (offsetX >= MAX_BORDER) {
        [self swipeLeft];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    // 防止滚动结束后的卡顿处理
    if (scrollView.contentOffset.x/SELF_WIDTH) {
        [self resetOffset];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 防止滚动结束后的卡顿处理
    if (scrollView.contentOffset.x/SELF_WIDTH) {
        [self resetOffset];
    }
}

@end
