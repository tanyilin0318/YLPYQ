//
//  YLPicture.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/25.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "JKDBModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLPicture : JKDBModel
/*
 图片路径
 */
@property (nonatomic,copy) NSString *thumbnail;
@end

NS_ASSUME_NONNULL_END
