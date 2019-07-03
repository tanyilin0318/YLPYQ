//
//  MomentConstant.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/28.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MMOperateType) {
    MMOperateTypeLike = 1,      // 点赞
    MMOperateTypeComment,       // 评论
    MMOperateTypeDelete,        // 删除
    MMOperateTypeLocation,      // 位置
    MMOperateTypeFull,          // 显示全文
    MMOperateTypeProfile,       // 用户详情
};

// 容器最小高度
FOUNDATION_EXTERN CGFloat const MMContainMinHeight;
// 容器最大高度
FOUNDATION_EXTERN CGFloat const MMContainMaxHeight;
// 容器减去输入框的高度
FOUNDATION_EXTERN CGFloat const MarginHeight;

// 操作电话号码
FOUNDATION_EXTERN CGFloat const MMHandlePhoneTag;
// 删除评论
FOUNDATION_EXTERN CGFloat const MMDelCommentTag;

// 延迟执行
void GCD_AFTER(CGFloat time,dispatch_block_t block);
void MM_AddObserver(id observer,SEL aSelector,NSNotificationName aName);
void MM_PostNotification(NSNotificationName aName,id anObject);

@interface MomentConstant : NSObject

@end

NS_ASSUME_NONNULL_END
