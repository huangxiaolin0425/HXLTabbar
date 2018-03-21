//
//  HXLTabBar.h
//  HXLTabbar
//
//  Created by Cocav on 2018/3/21.
//  Copyright © 2018年 Cocav. All rights reserved.
//
#import <UIKit/UIKit.h>

@class HXLTabBar;

@protocol HXLTabBarDelegate <NSObject>
@optional
- (void)tabBarPlusBtnClick:(HXLTabBar *)tabBar;
@end


@interface HXLTabBar : UITabBar

/** tabbar的代理 */
@property (nonatomic, weak) id<HXLTabBarDelegate> myDelegate ;

@end
