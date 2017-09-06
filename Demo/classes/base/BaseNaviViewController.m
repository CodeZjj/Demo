//
//  BaseNaviViewController.m
//  Zade
//
//  Created by YaoYuSmart on 2017/9/1.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import "BaseNaviViewController.h"

@interface BaseNaviViewController ()

@end

@implementation BaseNaviViewController

+ (void)initialize {
    if ([[ThemeManager getInstance] currentTheme] == ThemeTypeDark) {
        [[UINavigationBar appearance] setBarTintColor:kRGBColor(28, 51, 81)];
        //[[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"barry"size:15]}];
    } else {
        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
        //[[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont fontWithName:@"barry"size:15]}];
    }
    [[UINavigationBar appearance] setTranslucent:NO];
    //[[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/** 可以在这个方法中拦截所有push进来的控制器 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器(栈底控制器)
        // 隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 自定义返回按钮图片
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    // 调用这句super的push后, 当前viewController才会加到childViewControllers中
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
