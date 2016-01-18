//
//  SCConstants.h
//  SCLoopScrollViewDemo-StoryBoard
//
//  Created by miaios on 16/1/18.
//  Copyright © 2016年 SCLoopScrollViewDemo-StoryBoard. All rights reserved.
//

#ifndef SCConstants_h
#define SCConstants_h


#define VIEW_WIDTH(view)                (view.frame.size.width)
#define VIEW_HEIGHT(view)               (view.frame.size.height)

#define SELF_WIDTH                      VIEW_WIDTH(self)                                // 获取视图宽度
#define SELF_HEIGHT                     VIEW_HEIGHT(self)                               // 获取视图高度
#define SCREEN_WIDTH                    ([UIScreen mainScreen].bounds.size.width)       // 获取屏幕宽度
#define SCREEN_HEIGHT                   ([UIScreen mainScreen].bounds.size.height)      // 获取屏幕高度

#define STATUS_BAR_HEIGHT               20.0f           // 电池条固定高度
#define BAR_ITEM_WIDTH_HEIGHT           30.0f           // BarItem固定高度
#define NAVIGATION_BAR_HEIGHT           44.0f           // 导航条(NavigationBar)固定高度
#define TAB_TAB_HEIGHT                  49.0f           // Tabbar固定高度


#endif /* SCConstants_h */
