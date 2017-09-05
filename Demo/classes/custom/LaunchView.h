//
//  LaunchView.h
//  Zade
//
//  Created by YaoYuSmart on 2017/9/1.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LaunchBlock)();

@interface LaunchView : UIView

-(instancetype)initWithView:(UIView *)view timeout:(NSTimeInterval)timeout;

@property(nonatomic, strong)LaunchBlock launchBlock;

@end
