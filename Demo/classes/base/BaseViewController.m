//
//  BaseViewController.m
//  Zade
//
//  Created by YaoYuSmart on 2017/9/1.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import "BaseViewController.h"
#import "ThemeManager.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([[ThemeManager getInstance] currentTheme] == ThemeTypeDark) {
        self.view.backgroundColor = kRGBColor(17, 34, 57);
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTheme) name:ThemeChange object:nil];
}

- (void)changeTheme
{
    if ([[ThemeManager getInstance] currentTheme] == ThemeTypeDark) {
        self.view.backgroundColor = kRGBColor(17, 34, 57);
        
        [self.navigationController.navigationBar setBarTintColor:kRGBColor(17, 34, 57)];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
        
        [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
