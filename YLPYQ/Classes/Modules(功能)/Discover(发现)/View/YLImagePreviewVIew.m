//
//  YLImagePreviewVIew.m
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/25.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "YLImagePreviewVIew.h"



@implementation YLImagePreviewVIew

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        self.userInteractionEnabled = YES;
        //子视图
        _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView.userInteractionEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
        
        //页面控制
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.height-(k_iphone_x?80:40), k_screen_width, 20)];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        [self addSubview:_pageControl];
    }
    return self;
}

-(void)setPageNum:(NSInteger)pageNum{
    _pageNum = pageNum;
    _pageControl.numberOfPages = pageNum;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    _pageIndex = scrollView.contentOffset.x / self.width;
    _pageControl.currentPage = _pageIndex;
}

@end
