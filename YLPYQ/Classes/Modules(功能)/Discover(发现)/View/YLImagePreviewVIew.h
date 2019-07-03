//
//  YLImagePreviewVIew.h
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/25.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLImagePreviewVIew : UIView <UIScrollViewDelegate>
/*
 横向滚动视图
 */
@property (nonatomic,strong) UIScrollView *scrollView;
/*
 页码指示
 */
@property (nonatomic,strong) UIPageControl *pageControl;
/*
 页码数目
 */
@property (nonatomic,assign) NSInteger pageNum;
/*
 页码索引
 */
@property (nonatomic,assign) NSInteger pageIndex;
@end

NS_ASSUME_NONNULL_END
