//
//  ViewController.m
//  SCLoopScrollViewDemo-OC
//
//  Created by ShiCang on 15/3/20.
//  Copyright (c) 2015年 SCLoopScrollViewDemo-OC. All rights reserved.
//

#import "ViewController.h"
#import "SCLoopScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Demo";
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    NSMutableArray *subViews = [@[] mutableCopy];
    for (NSInteger index = 0; index < 3; index++)
    {
        UIImageView *view = [[UIImageView alloc] init];
        view.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", @(index)]];
        view.backgroundColor = [UIColor redColor];
        [subViews addObject:view];
    }
    
    SCLoopScrollView *scrollView = [[SCLoopScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 300.0f)];
    [self.view addSubview:scrollView];
    scrollView.items = subViews;
    [scrollView begin:^(NSInteger index) {
        NSLog(@"%@", @(index));
    } finished:nil];
    
    //    [_scrollView beginWithAutoScroll:YES animation:YES tap:^(NSInteger index) {
    //        NSLog(@"%@", @(index));
    //    } finished:nil];
    
}

@end
