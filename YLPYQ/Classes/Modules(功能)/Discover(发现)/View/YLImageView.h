//
//  YLImageView.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/24.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//单个小图d显示视图
@interface YLImageView : UIImageView

@property (nonatomic ,copy) void (^clickHandle)(YLImageView *imageView);

@end

NS_ASSUME_NONNULL_END
