//
//  YLDiscoverViewController.m
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/21.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "YLDiscoverViewController.h"
#import "YLTableView.h"
#import "YLMomentViewController.h"

@interface YLDiscoverViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) YLTableView *tableView;
@property (nonatomic ,strong) NSArray *titles;

@end

@implementation YLDiscoverViewController

-(YLTableView *)tableView{
    if (!_tableView) {
        _tableView = [[YLTableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发现";
    self.view.backgroundColor = [UIColor lightGrayColor];
    _titles = [NSArray arrayWithObjects:@[@"朋友圈"],@[@"扫一扫",@"摇一摇"],
               @[@"附近的人",@"漂流瓶"],
               @[@"购物",@"游戏"],@[@"小程序"], nil];
    [self.view addSubview:self.tableView];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.titles.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.titles objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell2"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor whiteColor];
    }
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"discover_%ld_%ld",(long)indexPath.section,(long)indexPath.row]];
    cell.textLabel.text = [[self.titles objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YLMomentViewController *om = [[YLMomentViewController alloc]init];
    om.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:om animated:YES];
}
@end
