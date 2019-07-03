//
//  YLTabbarManager.m
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/21.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "YLTabbarManager.h"
#import "JMTabBarController.h"
#import "YLMessageViewController.h"
#import "YLContactsViewController.h"
#import "YLDiscoverViewController.h"
#import "YLMineViewController.h"

@interface YLTabbarManager()

@end

@implementation YLTabbarManager

static YLTabbarManager *manager = nil;

+(instancetype)shareInstance{
   
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[super allocWithZone:NULL] init];
    });
    
    return manager;
    
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    return [YLTabbarManager shareInstance];
}

-(JMTabBarController *)tabbar{

    YLMessageViewController *message = [[YLMessageViewController alloc]init];
    UINavigationController *nav0 = [[UINavigationController alloc]initWithRootViewController:message];
    YLContactsViewController *contact = [[YLContactsViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:contact];
    YLDiscoverViewController *discover = [[YLDiscoverViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:discover];
    YLMineViewController *mine = [[YLMineViewController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:mine];
    JMConfig *config = [[JMConfig alloc]init];
    config.selTitleColor = [UIColor greenColor];
    config.isClearTabBarTopLine = YES;
    config.tabBarTopLineColor = [UIColor grayColor];
    config.tabBarBackground = [UIColor lightTextColor];
    NSArray *controllers = @[nav0,nav1,nav2,nav3];
    NSArray *images = @[@"tabbar_0",@"tabbar_1",@"tabbar_2",@"tabbar_3"];
    NSArray *selImages = @[@"tabbar_hl_0",@"tabbar_hl_1",@"tabbar_hl_2",@"tabbar_hl_3"];
    NSArray *titles = @[@"微信",@"联系人",@"发现",@"我的"];

    JMTabBarController *tabbar = [[JMTabBarController alloc]initWithTabBarControllers:controllers NorImageArr:images SelImageArr:selImages TitleArr:titles Config:config];

    return tabbar;
}
@end
