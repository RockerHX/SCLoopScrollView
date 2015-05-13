#
#  Be sure to run `pod spec lint SCLoopScrollView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "SCLoopScrollView"
  s.version      = "0.4.1"
  s.summary      = "A View Can Infinite Loop Scroll."

  s.description  = <<-DESC
                   
                    ##SCLoopScrollView

					##无限循环滚动视图

					> 可以同时在代码和Xib以及Storyboard中使用。

					> 只需要简单的设置一下图片源既可以，三行代码搞定无限循环广告视图。

					> 目前图片源支持图片链接和UIImage实例。
					
					![](http://i1.tietuku.com/7db519b122670a90.gif)

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


                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/shicang1990/SCLoopScrollView"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "ShiCang" => "shicang1990@gmail.com" }
  # Or just: s.author    = "ShiCang"
  # s.authors            = { "ShiCang" => "shicang1990@gmail.com" }
  # s.social_media_url   = "http://twitter.com/ShiCang"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  s.platform     = :ios, "7.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/shicang1990/SCLoopScrollView.git", :tag => "0.4.1" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "SCLoopScrollView", "Class/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
