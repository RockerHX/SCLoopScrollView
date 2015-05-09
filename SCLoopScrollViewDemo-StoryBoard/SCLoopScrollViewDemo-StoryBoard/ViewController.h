//
//  ViewController.h
//  SCLoopScrollViewDemo-StoryBoard
//
//  Created by ShiCang on 15/3/20.
//  Copyright (c) 2015年 SCLoopScrollViewDemo-StoryBoard. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SCLoopScrollView;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet SCLoopScrollView *scrollView;
@property (weak, nonatomic) IBOutlet          UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet          UILabel *tapLabel;

@end

