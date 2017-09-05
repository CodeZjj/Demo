//
//  SideCell.h
//  Quiz
//
//  Created by YaoYuSmart on 2017/6/20.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SideModel;

@interface SideCell : UITableViewCell

+ (instancetype)sideCellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong)SideModel *sideModel;

@end
