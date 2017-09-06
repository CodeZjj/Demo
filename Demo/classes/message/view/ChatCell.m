//
//  ChatCell.m
//  Demo
//
//  Created by YaoYuSmart on 2017/9/6.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import "ChatCell.h"
#import "ChatModel.h"

@interface ChatCell ()

@property(nonatomic, strong)UILabel *chatTitle;

@property(nonatomic, strong)UILabel *chatContent;

@property(nonatomic, strong)UIImageView *chatIcon;

@end

@implementation ChatCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//创建自定义可重用cell
+ (instancetype)chatCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"ChatCell";
    ChatCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[ChatCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

//创建子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        
        self.chatIcon = [[UIImageView alloc] init];
        self.chatIcon.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:self.chatIcon];
        
        self.chatTitle = [[UILabel alloc] init];
        self.chatTitle.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.chatTitle];
        
        self.chatContent = [[UILabel alloc] init];
        self.chatContent.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.chatContent];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.chatIcon.frame = CGRectMake(10, 5, 50, 50);
    
    self.chatTitle.frame = CGRectMake(70, 10, kScreenWidth - 80, 20);
    
    self.chatContent.frame = CGRectMake(70, 30, kScreenWidth - 80, 20);
}

- (void)setChatModel:(ChatModel *)chatModel
{
    _chatModel = chatModel;
    self.chatIcon.image = [UIImage imageNamed:chatModel.chatIcon];
    
    self.chatTitle.text = chatModel.chatTitle;
    self.chatTitle.textColor = THEMEFONTCOLOR;
    
    self.chatContent.text = chatModel.chatContent;
    self.chatContent.textColor = THEMEFONTCOLOR;
}

@end
