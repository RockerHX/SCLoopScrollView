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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"SCLoopScrollView";
    
    NSArray *images = @[@"https://raw.githubusercontent.com/shicang1990/SCLoopScrollView/master/Images.xcassets/1.imageset/1%402x.png",
                        [UIImage imageNamed:@"3"],
                        @"https://raw.githubusercontent.com/shicang1990/SCLoopScrollView/master/Images.xcassets/2.imageset/2%402x.png",
                        [UIImage imageNamed:@"4"],
                        @"https://raw.githubusercontent.com/shicang1990/SCLoopScrollView/master/Images.xcassets/5.imageset/5%402x.png"];
    
    SCLoopScrollView *scrollView = [[SCLoopScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.width*0.75)];
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
