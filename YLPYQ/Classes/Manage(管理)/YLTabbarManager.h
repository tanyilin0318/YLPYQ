//
//  YLTabbarManager.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/21.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class JMTabBarController;
@interface YLTabbarManager : NSObject


+(instancetype)shareInstance;

-(JMTabBarController *)tabbar;

@end

NS_ASSUME_NONNULL_END
