//
//  SideView.m
//  Quiz
//
//  Created by YaoYuSmart on 2017/6/20.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import "SideView.h"
#import "SideCell.h"
#import "SideModel.h"
#import "ThemeManager.h"

@interface SideView ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableview;

@property(nonatomic, strong)NSMutableArray *itemArray;

@end

@implementation SideView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        if ([[ThemeManager getInstance] currentTheme] == ThemeTypeDark) {
            self.backgroundColor = kRGBColor(17, 34, 57);
        } else {
            self.backgroundColor = [UIColor whiteColor];
        }
        
        [self addSubview:self.tableview];
        
        [self initData];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTheme) name:ThemeChange object:nil];
    }
    return self;
}

- (void)changeTheme
{
    [self initData];
    
    if ([[ThemeManager getInstance] currentTheme] == ThemeTypeDark) {
        self.backgroundColor = kRGBColor(17, 34, 57);
        self.tableview.backgroundColor = kRGBColor(17, 34, 57);
    } else {
        self.backgroundColor = [UIColor whiteColor];
        self.tableview.backgroundColor = [UIColor whiteColor];
    }
}

- (UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc] init];
        if ([[ThemeManager getInstance] currentTheme] == ThemeTypeDark) {
            _tableview.backgroundColor = kRGBColor(17, 34, 57);
        } else {
            _tableview.backgroundColor = [UIColor whiteColor];
        }
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.tableFooterView = [[UIView alloc] init];
        _tableview.scrollEnabled = NO;
    }
    return _tableview;
}

- (NSMutableArray *)itemArray
{
    if (!_itemArray) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}

- (void)initData
{
    [self.itemArray removeAllObjects];
    NSArray *images = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%@_person",[self getTheme]],[NSString stringWithFormat:@"%@_psw",[self getTheme]],[NSString stringWithFormat:@"%@_like",[self getTheme]],[NSString stringWithFormat:@"%@_reward",[self getTheme]],[NSString stringWithFormat:@"%@_right",[self getTheme]],[NSString stringWithFormat:@"%@_error",[self getTheme]], nil];
    for (int i = 0; i < images.count; i++)
    {
        SideModel *model = [SideModel new];
        model.imageName = images[i];
        [self.itemArray addObject:model];
    }
    [self.tableview reloadData];
}

- (NSString *)getTheme
{
    NSString *theme = @"Dark";
    if ([[ThemeManager getInstance] currentTheme] == ThemeTypeLight) {
        theme = @"Light";
    }
    return theme;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.tableview.frame = CGRectMake(0, 20, self.frame.size.width, self.frame.size.height - 20);
}

#pragma mark - tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return kScreenWidth * 0.2;
    return (kScreenHeight - 20)/6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SideCell *cell = [SideCell sideCellWithTableView:tableView];
    cell.sideModel = self.itemArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"Side" object:nil userInfo:@{@"row":@(indexPath.row)}];
}

@end
