//
//  YLComment.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/25.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "JKDBModel.h"
#import "YLUser.h"
NS_ASSUME_NONNULL_BEGIN

@interface YLComment : JKDBModel
/*
 正文
 */
@property (nonatomic,copy) NSString *text;
/*
 xxx 涞源
 */
@property (nonatomic,strong) YLUser *fromUser;
/*
 回复：目标
 */
@property (nonatomic,strong) YLUser *toUser;
/*
 来源id
 */
@property (nonatomic,assign) NSInteger fromId;
/*
 回复：目标id
 */
@property (nonatomic,assign) NSInteger toId;

+ (NSArray *)transients;
@end

NS_ASSUME_NONNULL_END
