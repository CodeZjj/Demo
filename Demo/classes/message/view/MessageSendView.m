//
//  MessageSendView.m
//  Demo
//
//  Created by YaoYuSmart on 2017/9/6.
//  Copyright © 2017年 YaoYuSmart. All rights reserved.
//

#import "MessageSendView.h"

@interface MessageSendView ()

@property(nonatomic, strong)UIView *bgView;

@property(nonatomic, strong)UIButton *modeBtn;

@property(nonatomic, strong)UITextField *inputField;

@property(nonatomic, strong)UIButton *sendBtn;

@end

@implementation MessageSendView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bgView = [[UIView alloc] init];
        [self addSubview:self.bgView];
        
        self.modeBtn = [[UIButton alloc] init];
        [self addSubview:self.modeBtn];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self.modeBtn addGestureRecognizer:pan];
        
        self.inputField = [[UITextField alloc] init];
        self.inputField.placeholder = @"Ask me something...";
        self.inputField.font = [UIFont barryFontOfSize:16];
        self.inputField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.inputField.placeholder attributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
        [self addSubview:self.inputField];
        
        self.sendBtn = [[UIButton alloc] init];
        [self.sendBtn setImage:[UIImage imageNamed:@"send"] forState:UIControlStateNormal];
        [self addSubview:self.sendBtn];
        
        if ([[ThemeManager getInstance] currentTheme] == ThemeTypeDark) {
            self.backgroundColor = kRGBColor(28, 51, 81);
            self.bgView.backgroundColor = kRGBColor(21, 34, 51);
            [self.modeBtn setImage:[UIImage imageNamed:@"Dark_face"] forState:UIControlStateNormal];
            self.inputField.textColor = [UIColor whiteColor];
        } else {
            self.backgroundColor = kRGBColor(242, 243, 247);
            self.bgView.backgroundColor = [UIColor whiteColor];
            [self.modeBtn setImage:[UIImage imageNamed:@"Light_face"] forState:UIControlStateNormal];
            self.inputField.textColor = [UIColor blackColor];
        }
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bgView.frame = CGRectMake(20, 0, kScreenWidth - 40, 50);
    self.bgView.layer.cornerRadius = 25;
    
    self.modeBtn.frame = CGRectMake(20, 0, 50, 50);
    self.modeBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.inputField.frame = CGRectMake(70, 10, kScreenWidth - 150, 30);
    
    self.sendBtn.frame = CGRectMake(kScreenWidth - 70, 0, 50, 50);
}

//- (void)pan:(UIPanGestureRecognizer *)sender
//{
//    CGPoint transP = [sender translationInView:self.modeBtn];
//    if (transP.x < 0) {
//        [self updateCellFrame:0 animation:NO];
//        return;
//    }
//    
//    [self updateCellFrame:transP.x animation:NO];
//    
//    if (sender.state == UIGestureRecognizerStateEnded || sender.state == UIGestureRecognizerStateCancelled) {
//        [self updateCellFrame:0 animation:YES];
//        if (transP.x >= 50) {
//            
//        }
//    }
//}

//- (void)updateCellFrame:(CGFloat)x animation:(BOOL)animation
//{
//    if (animation) {
//        [UIView animateWithDuration:0.3 animations:^{
//            self.sendBtn.frame = CGRectMake(x, self.contentView.origin.y, self.contentView.frame.size.width, self.contentView.frame.size.height);
//        }];
//    } else {
//        self.sendBtn.frame = CGRectMake(x, self.contentView.origin.y, self.contentView.frame.size.width, self.contentView.frame.size.height);
//    }
//}

@end
