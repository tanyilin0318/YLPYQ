//
//  MLLabelUtil.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/7/1.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MLLabel/MLLinkLabel.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLLabelUtil : NSObject

// 获取linkLabel
MLLinkLabel *kMLLinkLabel(BOOL isMoment);
// 获取富文本
NSMutableAttributedString *kMLLinkAttributedText(id object);

@end

NS_ASSUME_NONNULL_END
