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
    
    NSArray *images = @[@"http://i8.tietuku.com/a6542887e864efc0.jpg",
                        [UIImage imageNamed:@"3"],
                        @"http://i8.tietuku.com/5730f7ebadae2c41.jpg",
                        [UIImage imageNamed:@"4"],
                        @"http://i8.tietuku.com/149caebe062fc98c.jpg"];
    
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
