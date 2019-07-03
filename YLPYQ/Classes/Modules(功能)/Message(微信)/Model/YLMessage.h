//
//  YLMessage.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/7/1.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "JKDBModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLMessage : JKDBModel
// 名字
@property (nonatomic, copy) NSString * userName;
// 头像路径
@property (nonatomic, copy) NSString * userPortrait;
// 名字
@property (nonatomic, copy) NSString * content;
// 时间戳
@property (nonatomic, assign) long long time;
@end

NS_ASSUME_NONNULL_END
