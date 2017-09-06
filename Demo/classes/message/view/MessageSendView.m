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

@property(nonatomic, strong)UIButton *faceBtn;

@property(nonatomic, strong)UIButton *photoBtn;

@property(nonatomic, strong)UIButton *cameraBtn;

@property(nonatomic, strong)UIButton *audioBtn;

@property(nonatomic, strong)UIButton *videoBtn;

@property(nonatomic, strong)UIButton *locationBtn;

@property(nonatomic, strong)UIButton *fileBtn;

@property(nonatomic, strong)UITextField *inputField;

@property(nonatomic, strong)UIButton *sendBtn;

@property(nonatomic, strong)UIButton *closeBtn;

@property(nonatomic, assign)BOOL isFace;

@end

@implementation MessageSendView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.isFace = YES;
        
        self.bgView = [[UIView alloc] init];
        [self addSubview:self.bgView];
        
        self.faceBtn = [[UIButton alloc] init];
        [self addSubview:self.faceBtn];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self.faceBtn addGestureRecognizer:pan];
        
        self.photoBtn = [[UIButton alloc] init];
        self.photoBtn.hidden = YES;
        [self addSubview:self.photoBtn];
        
        self.cameraBtn = [[UIButton alloc] init];
        self.cameraBtn.hidden = YES;
        [self addSubview:self.cameraBtn];
        
        self.audioBtn = [[UIButton alloc] init];
        self.audioBtn.hidden = YES;
        [self addSubview:self.audioBtn];
        
        self.videoBtn = [[UIButton alloc] init];
        self.videoBtn.hidden = YES;
        [self addSubview:self.videoBtn];
        
        self.locationBtn = [[UIButton alloc] init];
        self.locationBtn.hidden = YES;
        [self addSubview:self.locationBtn];
        
        self.fileBtn = [[UIButton alloc] init];
        self.fileBtn.hidden = YES;
        [self addSubview:self.fileBtn];
        
        self.closeBtn = [[UIButton alloc] init];
        self.closeBtn.hidden = YES;
        [self.closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.closeBtn];
        
        self.inputField = [[UITextField alloc] init];
        self.inputField.placeholder = @"Ask me something...";
        self.inputField.font = [UIFont barryFontOfSize:16];
        self.inputField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.inputField.placeholder attributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]}];
        [self addSubview:self.inputField];
        
        self.sendBtn = [[UIButton alloc] init];
        [self.sendBtn setImage:[UIImage imageNamed:@"send"] forState:UIControlStateNormal];
        [self.sendBtn addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.sendBtn];
        
        if ([[ThemeManager getInstance] currentTheme] == ThemeTypeDark) {
            self.backgroundColor = kRGBColor(28, 51, 81);
            self.bgView.backgroundColor = kRGBColor(21, 34, 51);
            [self.faceBtn setImage:[UIImage imageNamed:@"Dark_emotion"] forState:UIControlStateNormal];
            self.inputField.textColor = [UIColor whiteColor];
            [self.photoBtn setImage:[UIImage imageNamed:@"Dark_photo"] forState:UIControlStateNormal];
            [self.cameraBtn setImage:[UIImage imageNamed:@"Dark_camera"] forState:UIControlStateNormal];
            [self.audioBtn setImage:[UIImage imageNamed:@"Dark_audio"] forState:UIControlStateNormal];
            [self.videoBtn setImage:[UIImage imageNamed:@"Dark_video"] forState:UIControlStateNormal];
            [self.locationBtn setImage:[UIImage imageNamed:@"Dark_location"] forState:UIControlStateNormal];
            [self.fileBtn setImage:[UIImage imageNamed:@"Dark_file"] forState:UIControlStateNormal];
            [self.closeBtn setImage:[UIImage imageNamed:@"Dark_close"] forState:UIControlStateNormal];
        } else {
            self.backgroundColor = kRGBColor(242, 243, 247);
            self.bgView.backgroundColor = [UIColor whiteColor];
            [self.faceBtn setImage:[UIImage imageNamed:@"Light_emotion"] forState:UIControlStateNormal];
            self.inputField.textColor = [UIColor blackColor];
            [self.photoBtn setImage:[UIImage imageNamed:@"Light_photo"] forState:UIControlStateNormal];
            [self.cameraBtn setImage:[UIImage imageNamed:@"Light_camera"] forState:UIControlStateNormal];
            [self.audioBtn setImage:[UIImage imageNamed:@"Light_audio"] forState:UIControlStateNormal];
            [self.videoBtn setImage:[UIImage imageNamed:@"Light_video"] forState:UIControlStateNormal];
            [self.locationBtn setImage:[UIImage imageNamed:@"Light_location"] forState:UIControlStateNormal];
            [self.fileBtn setImage:[UIImage imageNamed:@"Light_file"] forState:UIControlStateNormal];
            [self.closeBtn setImage:[UIImage imageNamed:@"Light_close"] forState:UIControlStateNormal];
        }
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bgView.frame = CGRectMake(20, 0, kScreenWidth - 40, 50);
    self.bgView.layer.cornerRadius = 25;
    
    self.faceBtn.frame = CGRectMake(20, 0, 50, 50);
    self.faceBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.inputField.frame = CGRectMake(70, 10, kScreenWidth - 150, 30);
    
    self.sendBtn.frame = CGRectMake(kScreenWidth - 70, 0, 50, 50);
    
    CGFloat width = (kScreenWidth - 40) / 7;
    CGFloat y = 25 - width/2;
    self.photoBtn.frame = CGRectMake(20, 0, width, width);
    self.photoBtn.imageEdgeInsets = UIEdgeInsetsMake(12, 10, 10, 8);
    
    self.cameraBtn.frame = CGRectMake(20 + width, y, width, width);
    self.cameraBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.audioBtn.frame = CGRectMake(20 + width * 2, y, width, width);
    self.audioBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.videoBtn.frame = CGRectMake(20 + width * 3, y, width, width);
    self.videoBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.locationBtn.frame = CGRectMake(20 + width * 4, y, width, width);
    self.locationBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.fileBtn.frame = CGRectMake(20 + width * 5, y, width, width);
    self.fileBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.closeBtn.frame = CGRectMake(20 + width * 6, y, width, width);
}

// 滑动表情按钮
- (void)pan:(UIPanGestureRecognizer *)sender
{
    self.inputField.hidden = YES;
    CGPoint transP = [sender translationInView:self.faceBtn];
    if (transP.x < 0) {
        [self updateCellFrame:20 animation:NO];
        return;
    }
    
    [self updateCellFrame:transP.x + 20 animation:NO];
    
    if (sender.state == UIGestureRecognizerStateEnded || sender.state == UIGestureRecognizerStateCancelled) {
        if (transP.x >= 100) {
            [self updateCellFrame:20 animation:NO];
            
            // 翻转出其他功能按钮
            [self transMoreModes];
        } else {
            [self updateCellFrame:20 animation:YES];
        }
    }
}

// 滑动frame
- (void)updateCellFrame:(CGFloat)x animation:(BOOL)animation
{
    if (animation) {
        [UIView animateWithDuration:0.3 animations:^{
            self.faceBtn.frame = CGRectMake(x, self.faceBtn.frame.origin.y, self.faceBtn.frame.size.width, self.faceBtn.frame.size.height);
        } completion:^(BOOL finished) {
            if (x == 20) {
                self.inputField.hidden = NO;
            }
        }];
    } else {
        self.faceBtn.frame = CGRectMake(x, self.faceBtn.frame.origin.y, self.faceBtn.frame.size.width, self.faceBtn.frame.size.height);
        if (x == 20) {
            self.inputField.hidden = NO;
        }
    }
}

// 发送
- (void)send
{
    
}

// 翻转出其他功能按钮
- (void)transMoreModes
{
    self.isFace = !self.isFace;
    [UIView animateWithDuration:0.3 animations:^{
        self.bgView.transform = CGAffineTransformScale(self.bgView.transform, 1.0, -1.0);
    } completion:^(BOOL finished) {
        [self showOrHide];
    }];
}

// 显示/隐藏按钮
- (void)showOrHide
{
    if (self.isFace) {
        // 表情模式
        self.faceBtn.hidden = NO;
        self.inputField.hidden = NO;
        self.sendBtn.hidden = NO;
        
        self.photoBtn.hidden = YES;
        self.cameraBtn.hidden = YES;
        self.audioBtn.hidden = YES;
        self.videoBtn.hidden = YES;
        self.locationBtn.hidden = YES;
        self.fileBtn.hidden = YES;
        self.closeBtn.hidden = YES;
    } else {
        // 其他模式
        self.faceBtn.hidden = YES;
        self.inputField.hidden = YES;
        self.sendBtn.hidden = YES;
        
        self.photoBtn.hidden = NO;
        self.cameraBtn.hidden = NO;
        self.audioBtn.hidden = NO;
        self.videoBtn.hidden = NO;
        self.locationBtn.hidden = NO;
        self.fileBtn.hidden = NO;
        self.closeBtn.hidden = NO;
    }
}

// 关闭多模式
- (void)close
{
    [self transMoreModes];
}

@end
