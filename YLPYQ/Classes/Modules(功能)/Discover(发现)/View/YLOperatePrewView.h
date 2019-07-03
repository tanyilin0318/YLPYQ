//
//  YLOperatePrewView.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/25.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MomentConstant.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLOperatePrewView : UIView

/*
 
 */
@property (nonatomic,assign) BOOL show;
/*
 
 */
@property (nonatomic,assign) BOOL isLike;
/*
 
 */
@property (nonatomic,copy) void (^operateMenu)(MMOperateType operateType);

@end

NS_ASSUME_NONNULL_END
