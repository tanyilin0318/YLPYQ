//
//  YLMomentCell.m
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/24.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "YLMomentCell.h"

#pragma mark --动态

CGFloat maxLimitHeight = 0;
CGFloat lineSpaceing = 5;

@interface YLMomentCell ()<MLLinkLabelDelegate>

@end

@implementation YLMomentCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self configUI];
        //观察者
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
    
}

- (void)configUI{
    WS(wSelf);
    //头像视图
    _avatarImageView = [[YLImageView alloc]initWithFrame:CGRectMake(10, kBlank, kAvatarWidth, kAvatarWidth)];
    [_avatarImageView setClickHandle:^(YLImageView * _Nonnull imageView) {
        
    }];
    [self.contentView addSubview:_avatarImageView];
    
    
    //名字视图
    _nikeNameBtn = [[UIButton alloc]init];
    _nikeNameBtn.tag = MMOperateTypeProfile;
    _nikeNameBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
    _nikeNameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_nikeNameBtn setTitleColor:kHLTextColor forState:UIControlStateNormal];
    [_nikeNameBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_nikeNameBtn];
    
//    //正文视图
//    _linkLable = kMLLinkLabel(YES);
//    _linkLable.font = kTextFont;
//    _linkLable.text = @"linklabel";
//    _linkLable.delegate = self;
//    [self.contentView addSubview:_linkLable];
    _linkLable = [[UILabel alloc]init];
    _linkLable.font = kTextFont;
    _linkLable.numberOfLines = 5;
    _linkLable.text = @"linklabel";
    [self.contentView addSubview:_linkLable];
    
    //查看‘全文’按钮
    _showAllBtn = [[UIButton alloc]init];
    _showAllBtn.tag = MMOperateTypeFull;
    _showAllBtn.titleLabel.font = kTextFont;
    [_showAllBtn setTitle:@"全文" forState:UIControlStateNormal];
    [_showAllBtn setTitle:@"收起" forState:UIControlStateSelected];
    [_showAllBtn setTitleColor:kHLTextColor forState:UIControlStateNormal];
    [_showAllBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_showAllBtn];
    [_showAllBtn sizeToFit];
    
    //图片区
    _imageListView = [[YLImageListView alloc]initWithFrame:CGRectZero];
    [_imageListView setSingleTabHandler:^(YLImageView * _Nonnull imageView) {
       //点击单个视图按钮回调
        [wSelf resetMenuView];
    }];
    [self.contentView addSubview:_imageListView];
    
    //位置视图
    _locationBtn = [[UIButton alloc]init];
    _locationBtn.tag = MMOperateTypeLocation;
    _locationBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
    [_locationBtn setTitleColor:kHLTextColor forState:UIControlStateNormal];
    [_locationBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_locationBtn];
    
    //时间视图
    _timeLable = [[UILabel alloc]init];
    _timeLable.textColor = [UIColor redColor];
    _timeLable.font = [UIFont systemFontOfSize:13.0];
    [self.contentView addSubview:_timeLable];
    
    //删除视图
    _deletBtn = [[UIButton alloc]init];
    _deletBtn.tag = MMOperateTypeDelete;
    _deletBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [_deletBtn setTitle:@"删除" forState:UIControlStateNormal];
    [_deletBtn setTitleColor:kHLTextColor forState:UIControlStateNormal];
    [_deletBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_deletBtn];
    
    //操作视图
    _menuView = [[YLOperatePrewView alloc]initWithFrame:CGRectZero];
    [_menuView setOperateMenu:^(MMOperateType operateType) {
        
    }];
    [self.contentView addSubview:_menuView];
    
    maxLimitHeight = (_linkLable.font.lineHeight + lineSpaceing) * 6;
}

#pragma mark --setter
- (void)setMoment:(YLMoment *)moment{
    
    _moment = moment;
    // 头像
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:moment.user.portrait]];
    
    //昵称
    [_nikeNameBtn setTitle:moment.user.name forState:UIControlStateNormal];
    [_nikeNameBtn sizeToFit];
    if (_nikeNameBtn.width > kTextWidth){
        _nikeNameBtn.width = kTextWidth;
    }
    _nikeNameBtn.frame = CGRectMake(_avatarImageView.right+0, _avatarImageView.top, _nikeNameBtn.width, 20);
    
    // 正文
    _showAllBtn.hidden = YES;
    _linkLable.hidden = YES;
    CGFloat bottom = _nikeNameBtn.bottom + kPaddingValue;
    CGFloat rowHeight = 0;
    
    _linkLable.text = moment.text;
    if ([moment.text length]){
        _linkLable.hidden = NO;
        _linkLable.text = moment.text;
        _showAllBtn.hidden = NO;
        _showAllBtn.selected = _moment.isFullText;
        NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        CGRect rect = [moment.text boundingRectWithSize:CGSizeMake(MAXFLOAT,MAXFLOAT) options:options attributes:@{NSFontAttributeName:kTextFont} context:nil];
        _linkLable.frame = CGRectMake(_nikeNameBtn.left, bottom, k_screen_width-100, rect.size.height);
        _showAllBtn.frame = CGRectMake(_nikeNameBtn.left, _linkLable.bottom + kArrowHeight, _showAllBtn.width, kMoreLabHeight);
        if (_showAllBtn.hidden) {
            bottom = _linkLable.bottom + kPaddingValue;
        } else {
            bottom = _showAllBtn.bottom + kPaddingValue;
        }
        
        //添加长按手势
        if (!_longPress){
            _longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressHandler:)];
        }
        [_linkLable addGestureRecognizer:_longPress];
        
    }
    
    // 图片
    _imageListView.moment = moment;
    if ([moment.pictureList count] > 0) {
        _imageListView.origin = CGPointMake(_nikeNameBtn.left, bottom);
        bottom = _imageListView.bottom + kPaddingValue;
    }
    
    //位置
    _timeLable.text = [YLUtility getMomentTime:moment.time];
    [_timeLable sizeToFit];
    if (moment.location){
        [_locationBtn setTitle:moment.location.position forState:UIControlStateNormal];
        [_locationBtn sizeToFit];
        _locationBtn.hidden = NO;
        _locationBtn.frame = CGRectMake(_nikeNameBtn.left, bottom,_locationBtn.width, kTimeLabelH);
        bottom = _locationBtn.bottom + kPaddingValue;
    } else{
        _locationBtn.hidden = YES;
    }
    _timeLable.frame = CGRectMake(_nikeNameBtn.left, bottom, _timeLable.width, kTimeLabelH);
    _deletBtn.frame = CGRectMake(_timeLable.right + 25, _timeLable.top, 30, kTimeLabelH);
    bottom = _timeLable.bottom + kPaddingValue;
    
    //操作视图
    _menuView.frame = CGRectMake(k_screen_width-kOperateWidth-10, _timeLable.top-(kOperateHeight-kTimeLabelH)/2, kOperateWidth, kOperateHeight);
    _menuView.show = NO;
    _moment.isLike = moment.isLike;
    
    //处理评论/赞
    _commentView.frame = CGRectZero;
    _bgImageView.frame = CGRectZero;
    _bgImageView.image = nil;
    [_commentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //处理赞
    CGFloat top = 0;
    CGFloat width = k_screen_width - kRightMargin - _nikeNameBtn.left;
    if ([moment.likeList count]){
        
    }
}




#pragma mark -- 点击事件
- (void)buttonClicked:(UIButton *)sender{
    
    NSLog(@"%ld",sender.tag);
    MMOperateType operateType = sender.tag;
    // 改变背景色
    sender.titleLabel.backgroundColor = kHLBgColor;
    GCD_AFTER(0.3, ^{  // 延迟执行
        sender.titleLabel.backgroundColor = [UIColor whiteColor];
        if (operateType == MMOperateTypeFull) {
            self->_moment.isFullText = !self->_moment.isFullText;
            [self->_moment update];
        }
        if ([self.delegate respondsToSelector:@selector(didOperateMoment:operateType:)]) {
            [self.delegate didOperateMoment:self operateType:operateType];
        }
    });
    [self resetMenuView];
}

- (void)resetMenuView{
    
    
}

- (void)longPressHandler:(UILongPressGestureRecognizer *)longPress{
    
    
}

-(void)loadPicture{
    [_imageListView loadPicture];
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
