//
//  YLMomentViewController.m
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/21.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "YLMomentViewController.h"
#import "YLTableView.h"
#import "YLImageView.h"
#import "Define.h"
#import "YLCommentInputView.h"
#import "YLMomentCell.h"
#import "YLComment.h"


@interface YLMomentViewController ()<UITableViewDelegate,UITableViewDataSource,MomentCellDelegate>
@property (nonatomic ,strong) NSMutableArray *momentList;//朋友圈动态列表
@property (nonatomic ,strong) YLTableView *tableView; //表格
@property (nonatomic ,strong) UIView *tableHeaderView; //表头
@property (nonatomic ,strong) YLImageView *coverImageView; //封面
@property (nonatomic ,strong) YLImageView *avatarImageView;;//当前用户头像
@property (nonatomic ,strong) YLCommentInputView *commontInputView;//评论输入框
@property (nonatomic,strong) YLMomentCell *operateCell;//当前操作朋友圈动态
@property (nonatomic,strong) YLComment *operateComment;//当前评论操作
@property (nonatomic,strong) YLUser *loginUser;//当前登陆用户
@property (nonatomic,strong) NSIndexPath *selectedIndexPath;//当前评论indexpath
@property (nonatomic,assign) CGFloat keyboardHeight; // 键盘高度


@end

@implementation YLMomentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"好友动态";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"moment_camera"] style:UIBarButtonItemStylePlain target:self action:@selector(addMoment)];
    [self configData];
    [self configUI];
}

#pragma mark - 模拟数据
-(void)configData{
    self.loginUser = [YLUser findFirstByCriteria:@"WHERE type = 1"];
    self.momentList = [[NSMutableArray alloc] init];
    [self.momentList addObjectsFromArray:[MomentUtil getMomentList:0 pageNum:5]];
}

#pragma mark - UI
- (void)configUI{
    
    //封面
    YLImageView *imageView = [[YLImageView alloc]initWithFrame:CGRectMake(0, 0, k_screen_width, 270)];
    imageView.image = [UIImage imageNamed:@"moment_cover"];
    self.coverImageView = imageView;
    
    //用户头像
    imageView = [[YLImageView alloc] initWithFrame:CGRectMake(k_screen_width-85, self.coverImageView.bottom-50, 75, 75)];
    imageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    imageView.layer.borderWidth = 2;
    imageView.image = [UIImage imageNamed:@"moment_head"];
    self.avatarImageView = imageView;
    
    //用户名
    UILabel *nameLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 240, k_screen_width-100, 20)];
    nameLab.text = @"谭林杰的朋友圈";
    nameLab.font = [UIFont systemFontOfSize:20.0];
    nameLab.textColor = [UIColor whiteColor];
    nameLab.textAlignment = NSTextAlignmentRight;
//    self.nameLable = nameLab;
    [self.coverImageView addSubview:nameLab];
    // 表头
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, k_screen_width, 270)];
    view.userInteractionEnabled = YES;
    [view addSubview:self.coverImageView];
    [view addSubview:self.avatarImageView];
    self.tableHeaderView = view;
    
    //表格
    YLTableView *tableView = [[YLTableView alloc]initWithFrame:CGRectMake(0, 0, k_screen_width, k_screen_height - 100)];
    tableView.separatorInset = UIEdgeInsetsZero;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.tableHeaderView = self.tableHeaderView;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    //上拉加载
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        YLMoment *moment = [self.momentList lastObject];
        NSArray *tempList = [MomentUtil getMomentList:moment.pk pageNum:5];
        if ([tempList count]){
            [self.momentList addObjectsFromArray:tempList];
            [self.tableView reloadData];
            [tableView.mj_footer endRefreshing];
        }else {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
    }];
    [footer setTitle:@"已加载全部" forState:MJRefreshStateNoMoreData];
    footer.stateLabel.font = [UIFont systemFontOfSize:14];
    self.tableView.mj_footer = footer;
}

#pragma mark - 发布动态
- (void)addMoment
{
    NSLog(@"新增");
}


#pragma mark - datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.momentList count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 260;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"MomentCell";
    YLMomentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[YLMomentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pyq"];
    }
    cell.tag = indexPath.row;
    cell.moment = [self.momentList objectAtIndex:indexPath.row];
    cell.delegate = self;
    
    return cell;
}
@end
