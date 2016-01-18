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
    
    self.title = @"SCLoopScrollView";
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    NSArray *images = @[@"http://e.hiphotos.baidu.com/image/w%3D310/sign=429b5adbbb014a90813e40bc99763971/622762d0f703918ffc60d8a3533d269759eec422.jpg",
                        [UIImage imageNamed:@"0"],
                        @"http://g.hiphotos.baidu.com/image/w%3D310/sign=9b62b9f379899e51788e3c1572a6d990/8718367adab44aed80ebd4eab11c8701a18bfb13.jpg",
                        [UIImage imageNamed:@"1"],
                        @"http://f.hiphotos.baidu.com/image/w%3D310/sign=544d5da6324e251fe2f7e2f99787c9c2/0824ab18972bd40720832c6179899e510eb309e1.jpg",
                        @"http://www.huabian.com/uploadfile/2014/1008/20141008103712898.jpg"];
    
    SCLoopScrollView *scrollView = [[SCLoopScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 300.0f)];
    [self.view addSubview:scrollView];
    scrollView.dataSource = images;
    [scrollView show:^(NSInteger index) {
        NSLog(@"Current Index:%@", @(index));
    } finished:^(NSInteger index) {
        NSLog(@"Tap Index:%@", @(index));
    }];
}

@end
