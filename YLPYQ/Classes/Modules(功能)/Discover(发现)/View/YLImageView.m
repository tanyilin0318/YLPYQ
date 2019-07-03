//
//  YLImageView.m
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/24.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "YLImageView.h"

@implementation YLImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.contentScaleFactor = [[UIScreen mainScreen] scale]; // 获取屏幕分辨率
        self.contentMode = UIViewContentModeScaleToFill;
        self.clipsToBounds  = YES;
        self.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCallback:)];
        [self addGestureRecognizer:singleTap];
    }
    return self;
}

- (void)singleTapGestureCallback:(UIGestureRecognizer *)guester{
    if (self.clickHandle) {
        self.clickHandle(self);
    }
}
@end
