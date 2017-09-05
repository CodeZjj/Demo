//
//  LaunchView.m
//  Zade
//
//  Created by YaoYuSmart on 2017/9/1.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import "LaunchView.h"

@interface LaunchView ()

@property(nonatomic, strong)UIImageView *icon;

@end

@implementation LaunchView

- (instancetype)initWithView:(UIView *)view timeout:(NSTimeInterval)timeout
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        
        self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2, kScreenHeight/2, 0, 0)];
        self.icon.image = [UIImage imageNamed:@"launch"];
        [self addSubview:self.icon];
        
        [UIView animateWithDuration:1.0 animations:^{
            self.icon.frame = CGRectMake(kScreenWidth/2 - 45, kScreenHeight/2 - 45, 90, 90);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.0 animations:^{
                self.icon.frame = CGRectMake(kScreenWidth/2 - 36, 72, 72, 72);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1.0 animations:^{
                    self.icon.alpha = 0.0;
                } completion:^(BOOL finished) {
                    
                }];
            }];
        }];
        
        [self performSelector:@selector(time) withObject:self afterDelay:timeout];
        
        [view addSubview:self];
    }
    return self;
}

- (void)time
{
    if (self.launchBlock) {
        self.launchBlock();
    }
}

@end
