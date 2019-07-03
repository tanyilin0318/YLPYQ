//
//  YLLocation.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/25.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "JKDBModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLLocation : JKDBModel
/*
 发布位置 地标
 */
@property (nonatomic,copy) NSString *landmark;
/*
 发布位置详细地址
 */
@property (nonatomic,copy) NSString *address;
/*
 发布位置 eg 杭州—雷芳
 */
@property (nonatomic,copy) NSString *position;
/*
 经度
 */
@property (nonatomic,assign) double longitude;
/*
 纬度
 */
@property (nonatomic,assign) double latitude;
@end

NS_ASSUME_NONNULL_END
