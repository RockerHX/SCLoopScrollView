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
![](https://raw.githubusercontent.com/shicang1990/SCLoopScrollView/master/ScreenShot/SCLoopScrollView.png)

## How To Use
### Init By Yourself
```objc
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
```

### Init By Storyboard
```objc
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
![](https://raw.githubusercontent.com/shicang1990/SCLoopScrollView/master/ScreenShot/SCLoopScrollView.png)

## Code
### 手动编码
```objc
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
```

### 通过故事板
```objc
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
```

