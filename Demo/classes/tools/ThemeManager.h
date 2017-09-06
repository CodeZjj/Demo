//
//  ThemeManager.h
//  Demo
//
//  Created by YaoYuSmart on 2017/9/5.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString * const ThemeChange = @"ThemeChange";//主题变换通知

typedef enum{
    ThemeTypeDark  = 0,    //dark
    ThemeTypeLight         //light
}ThemeType;

@interface ThemeManager : NSObject

+ (instancetype)getInstance;

/**
 @brief 设置主题
 @param type       主题类型
 */
- (void)changeTheme:(ThemeType)type;

/**
 @brief 当前主题
 */
- (ThemeType)currentTheme;

/**
 @brief 当前主题颜色
 */
- (UIColor *)currentThemeColor;

/**
 @brief 当前主题字体颜色
 */
- (UIColor *)currentThemeFontColor;

@end
