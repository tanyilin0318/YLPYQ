//
//  YLCommentInputView.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/25.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLComment.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLCommentInputView : UIView

/*
 监听容器高度（包含监听键盘）
 */
@property (nonatomic,copy) void (^ContainerWillChangeFrameBlock)(CGFloat keyboardHeight);
/*
 评论文本
 */
@property (nonatomic,copy) void (^CompleteInputTextBlock)(NSString *commontText);
/*
 容器高度
 */
@property (nonatomic,assign) CGFloat ctTop;
/*
 当前评论（用于判断评论还是回复）
 */
@property (nonatomic,strong) YLComment *comment;

- (void)show;
@end

NS_ASSUME_NONNULL_END
