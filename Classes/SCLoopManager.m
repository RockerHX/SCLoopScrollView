//
//  SCLoopManager.m
//
//  Created by ShiCang on 15/5/8.
//  Copyright (c) 2015年 ShiCang. All rights reserved.
//

#import "SCLoopManager.h"

@import UIKit;
@implementation SCLoopManager

#pragma mark - Setter And Getter Methods
- (void)setImages:(NSArray *)images {
    if (images.count) {
        _images = images;
        _items = @[];
        [self generateItemsWithObjects:images];
    }
}

#pragma mark - Public Methods
- (void)moveLeft {
    if (_currentItem.preItem) {
        _currentItem = _currentItem.preItem;
    }
}

- (void)moveRight
{
    if (_currentItem.nextItem) {
        _currentItem = _currentItem.nextItem;
    }
}

#pragma mark - Private Methods
/**
 *  生成图片显示的数据结构对象
 *
 *  @param objects 数据源集合
 */
- (void)generateItemsWithObjects:(NSArray *)objects
{
    // 生成双向了链表结构
    for (NSInteger index = 0; index < objects.count; index++)
    {
        id object = objects[index];
        SCLoopItem *item = nil;
        if ([object isKindOfClass:[NSString class]])
            item = [[SCLoopItem alloc] initWithUrl:object index:index];
        else if ([object isKindOfClass:[UIImage class]])
            item = [[SCLoopItem alloc] initWithImage:object index:index];
        [self pushItem:item];
    }
    // 链表结构首尾关联
    SCLoopItem *firstItem = _items.firstObject;
    SCLoopItem *lastItem  = _items.lastObject;
    firstItem.preItem = lastItem;
    lastItem.nextItem = firstItem;
    _currentItem = firstItem;
}

/**
 *  压栈和链表关联操作
 *
 *  @param item 数据对象
 */
- (void)pushItem:(SCLoopItem *)item
{
    if (item)
    {
        NSMutableArray *items = [_items mutableCopy];
        SCLoopItem *lastItem = items.lastObject;
        lastItem.nextItem = item;
        item.preItem = lastItem;
        [items addObject:item];
        _items = items;
    }
}

@end
