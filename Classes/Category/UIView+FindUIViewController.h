//
//  UIView+FindUIViewController.h
//  SCLoopScrollViewDemo-OC
//
//  Created by miaios on 16/1/18.
//  Copyright © 2016年 SCLoopScrollViewDemo-OC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FindUIViewController)

- (UIViewController *)firstAvailableViewController;
- (instancetype)traverseResponderChainForViewController;

@end