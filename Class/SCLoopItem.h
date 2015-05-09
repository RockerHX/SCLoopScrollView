//
//  SCLoopItem.h
//
//  Created by ShiCang on 15/5/8.
//  Copyright (c) 2015年 ShiCang. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;
@interface SCLoopItem : NSObject

@property (nonatomic, assign, readonly)  NSInteger  index;  // 位置索引
@property (nonatomic, strong, readonly)   NSString *url;    // 网络图片链接
@property (nonatomic, strong, readonly)     NSData *data;   // 图片二进制数据

@property (nonatomic, weak) SCLoopItem *preItem;            // 前节点
@property (nonatomic, weak) SCLoopItem *nextItem;           // 后节点


/**
 *  初始化方法
 *
 *  @param url   网络图片链接
 *  @param index 位置索引
 */
- (instancetype)initWithUrl:(NSString *)url
                      index:(NSInteger)index;

/**
 *  初始化方法
 *
 *  @param image 本地图片
 *  @param index 位置索引
 */
- (instancetype)initWithImage:(UIImage *)image
                        index:(NSInteger)index;

/**
 *  请求图片数据
 *
 *  @param block 请求成功后的回调
 */
- (void)request:(void(^)(SCLoopItem *item))block;

@end
