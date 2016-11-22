//
//  ViewController.m
//  SCLoopScrollViewDemo-StoryBoard
//
//  Created by ShiCang on 15/3/20.
//  Copyright (c) 2015年 SCLoopScrollViewDemo-StoryBoard. All rights reserved.
//

#import "ViewController.h"
#import "SCLoopScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *images = @[@"https://raw.githubusercontent.com/shicang1990/SCLoopScrollView/master/Images.xcassets/1.imageset/1%402x.png",
                        [UIImage imageNamed:@"3"],
                        @"https://raw.githubusercontent.com/shicang1990/SCLoopScrollView/master/Images.xcassets/2.imageset/2%402x.png",
                        [UIImage imageNamed:@"4"],
                        @"https://raw.githubusercontent.com/shicang1990/SCLoopScrollView/master/Images.xcassets/5.imageset/5%402x.png"];
    
    _scrollView.dataSource = images;
    
    __weak __typeof__(self)weakSelf = self;
    [_scrollView show:^(NSInteger index) {
        __strong __typeof__(self)strongSelf = weakSelf;
        strongSelf.tapLabel.text = @(index).stringValue;
    } scrolled:^(NSInteger index) {
        __strong __typeof__(self)strongSelf = weakSelf;
        strongSelf.indexLabel.text = @(index).stringValue;
    }];
}

@end
