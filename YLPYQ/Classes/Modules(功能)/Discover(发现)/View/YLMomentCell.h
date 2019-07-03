//
//  YLMomentCell.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/24.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLImageView.h"
#import "YLImageListView.h"
#import "YLOperatePrewView.h"
#import "YLMoment.h"
#import <MLLabel/MLLinkLabel.h>
#import "YLMoment.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MomentCellDelegate;
@interface YLMomentCell : UITableViewCell <MLLinkLabelDelegate>

@property (nonatomic ,strong) YLImageView *avatarImageView;//头像
@property (nonatomic ,strong) UILabel *timeLable; // 时间
@property (nonatomic ,strong) UIButton *nikeNameBtn; //名称
@property (nonatomic ,strong) UIButton *locationBtn; //位置
@property (nonatomic ,strong) UIButton *deletBtn; //删除按钮
@property (nonatomic ,strong) UIButton *showAllBtn; //查看全文
@property (nonatomic ,strong) UILabel *linkLable; // 内容
@property (nonatomic ,strong) YLImageListView *imageListView;//图片
@property (nonatomic ,strong) UIView *commentView;// 赞和评论视图
@property (nonatomic ,strong) UIImageView *bgImageView;//赞和评论背景视图
@property (nonatomic,strong) YLOperatePrewView *menuView;
@property (nonatomic,strong) UILongPressGestureRecognizer *longPress;
@property (nonatomic,strong) UIMenuController *menuVC;
@property (nonatomic,strong) YLMoment *moment;
@property (nonatomic,weak) id<MomentCellDelegate> delegate;

// 图片渲染
- (void)loadPicture;

@end


@protocol MomentCellDelegate <NSObject>

@optional

// 点击头像|删除|点赞|评论|全文/收起
- (void)didOperateMoment:(YLMomentCell *)cell operateType:(MMOperateType)operateType;
// 选择评论
- (void)didOperateMoment:(YLMomentCell *)cell selectComment:(YLComment *)comment;
// 点击高亮文字
- (void)didClickLink:(MLLink *)link linkText:(NSString *)linkText;

@end











@interface CommentLabel : UIView <MLLinkLabelDelegate>

// 内容Label
@property (nonatomic, strong) MLLinkLabel * linkLabel;
// 评论
@property (nonatomic, strong) YLComment * comment;
// 点击评论高亮内容
@property (nonatomic, copy) void (^didClickLinkText)(MLLink *link , NSString *linkText);
// 点击评论
@property (nonatomic, copy) void (^didClickText)(YLComment *comment);
@end

NS_ASSUME_NONNULL_END
