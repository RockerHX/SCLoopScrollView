##SCLoopScrollView

A View Can Infinite Loop Scroll.
SCLoopScrollView can infinite loop scroll.

You can use Storyboard or init by yourself.
-----------------

Init By Yourself
```{bash}
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
```

Init By Storyboard
```{bash}
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
```
