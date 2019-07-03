//
//  YLOperatePrewView.m
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/25.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "YLOperatePrewView.h"
#import "YLOperateMenuButton.h"

@interface YLOperatePrewView ()
@property (nonatomic, strong) UIView * menuView;
@property (nonatomic, strong) UIButton * menuBtn;
@property (nonatomic, strong) UIButton * likeBtn;
@property (nonatomic, strong) UIButton * commentBtn;
@end

@implementation YLOperatePrewView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _show = NO;
        [self setUpUI];
    }
    return self;
}

#pragma mark - 设置UI
- (void)setUpUI
{
    // 菜单容器视图
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(kOperateWidth-kOperateBtnWidth, 0, kOperateWidth-kOperateBtnWidth, kOperateHeight)];
    view.backgroundColor = MMRGBColor(70.0,74.0,75.0);
    view.layer.cornerRadius = 4.0;
    view.layer.masksToBounds = YES;
    [self addSubview:view];
    // 点赞
    YLOperateMenuButton *btn = [[YLOperateMenuButton alloc] initWithFrame:CGRectMake(0, 0, view.width/2, kOperateHeight)];
    btn.tag = MMOperateTypeLike;
    btn.allowAnimation = YES;
    [btn setTitle:@"赞" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"moment_like"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"moment_like_hl"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    self.likeBtn = btn;
    // 分割线
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(btn.right-5, 8, 0.5, kOperateHeight-16)];
    line.backgroundColor = MMRGBColor(50.f, 50.f, 50.f);
    [view addSubview:line];
    // 评论
    btn = [[YLOperateMenuButton alloc] initWithFrame:CGRectMake(line.right, 0, btn.width, kOperateHeight)];
    btn.tag = MMOperateTypeComment;
    [btn setTitle:@"评论" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"moment_comment"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"moment_comment_hl"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    self.commentBtn = btn;
    self.menuView = view;
    // 菜单操作按钮
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(kOperateWidth-kOperateBtnWidth, 0, kOperateBtnWidth, kOperateHeight)];
    [button setImage:[UIImage imageNamed:@"moment_operate"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"moment_operate_hl"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(menuClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    self.menuBtn = button;
}

#pragma mark - 显示/不显示
- (void)setShow:(BOOL)show
{
    _show = show;
    CGFloat menu_left = kOperateWidth - kOperateBtnWidth;
    CGFloat menu_width = 0;
    if (_show) {
        menu_left = 0;
        menu_width = kOperateWidth - kOperateBtnWidth;
    }
    self.menuView.width = menu_width;
    self.menuView.left = menu_left;
}

- (void)setIsLike:(BOOL)isLike
{
    if (isLike) {
        [self.likeBtn setTitle:@"取消" forState:UIControlStateNormal];
    } else {
        [self.likeBtn setTitle:@"赞" forState:UIControlStateNormal];
    }
}

#pragma mark - 事件
- (void)menuClick
{
    _show = !_show;
    CGFloat menu_left = kOperateWidth - kOperateBtnWidth;
    CGFloat menu_width = 0;
    if (_show) {
        menu_left = 0;
        menu_width = kOperateWidth - kOperateBtnWidth;
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.menuView.width = menu_width;
        self.menuView.left = menu_left;
    }];
}

- (void)buttonClick:(UIButton *)sender
{
    [self menuClick];
    // 0.1秒刷新UI
    GCD_AFTER(0.1, ^{
        MMOperateType operateType = sender.tag;
        if (self.operateMenu) {
            self.operateMenu(operateType);
        }
    });
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
