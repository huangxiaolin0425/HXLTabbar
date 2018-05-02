//
//  HXLTabBarController.m
//  HXLTabbar
//
//  Created by Cocav on 2018/3/21.
//  Copyright © 2018年 Cocav. All rights reserved.
//
#import "HXLTabBarController.h"
#import "HXLNavigationController.h"

#import "oneViewController.h"
#import "twoViewController.h"
#import "threeViewController.h"
#import "fourViewController.h"
#import "fiveViewController.h"
#import "HXLTabBar.h"
#import "UIImage+Image.h"
#import "UIButton+Property.h"

@interface HXLTabBarController ()<HXLTabBarDelegate>

@end

@implementation HXLTabBarController

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize
{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildVc];
    
    
    
    
}


#pragma mark - ------------------------------------------------------------------
#pragma mark - 初始化tabBar上除了中间按钮之外所有的按钮

- (void)setUpAllChildVc
{
    
    
    oneViewController *HomeVC = [[oneViewController alloc] init];
    [self setUpOneChildVcWithVc:HomeVC Image:@"home_normal" selectedImage:@"home_highlight" title:@"1"];
    
    twoViewController *FishVC = [[twoViewController alloc] init];
    [self setUpOneChildVcWithVc:FishVC Image:@"fish_normal" selectedImage:@"fish_highlight" title:@"2"];
    
    
    
    threeViewController *MessageVC = [[threeViewController alloc] init];
    [self setUpOneChildVcWithVc:MessageVC Image:@"message_normal" selectedImage:@"message_highlight" title:@"3"];
    
    fourViewController *MineVC = [[fourViewController alloc] init];
    [self setUpOneChildVcWithVc:MineVC Image:@"account_normal" selectedImage:@"account_highlight" title:@"4"];
    
    fiveViewController *plusVC = [[fiveViewController alloc] init];
    [self setUpOneChildVcWithVc:plusVC Image:@"fish_normal" selectedImage:@"fish_highlight" title:@"5"];
    
    //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
    HXLTabBar *tabbar = [[HXLTabBar alloc] init];
    tabbar.myDelegate = self;
    //kvc实质是修改了系统的_tabBar
    [self setValue:tabbar forKeyPath:@"tabBar"];
}

#pragma mark - 初始化设置tabBar上面单个按钮的方法

/**
 *  @author li bo, 16/05/10
 *
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    HXLNavigationController *nav = [[HXLNavigationController alloc] initWithRootViewController:Vc];
    
    
    Vc.view.backgroundColor = [self randomColor];
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    
    Vc.navigationItem.title = title;
    
    [self addChildViewController:nav];
    
}



#pragma mark - ------------------------------------------------------------------
#pragma mark - LBTabBarDelegate
//点击中间按钮的代理方法
- (void)tabBarPlusBtnClick:(HXLTabBar *)tabBar andItem:(UIButton *)btn
{
    
    //
    //    LBpostViewController *plusVC = [[LBpostViewController alloc] init];
    //    plusVC.view.backgroundColor = [self randomColor];
    //
    //    LBNavigationController *navVc = [[LBNavigationController alloc] initWithRootViewController:plusVC];
    //
    //    [self presentViewController:navVc animated:YES completion:nil];
    if([btn.anima isEqualToString:@"1"]){
        [UIView animateWithDuration:1 animations:^{
            [btn.layer removeAllAnimations];
            btn.transform=CGAffineTransformIdentity;
        }];
        btn.anima=@"0";
    }
    self.selectedIndex=4;
    
}


- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
}

@end

