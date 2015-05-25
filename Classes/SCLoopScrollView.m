//
//  SCLoopScrollView.m
//  ShiCang
//
//  Created by ShiCang on 15/3/18.
//  Copyright (c) 2015年 ShiCang. All rights reserved.
//

#define ZERO_POINT          0.0f

#define SELF_WIDTH          self.frame.size.width
#define SELF_HEIGHT         self.frame.size.height

#define MIN_BORDER          ZERO_POINT
#define MAX_BORDER          SELF_WIDTH*2

#import "SCLoopScrollView.h"
#import "SCLoopManager.h"

typedef void(^BLOCK)(NSInteger index);

@implementation SCLoopScrollView
{
    BLOCK          _scrollBlock;
    BLOCK          _tapBlock;
    
    SCLoopManager *_manager;
    UIScrollView  *_scrollView;
    UIImageView   *_firstImageView;
    UIImageView   *_centerImageView;
    UIImageView   *_lastImageView;
}

#pragma mark - Init Methods
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initConfig];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initConfig];
    }
    return self;
}

#pragma mark - Config Methods
- (void)initConfig
{
    _manager = [[SCLoopManager alloc] init];
}

- (void)viewConfig
{
    [self layoutIfNeeded];
    // 初始化并配置ScrollView以及其三个子视图ImageView，刷新三个ImageView并显示Image
    if (!_scrollView)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(ZERO_POINT, ZERO_POINT, SELF_WIDTH, SELF_HEIGHT)];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(SELF_WIDTH * 3, ZERO_POINT);
        [_scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer)]];
        [self addSubview:_scrollView];
    }
    if (!_firstImageView)
    {
        _firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ZERO_POINT, ZERO_POINT, SELF_WIDTH, SELF_HEIGHT)];
        [_scrollView addSubview:_firstImageView];
    }
    if (!_centerImageView)
    {
        _centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SELF_WIDTH, ZERO_POINT, SELF_WIDTH, SELF_HEIGHT)];
        [_scrollView addSubview:_centerImageView];
    }
    if (!_lastImageView)
    {
        _lastImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SELF_WIDTH*2, ZERO_POINT, SELF_WIDTH, SELF_HEIGHT)];
        [_scrollView addSubview:_lastImageView];
    }
    _scrollView.scrollEnabled = _images.count >> 1;
    [self display];
}

#pragma mark - Setter And Getter Methods
- (NSInteger)index
{
    return _manager.currentItem.index;
}

- (void)setImages:(NSArray *)images
{
    if (images.count)
    {
        _images = images;
        _manager.images = images;
    }
}

#pragma mark - Public Methods
- (void)show:(void(^)(NSInteger index))tap
    finished:(void(^)(NSInteger index))finished
{
    [self showWithAutoScroll:NO tap:tap finished:finished];
}

- (void)showWithAutoScroll:(BOOL)autoScroll
                       tap:(void(^)(NSInteger index))tap
                  finished:(void(^)(NSInteger index))finished
{
    _autoScroll  = autoScroll;
    _tapBlock    = tap;
    _scrollBlock = finished;
    
    [self viewConfig];
}

#pragma mark - Private Methods
- (void)display
{
    [self handelInitConfigImageView:_firstImageView];
    [self handelInitConfigImageView:_centerImageView];
    [self handelInitConfigImageView:_lastImageView];
    [self refreshImage];
}

- (void)handelInitConfigImageView:(UIImageView *)imageView
{
    imageView.backgroundColor = _defaultImage ? [UIColor clearColor] : [UIColor lightGrayColor];
    imageView.image = _defaultImage;
}

/**
 *  单击事件
 */
- (void)tapGestureRecognizer
{
    if (_tapBlock)
        _tapBlock(_manager.currentItem.index);
}

/**
 *  左滑事件
 */
- (void)swipeLeft
{
    [_manager moveRight];
    [self refreshImage];
    if (_scrollBlock)
        _scrollBlock(_manager.currentItem.index);
}

/**
 *  右滑事件
 */
- (void)swipeRight
{
    [_manager moveLeft];
    [self refreshImage];
    if (_scrollBlock)
        _scrollBlock(_manager.currentItem.index);
}

/**
 *  刷新三个子视图所显示的Image
 */
- (void)refreshImage
{
    [_manager.currentItem request:^(SCLoopItem *item) {
        _centerImageView.image = [UIImage imageWithData:item.data];
        if (_images.count > 1)
        {
            [item.preItem request:^(SCLoopItem *item) {
                _firstImageView.image = [UIImage imageWithData:item.data];
            }];
            [item.nextItem request:^(SCLoopItem *item) {
                _lastImageView.image = [UIImage imageWithData:item.data];
            }];
        }
    }];
    [self resetOffset];
}

/**
 *  重设ScrollView偏移位置
 */
- (void)resetOffset
{
    _scrollView.contentOffset = CGPointMake(SELF_WIDTH, ZERO_POINT);
}

#pragma mark - UISrollView Delegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    if (offsetX <= MIN_BORDER)
        [self swipeRight];
    else if (offsetX >= MAX_BORDER)
        [self swipeLeft];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 防止滚动结束后的卡顿处理
    if (scrollView.contentOffset.x/SELF_WIDTH)
        [self resetOffset];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 防止滚动结束后的卡顿处理
    if (scrollView.contentOffset.x/SELF_WIDTH)
        [self resetOffset];
}

@end
