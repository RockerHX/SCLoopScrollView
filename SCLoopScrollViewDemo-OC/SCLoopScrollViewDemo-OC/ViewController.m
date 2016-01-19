//
//  ViewController.m
//  SCLoopScrollViewDemo-OC
//
//  Created by ShiCang on 15/3/20.
//  Copyright (c) 2015年 SCLoopScrollViewDemo-OC. All rights reserved.
//

#import "ViewController.h"
#import "SCLoopScrollView.h"
#import "SCConstants.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"SCLoopScrollView";
    
    NSArray *images = @[@"http://i8.tietuku.com/a6542887e864efc0.jpg",
                        [UIImage imageNamed:@"3"],
                        @"http://i8.tietuku.com/5730f7ebadae2c41.jpg",
                        [UIImage imageNamed:@"4"],
                        @"http://i8.tietuku.com/149caebe062fc98c.jpg"];
    
    SCLoopScrollView *scrollView = [[SCLoopScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, SCREEN_WIDTH*0.75)];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:scrollView];
    scrollView.dataSource = images;
    [scrollView show:^(NSInteger index) {
        NSLog(@"Tap Index:%@", @(index));
    } scrolled:^(NSInteger index) {
        NSLog(@"Current Index:%@", @(index));
    }];
}

@end
