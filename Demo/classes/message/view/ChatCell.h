//
//  ChatCell.h
//  Demo
//
//  Created by YaoYuSmart on 2017/9/6.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChatModel;

@interface ChatCell : UITableViewCell

+ (instancetype)chatCellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong)ChatModel *chatModel;

@end
