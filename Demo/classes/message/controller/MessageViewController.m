//
//  MessageViewController.m
//  Demo
//
//  Created by YaoYuSmart on 2017/9/5.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageSendView.h"

@interface MessageViewController ()

@property(nonatomic, strong)MessageSendView *sendView;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Message";
    
    if ([[ThemeManager getInstance] currentTheme] == ThemeTypeDark) {
        self.view.backgroundColor = kRGBColor(28, 51, 81);
    } else {
        self.view.backgroundColor = kRGBColor(242, 243, 247);
    }
    
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more"] style:UIBarButtonItemStylePlain target:self action:@selector(more)];
//    self.navigationItem.rightBarButtonItem = rightItem;
    [self.view addSubview:self.sendView];
}

- (MessageSendView *)sendView
{
    if (!_sendView) {
        _sendView = [[MessageSendView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 64 - 60, kScreenWidth, 60)];
    }
    return _sendView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
