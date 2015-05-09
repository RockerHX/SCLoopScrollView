//
//  SCLoopManager.h
//
//  Created by ShiCang on 15/5/8.
//  Copyright (c) 2015年 ShiCang. All rights reserved.
//

#import "SCLoopItem.h"

@interface SCLoopManager : NSObject

@property (nonatomic, strong)              NSArray *images;         // 图片显示集合，可添加NSString和UIImage实例用于图片显示，NSString仅是可用的图片链接
@property (nonatomic, strong, readonly)    NSArray *items;          // 用于存储图片显示数据的集合
@property (nonatomic, strong, readonly) SCLoopItem *currentItem;    // 呈现给用户的图片数据结构

/**
 *  向左移动数据结构位置
 */
- (void)moveLeft;

/**
 *  向右移动数据结构位置
 */
- (void)moveRight;

@end
