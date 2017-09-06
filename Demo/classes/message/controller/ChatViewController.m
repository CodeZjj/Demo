//
//  ChatViewController.m
//  Demo
//
//  Created by YaoYuSmart on 2017/9/6.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatCell.h"
#import "ChatModel.h"
#import "MessageViewController.h"

@interface ChatViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableview;

@property(nonatomic, strong)NSMutableArray *chatArray;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Chat";
    
    [self.view addSubview:self.tableview];
    
    for (int i = 0; i < 10; i++) {
        ChatModel *model = [ChatModel new];
        model.chatTitle = @"Hannah Tran";
        model.chatContent = @"哈哈哈";
        model.chatIcon = @"test";
        [self.chatArray addObject:model];
    }
}

- (UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49)];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.tableFooterView = [[UIView alloc] init];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}

- (NSMutableArray *)chatArray
{
    if (!_chatArray) {
        _chatArray = [NSMutableArray array];
    }
    return _chatArray;
}

#pragma mark - tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.chatArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatCell *cell = [ChatCell chatCellWithTableView:tableView];
    cell.chatModel = self.chatArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageViewController *msg = [[MessageViewController alloc] init];
    [self.navigationController pushViewController:msg animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tableview.backgroundColor = THEMECOLOR;
    [self.tableview reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
