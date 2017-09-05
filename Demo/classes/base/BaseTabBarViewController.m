//
//  BaseTabBarViewController.m
//  PetDemo
//
//  Created by YaoYuSmart on 2017/8/31.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseNaviViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "CourseViewController.h"
#import "MessageViewController.h"
#import "ThemeManager.h"

@interface BaseTabBarViewController ()

@property(nonatomic, strong)NSArray *normals;

@property(nonatomic, strong)NSArray *selects;

@end

@implementation BaseTabBarViewController

//调整字体的颜色
+ (void)initialize {
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTabBarController];
    
    //去掉tabbar顶部阴影
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    
    UIView *view = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    view.tag = 99999;
    if ([[ThemeManager getInstance] currentTheme] == ThemeTypeDark) {
        view.backgroundColor = kRGBColor(21, 34, 51);
    } else {
        view.backgroundColor = [UIColor whiteColor];
    }
    [[UITabBar appearance] insertSubview:view atIndex:0];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTheme) name:ThemeChange object:nil];
}

- (void)changeTheme
{
    for (UIView *view in self.tabBar.subviews) {
        if (view.tag == 99999) {
            if ([[ThemeManager getInstance] currentTheme] == ThemeTypeDark) {
                view.backgroundColor = kRGBColor(21, 34, 51);
            } else {
                view.backgroundColor = [UIColor whiteColor];
            }
            break;
        }
    }
    
    for (int i = 0; i < self.viewControllers.count; i++) {
        BaseNaviViewController *navi = self.viewControllers[i];
        UIImage *norImg = [[UIImage imageNamed:self.normals[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selImg = [[UIImage imageNamed:self.selects[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:norImg selectedImage:selImg];
        navi.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        
        if ([[ThemeManager getInstance] currentTheme] == ThemeTypeDark) {
            [navi.navigationBar setBarTintColor:kRGBColor(17, 34, 57)];
            [navi.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        } else {
            [navi.navigationBar setBarTintColor:[UIColor whiteColor]];
            [navi.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
        }
    }
}

- (NSArray *)normals
{
    _normals = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%@_home_normal",[self getTheme]],[NSString stringWithFormat:@"%@_msg_normal",[self getTheme]],[NSString stringWithFormat:@"%@_course_normal",[self getTheme]],[NSString stringWithFormat:@"%@_search_normal",[self getTheme]], nil];
    return _normals;
}

- (NSArray *)selects
{
    _selects = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%@_home_select",[self getTheme]],[NSString stringWithFormat:@"%@_msg_select",[self getTheme]],[NSString stringWithFormat:@"%@_course_select",[self getTheme]],[NSString stringWithFormat:@"%@_search_select",[self getTheme]], nil];
    return _selects;
}

- (NSString *)getTheme
{
    NSString *theme = @"Dark";
    if ([[ThemeManager getInstance] currentTheme] == ThemeTypeLight) {
        theme = @"Light";
    }
    return theme;
}

- (void)createTabBarController
{
    NSArray *controllers = [NSArray arrayWithObjects:@"HomeViewController",@"MessageViewController",@"CourseViewController",@"SearchViewController", nil];
    for (int i = 0; i < controllers.count; i++)
    {
        UIViewController *vc = [self createViewControllerWith:controllers[i] withTitle:@"" withNormalImg:self.normals[i] withSelectedImage:self.selects[i]];
        [self addChildViewController:vc];
    }
}

- (UIViewController *)createViewControllerWith:(NSString *)vcName withTitle:(NSString *)title withNormalImg:(NSString *)normalImage withSelectedImage:(NSString *)selectedImage
{
    Class cls = NSClassFromString(vcName);
    UIViewController *vc = [[cls alloc] init];
    UIImage *norImg = [[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selImg = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:norImg selectedImage:selImg];
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    BaseNaviViewController *nav = [[BaseNaviViewController alloc] initWithRootViewController:vc];
    return nav;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
