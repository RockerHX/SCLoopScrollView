##SCLoopScrollView

##无限循环滚动视图

> 可以同时在代码和Xib以及Storyboard中使用。
> 只需要简单的设置一下图片源既可以，三行代码搞定无限循环广告视图。
> 目前图片源支持图片链接和UIImage实例。

-----------------

Init By Yourself
```{bash}
    NSArray *images = @[@"http://e.hiphotos.baidu.com/image/w%3D310/sign=429b5adbbb014a90813e40bc99763971/622762d0f703918ffc60d8a3533d269759eec422.jpg",
    [UIImage imageNamed:@"0"],
    @"http://g.hiphotos.baidu.com/image/w%3D310/sign=9b62b9f379899e51788e3c1572a6d990/8718367adab44aed80ebd4eab11c8701a18bfb13.jpg",
    [UIImage imageNamed:@"1"],
    @"http://f.hiphotos.baidu.com/image/w%3D310/sign=544d5da6324e251fe2f7e2f99787c9c2/0824ab18972bd40720832c6179899e510eb309e1.jpg",
    @"http://www.huabian.com/uploadfile/2014/1008/20141008103712898.jpg"];

    SCLoopScrollView *scrollView = [[SCLoopScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 300.0f)];
    [self.view addSubview:scrollView];
    scrollView.images = images;
    [scrollView show:^(NSInteger index) {
    NSLog(@"%@", @(index));
    } finished:^(NSInteger index) {
    NSLog(@"%@", @(index));
    }];
```

Init By Storyboard
```{bash}
    NSArray *images = @[@"http://e.hiphotos.baidu.com/image/w%3D310/sign=429b5adbbb014a90813e40bc99763971/622762d0f703918ffc60d8a3533d269759eec422.jpg",
    [UIImage imageNamed:@"0"],
    @"http://g.hiphotos.baidu.com/image/w%3D310/sign=9b62b9f379899e51788e3c1572a6d990/8718367adab44aed80ebd4eab11c8701a18bfb13.jpg",
    [UIImage imageNamed:@"1"],
    @"http://f.hiphotos.baidu.com/image/w%3D310/sign=544d5da6324e251fe2f7e2f99787c9c2/0824ab18972bd40720832c6179899e510eb309e1.jpg",
    @"http://www.huabian.com/uploadfile/2014/1008/20141008103712898.jpg"];

    _scrollView.images = images;
    [_scrollView show:^(NSInteger index) {
    NSLog(@"%@", @(index));
    } finished:^(NSInteger index) {
    NSLog(@"%@", @(index));
    }];
```
