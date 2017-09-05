//
//  HomeViewController.m
//  Demo
//
//  Created by YaoYuSmart on 2017/9/5.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import "HomeViewController.h"
#import "ThemeManager.h"
#import "PSDrawerManager.h"
#import "MyViewController.h"

@interface HomeViewController ()

@property(nonatomic, assign)BOOL isShowSide;//是否显示侧边栏

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Home";
    //https://github.com/cbangchen/CBPic2ker
    UIButton *side = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [side setImage:[UIImage imageNamed:@"defaultHead"] forState:UIControlStateNormal];
    [side setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [side addTarget:self action:@selector(sideClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:side];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sideSelectRow:) name:@"Side" object:nil];
}

// 侧边栏
- (void)sideClick
{
    [[PSDrawerManager instance] showOrHideSideInView:self.tabBarController.view];
}

- (void)sideSelectRow:(id)sender
{
    [[PSDrawerManager instance] showOrHideSideInView:self.tabBarController.view];
    
    int row = [[[sender userInfo]objectForKey:@"row"] intValue];
    if (row == 0) {
        MyViewController *my = [[MyViewController alloc] init];
        [self.navigationController pushViewController:my animated:YES];
    } else if (row == 1) {
        
    } else if (row == 2) {
        
    } else if (row == 3) {
        if ([[ThemeManager getInstance] currentTheme] == ThemeTypeDark) {
            [[ThemeManager getInstance] changeTheme:ThemeTypeLight];
        } else {
            [[ThemeManager getInstance] changeTheme:ThemeTypeDark];
        }
    } else if (row == 4) {
        
    } else if (row == 5) {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
