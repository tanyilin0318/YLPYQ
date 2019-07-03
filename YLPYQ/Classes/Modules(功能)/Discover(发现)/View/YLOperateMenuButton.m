//
//  YLOperateMenuButton.m
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/28.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "YLOperateMenuButton.h"


@interface YLOperateMenuButton()
@property (nonatomic, strong) UIImageView * likeAnimationView;

@end

@implementation YLOperateMenuButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.spacing = 3;
        self.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _allowAnimation = NO;
        // 点赞动画
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.hidden = YES;
        [self addSubview:imageView];
        self.likeAnimationView = imageView;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.likeAnimationView.frame = self.imageView.frame;
}

// 监听事件
- (void)sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event
{
    if (!self.allowAnimation) {
        [super sendAction:action to:target forEvent:event];
        return;
    }
    // 显示动画
    self.likeAnimationView.hidden = NO;
    self.likeAnimationView.image = [self imageForState:UIControlStateHighlighted];
    self.likeAnimationView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:0.25 animations:^{
        self.likeAnimationView.transform = CGAffineTransformScale(self.imageView.transform, 0.4, 0.4);
    } completion:^(BOOL finished) {
        self.likeAnimationView.transform  = CGAffineTransformIdentity;
        self.likeAnimationView.hidden = YES;
        [super sendAction:action to:target forEvent:event];
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
