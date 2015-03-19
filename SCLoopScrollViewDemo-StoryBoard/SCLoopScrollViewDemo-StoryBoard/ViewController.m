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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    NSMutableArray *subViews = [@[] mutableCopy];
    for (NSInteger index = 0; index < 3; index++)
    {
        UIImageView *view = [[UIImageView alloc] init];
        view.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", @(index)]];
        view.backgroundColor = [UIColor redColor];
        [subViews addObject:view];
    }
    
    _scrollView.items = subViews;
    [_scrollView begin:^(NSInteger index) {
        NSLog(@"%@", @(index));
    } finished:nil];
    
//    [_scrollView beginWithAutoScroll:YES animation:YES tap:^(NSInteger index) {
//        NSLog(@"%@", @(index));
//    } finished:nil];
    
}

@end
