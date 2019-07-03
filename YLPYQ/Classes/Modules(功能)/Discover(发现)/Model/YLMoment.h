//
//  YLMoment.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/25.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "JKDBModel.h"
#import "YLUser.h"
#import "YLLocation.h"
#import "YLPicture.h"
#import "YLComment.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLMoment : JKDBModel

/*
 正文
 */
@property (nonatomic,copy) NSString *text;
/*
 发布时间
 */
@property (nonatomic,assign) NSInteger time;
/*
 d单张图片宽度 用于预设图片尺寸
 */
@property (nonatomic,assign) CGFloat singleWidth;
/*
 单张图片高度 用于预设图片尺寸
 */
@property (nonatomic,assign) CGFloat singleHeight;
/*
 是否点赞
 */
@property (nonatomic,assign) BOOL isLike;
/*
 全文 / 收起
 */
@property (nonatomic,assign) BOOL isFullText;
/*
 发布者
 */
@property (nonatomic,strong) YLUser *user;
/*
 位置信息
 */
@property (nonatomic,strong) YLLocation *location;
/*
 点赞集合
 */
@property (nonatomic,strong) NSArray<YLUser *> *likeList;
/*
 评论集合
 */
@property (nonatomic,strong) NSArray<YLComment *> *commentList;
/*
 图片集合
 */
@property (nonatomic,strong) NSArray<YLPicture *> *pictureList;

// ## 关连
/*
 发布者ids
 */
@property (nonatomic,assign) long userID;
/*
 点赞用户ids
 */
@property (nonatomic,copy) NSString *likeIds;
/*
 评论用户ids
 */
@property (nonatomic,copy) NSString *commentIds;
/*
 图片ids
 */
@property (nonatomic,copy) NSString *pictureIds;


/*
 Moment对应 cell高度
 */
@property (nonatomic,assign) CGFloat rowHeight;





+ (NSArray *)transients;


@end

NS_ASSUME_NONNULL_END
