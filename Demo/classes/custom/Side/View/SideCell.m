//
//  SideCell.m
//  Quiz
//
//  Created by YaoYuSmart on 2017/6/20.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import "SideCell.h"
#import "SideModel.h"

@interface SideCell ()

@property(nonatomic, strong)UIImageView *iconImage;

@end

@implementation SideCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//创建自定义可重用cell
+ (instancetype)sideCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"SideCell";
    SideCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[SideCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

//创建子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.iconImage = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconImage];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.iconImage.frame = CGRectMake(self.frame.size.width/2 - 29/2, self.frame.size.height/2 - 29/2, 29, 29);
}

- (void)setSideModel:(SideModel *)sideModel
{
    _sideModel = sideModel;
    
    self.iconImage.image = [UIImage imageNamed:sideModel.imageName];
}

@end
