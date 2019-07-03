//
//  MomentUtil.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/7/1.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface MomentUtil : NSObject
// 获取动态集合
+ (NSArray *)getMomentList:(int)momentId pageNum:(int)pageNum;
// 获取字符数组
+ (NSString *)getLikeString:(YLMoment *)moment;

// id集合
+ (NSArray *)getIdListByIds:(NSString *)ids;
// ids
+ (NSString *)getIdsByIdList:(NSArray *)idList;

// 初始化
+ (void)initMomentData;
@end

NS_ASSUME_NONNULL_END
