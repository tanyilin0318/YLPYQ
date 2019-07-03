//
//  YLImageListView.m
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/24.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "YLImageListView.h"
#import "YLImagePreviewVIew.h"
@interface YLImageListView ()

//图片视图数组

@property (nonatomic,strong) NSMutableArray *imageArray;
//预览视图

@property (nonatomic,strong) YLImagePreviewVIew *previewView;
@end

@implementation YLImageListView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
    }
    return self;
}

-(void)loadPicture{
    
}

@end
