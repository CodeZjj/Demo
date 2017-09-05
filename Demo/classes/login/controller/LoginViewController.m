//
//  LoginViewController.m
//  Zade
//
//  Created by YaoYuSmart on 2017/9/1.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import "LoginViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface LoginViewController ()

@property(nonatomic,strong)CMMotionManager *manger;

@property(nonatomic, strong)UIImageView *bg;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBg];
    
    //先判断陀螺仪是否可用
    self.manger=[CMMotionManager new];
    if (![self.manger isGyroAvailable]) { NSLog(@"陀螺仪不可用"); return; }
    //2 设置采样间隔
    self.manger.gyroUpdateInterval =1.0;
    [self.manger startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) { CMRotationRate rate = gyroData.rotationRate;
        //获取陀螺仪 三个xyz值
        NSLog(@"x:%f y:%f z:%f", rate.x, rate.y, rate.z);
        self.bg.frame = CGRectMake(rate.x, rate.y, kScreenWidth, kScreenHeight);
    }];
    
}

- (void)initBg
{
    self.bg = [[UIImageView alloc] initWithFrame:self.view.frame];
    self.bg.image = [UIImage imageNamed:@"loginBg"];
    [self.view addSubview:self.bg];
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2 - 36, 70, 72, 72)];
    icon.image = [UIImage imageNamed:@"loginIcon"];
    [self.view addSubview:icon];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
