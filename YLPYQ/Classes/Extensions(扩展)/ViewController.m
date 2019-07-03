//
//  ViewController.m
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/19.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "ViewController.h"
#import "YLMessageViewController.h"
#import "YLContactsViewController.h"
#import "YLDiscoverViewController.h"
#import "YLMineViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tabBar.layer.borderWidth = 0.5;
    self.tabBar.layer.borderColor = [[UIColor colorWithRed:215.0 green:215.0 blue:215.0 alpha:1] CGColor];
    self.tabBar.tintColor = [UIColor colorWithRed:14.0 green:178.0 blue:10.0 alpha:1];
    [self.tabBar setBackgroundImage:[self imageWithRenderColor:[UIColor whiteColor] renderSize:CGSizeMake(3, 3)]];
    
    // 初始化
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [MomentUtil initMomentData];
    });
    
    // 控制器
    YLMessageViewController *message = [[YLMessageViewController alloc]init];
    YLContactsViewController *contact = [[YLContactsViewController alloc]init];
    YLDiscoverViewController *discover = [[YLDiscoverViewController alloc]init];
    YLMineViewController *mine = [[YLMineViewController alloc]init];
    NSArray * controllers = @[message,contact,discover,mine];
    // tabbar
    NSArray * titles = @[@"微信",@"通讯录",@"发现",@"我"];
    NSMutableArray * viewControllers = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i ++)
    {
        // 图片
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%d",i]];
        UIImage * selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"tabbar_hl_%d",i]];
        // 项
        UITabBarItem * item = [[UITabBarItem alloc] initWithTitle:titles[i] image:image selectedImage:selectedImage];
        [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:10.0]} forState:UIControlStateNormal];
        // 控制器
        UIViewController * controller = controllers[i];
        controller.title = [titles objectAtIndex:i];
        controller.tabBarItem = item;
        // 导航
        UINavigationController * navigation = [[UINavigationController alloc] initWithRootViewController:controller];
        navigation.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:19.0]};
        [navigation.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigaitonbar"] forBarMetrics:UIBarMetricsDefault];
        navigation.navigationBar.tintColor = [UIColor whiteColor];
        navigation.navigationBar.barStyle = UIBarStyleBlackOpaque;
        navigation.navigationBar.translucent = NO;
        [viewControllers addObject:navigation];
    }
    self.viewControllers = viewControllers;
}

// 颜色转图片
- (UIImage *)imageWithRenderColor:(UIColor *)color renderSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [color setFill];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark -
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
