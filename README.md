## SCLoopScrollView
* A View Can Infinite Loop Scroll.

## Installation
Use the [CocoaPods](http://github.com/CocoaPods/CocoaPods).

In your Podfile
>`pod 'SCLoopScrollView'`

Get SCNumberKeyBoard
>`#import "SCLoopScrollView.h"`

## Or
Drag `SCLoopScrollViewDemo/Classes` folder into your project
>`#import "SCLoopScrollView.h"`

## Previews
![](http://i1.tietuku.com/7db519b122670a90.gif)

## How To Use
### Init By Yourself
```objc
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
```

### Init By Storyboard
```objc
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
```

-----------------

## 无限循环滚动视图
* 可以同时在代码和Xib以及Storyboard中使用。
* 只需要简单的设置一下图片源既可以，三行代码搞定无限循环广告视图。
* 目前图片源支持图片链接和UIImage实例。

## 如何使用SCLoopScrollView
* cocoapods导入：`pod 'SCLoopScrollView'`
* 手动导入：
* 将`SCLoopScrollViewDemo/Classes`文件夹中的所有文件拽入项目中
* 导入主头文件：`#import "SCLoopScrollView.h"`

## 效果图
![](http://i1.tietuku.com/7db519b122670a90.gif)

## Code
### 手动编码
```objc
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
```

### 通过故事板
```objc
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
```

