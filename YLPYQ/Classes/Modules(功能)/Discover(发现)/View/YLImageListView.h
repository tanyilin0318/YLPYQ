//
//  YLImageListView.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/24.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLMoment.h"

NS_ASSUME_NONNULL_BEGIN

@class YLImageView;
@interface YLImageListView : UIView

/*
 动态
 */
@property (nonatomic,strong) YLMoment *moment;
/*
 点击小图
 */
@property (nonatomic,copy) void (^singleTabHandler)(YLImageView *imageView);

- (void)loadPicture;
@end

NS_ASSUME_NONNULL_END
