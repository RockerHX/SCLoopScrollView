//
//  SCLoopScrollView.h
//  ShiCang
//
//  Created by ShiCang on 15/3/18.
//  Copyright (c) 2015年 ShiCang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCLoopScrollView : UIView <UIScrollViewDelegate>

@property (nonatomic, assign, readonly)      BOOL  autoScroll;      // 是否处于自动轮播状态
@property (nonatomic, assign, readonly) NSInteger  index;           // 当前所处位置索引
@property (nonatomic, strong)             NSArray *images;          // 图片显示集合，可添加NSString和UIImage实例用于图片显示，NSString仅是可用的图片链接
@property (nonatomic, strong)             UIImage *defaultImage;    // 默认图片，用于网络图片未加载完成时候的默认显示


/**
 *  展示循环滚动视图
 *
 *  @param tap      点击事件的回调
 *  @param finished 滚动结束后的回调
 */
- (void)show:(void(^)(NSInteger index))tap
    finished:(void(^)(NSInteger index))finished;

/**
 *  展示循环滚动视图
 *
 *  @param autoScroll 能否自动轮播
 *  @param tap        点击事件的回调
 *  @param finished   滚动结束后的回调
 */
- (void)showWithAutoScroll:(BOOL)autoScroll
                       tap:(void(^)(NSInteger index))tap
                  finished:(void(^)(NSInteger index))finished;

@end
