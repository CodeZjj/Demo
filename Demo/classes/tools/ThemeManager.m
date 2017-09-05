//
//  ThemeManager.m
//  Demo
//
//  Created by YaoYuSmart on 2017/9/5.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import "ThemeManager.h"

@implementation ThemeManager

+ (instancetype)getInstance
{
    static ThemeManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [ThemeManager getInstance];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [ThemeManager getInstance];
}

- (id)mutablecopyWithZone:(NSZone *)zone
{
    return [ThemeManager getInstance];
}

//设置主题
- (void)changeTheme:(ThemeType)type
{
    NSString *typeStr = @"dark";
    if (type == ThemeTypeLight) {
        typeStr = @"light";
    }
    [[NSUserDefaults standardUserDefaults] setObject:typeStr forKey:@"ThemeType"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //发出主题变换的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:ThemeChange object:nil userInfo:nil];
}

//当前主题
- (ThemeType)currentTheme
{
    NSString *typeStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"ThemeType"];
    if ([typeStr isEqualToString:@"light"]) {
        return ThemeTypeLight;
    } else {
        return ThemeTypeDark;
    }
}

@end
