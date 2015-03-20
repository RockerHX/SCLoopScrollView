//
//  SCLoopScrollView.m
//  ShiCang
//
//  Created by ShiCang on 15/3/18.
//  Copyright (c) 2015年 ShiCang. All rights reserved.
//


#define ZERO                0
#define ZERO_POINT          0.0f

#define SELF_WIDTH          self.frame.size.width
#define SELF_HEIGHT         self.frame.size.height

#define MIN_BORDER          SELF_WIDTH
#define MAX_BORDER          (_items.count + 1) * SELF_WIDTH


#import "SCLoopScrollView.h"

typedef void(^BLOCK)(NSInteger index);

@implementation SCLoopScrollView
{
    BOOL          _animation;
    BLOCK         _scrollBlock;
    BLOCK         _tapBlock;
    NSInteger     _oldIndex;
    
    UIScrollView *_scrollView;
    UIImageView  *_firstItem;
    UIImageView  *_lastItem;
}

#pragma mark - layout Methods
- (void)layoutSubviews
{
    [self viewConfig];
}

#pragma mark - Config Methods
- (void)initConfig
{
    _oldIndex = -1;
}

- (void)viewConfig
{
    if (!_scrollView)
    {
        _scrollView                                = [[UIScrollView alloc] initWithFrame:(CGRect){ZERO_POINT, ZERO_POINT, SELF_WIDTH, SELF_HEIGHT}];
        _scrollView.delegate                       = self;
        _scrollView.pagingEnabled                  = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator   = NO;
        [self addSubview:_scrollView];
        [self displayView];
    }
}

#pragma mark - Setter And Getter Methods
- (void)setIndex:(NSInteger)index
{
    if ((index != _oldIndex) && _scrollBlock)
        _scrollBlock(index);
    _oldIndex = index;
}

- (void)setItems:(NSArray *)items
{
    [self clearSubviews];
    _items = items;
}

#pragma mark - Public Methods
- (void)begin:(void(^)(NSInteger index))tap
     finished:(void(^)(NSInteger index))finished
{
    [self beginWithAutoScroll:NO animation:NO tap:tap finished:finished];
}

- (void)beginWithAutoScroll:(BOOL)autoScroll
                  animation:(BOOL)animation
                        tap:(void(^)(NSInteger index))tap
                   finished:(void(^)(NSInteger index))finished
{
    _tapBlock    = nil;
    _scrollBlock = nil;
    _autoScroll  = autoScroll;
    _animation   = animation;
    _tapBlock    = tap;
    _scrollBlock = finished;
    
    [self displayView];
}

#pragma mark - Private Methods
- (void)clearSubviews
{
    for (UIView *item in _items)
    {
        [item removeFromSuperview];
    }
    [_firstItem removeFromSuperview];
    [_lastItem removeFromSuperview];
    
    _items     = nil;
    _firstItem = nil;
    _lastItem  = nil;
}

- (BOOL)canBeginLoad
{
    if (!_scrollView)
        return NO;
    
    if (_items.count)
    {
        for (UIView *item in _items)
        {
            if (![item isKindOfClass:[UIImageView class]])
            {
                NSLog(@"All item's class must be UIImageView in items.");
                return NO;
            }
        }
        return YES;
    }
    NSLog(@"Items is empty.");
    return NO;
}

- (void)reloadSubViews
{
    if ([self canBeginLoad])
    {
        [_scrollView setContentSize:CGSizeMake(SELF_WIDTH * (_items.count + 2), ZERO_POINT)];
        
        UIImage *lastImage                = ((UIImageView *)[_items lastObject]).image;
        _firstItem                        = [[UIImageView alloc] initWithFrame:CGRectMake(ZERO_POINT, ZERO_POINT, SELF_WIDTH, SELF_HEIGHT)];
        _firstItem.tag                    = _items.count - 1;
        _firstItem.image                  = lastImage;
        _firstItem.userInteractionEnabled = YES;
        [_firstItem addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer:)]];
        [_scrollView addSubview:_firstItem];
        
        [_items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            UIView *view                = obj;
            view.frame                  = CGRectMake(SELF_WIDTH * (idx + 1), ZERO_POINT, SELF_WIDTH, SELF_HEIGHT);
            view.tag                    = idx;
            view.userInteractionEnabled = YES;
            [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer:)]];
            [_scrollView addSubview:view];
        }];
        
        UIImage *firstImage              = ((UIImageView *)[_items firstObject]).image;
        _lastItem                        = [[UIImageView alloc] initWithFrame:CGRectMake(SELF_WIDTH * (_items.count + 1), ZERO_POINT, SELF_WIDTH, SELF_HEIGHT)];
        _lastItem.tag                    = ZERO;
        _lastItem.image                  = firstImage;
        _lastItem.userInteractionEnabled = YES;
        [_lastItem addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer:)]];
        [_scrollView addSubview:_lastItem];
        
        [_scrollView setContentOffset:CGPointMake(SELF_WIDTH, ZERO_POINT)];
    }
}

- (void)displayView
{
    _scrollView.scrollEnabled = _items.count >> 1;
    
    [self reloadSubViews];
}

- (NSInteger)getCurrentIndex:(NSInteger)index
{
    if (index >= _items.count)
        return 0;
    else if (index < 0)
        return _items.count;
    else
        return index;
}

- (void)tapGestureRecognizer:(UITapGestureRecognizer *)tap
{
    if (_tapBlock)
        _tapBlock(tap.view.tag);
}

#pragma mark - UISrollView Delegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x < MIN_BORDER)
    {
        [scrollView setContentOffset:CGPointMake(MAX_BORDER, ZERO_POINT)];
    }
    else if (scrollView.contentOffset.x > MAX_BORDER)
    {
        [scrollView setContentOffset:CGPointMake(MIN_BORDER, ZERO_POINT)];
    }
    NSInteger index = (scrollView.contentOffset.x / SELF_WIDTH) - 1;
    self.index = [self getCurrentIndex:index];
}

@end
