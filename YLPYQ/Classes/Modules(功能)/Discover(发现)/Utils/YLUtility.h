//
//  YLUtility.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/7/3.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLUtility : NSObject
// 朋友圈动态时间
+ (NSString *)getMomentTime:(long long)timestamp;
// 消息时间
+ (NSString *)getMessageTime:(long long)timestamp;
// 获取单张图片的实际size
+ (CGSize)getMomentImageSize:(CGSize)size;
// 颜色转图片
+ (UIImage *)imageWithRenderColor:(UIColor *)color renderSize:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
