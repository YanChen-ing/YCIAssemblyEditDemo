//
//  YCIDatePickerView.m
//  YCIAssemblyEditDemo
//
//  Created by yanchen on 15/8/20.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import "YCIDatePickerView.h"

@interface YCIDatePickerView ()

@property (weak, nonatomic) IBOutlet UIView       *background;

@property (weak, nonatomic) IBOutlet UIView       *bottomBox;
@property (weak, nonatomic) IBOutlet UILabel      *lb_title;
@property (weak, nonatomic,readwrite) IBOutlet UIDatePicker *datePicker;

@end

@implementation YCIDatePickerView

const static CGFloat animateDuration = 0.25;


#pragma mark - ------- interface Method

+ (instancetype)sharedInstance{
    
    static YCIDatePickerView *picker = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        picker = [[NSBundle mainBundle] loadNibNamed:@"YCIDatePickerView" owner:nil options:nil][0];
    });
    
    return picker;
}

- (void)setTitle:(NSString *)title completion:(YCIDateFinishBlock)completion{
    _lb_title.text = title;
    _doFinish      = completion;
}

- (void)show{
    
    self.frame = [UIScreen mainScreen].bounds;
    //初始状态
    self.background.alpha = .0f;
    
    CGRect frame = self.bottomBox.frame;
    frame.origin.y = self.bounds.size.height;
    self.bottomBox.frame = frame;
    
    [[[UIApplication sharedApplication].delegate window] addSubview:self];
    
    __weak YCIDatePickerView  *weakSelf = self;
    [UIView animateWithDuration:animateDuration animations:^{
        weakSelf.background.alpha = .4f;
        
        CGRect frame = self.bottomBox.frame;
        frame.origin.y -= frame.size.height;
        self.bottomBox.frame = frame;
    }];
}

- (void)dismiss{
    
    CGRect frame = self.bottomBox.frame;
    frame.origin.y = self.bounds.size.height;
    
    [UIView animateWithDuration:animateDuration animations:^{
        
        self.background.alpha = .0f;
        self.bottomBox.frame = frame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - ------- action

- (IBAction)handleCancel {
    
    [self dismiss];
}


- (IBAction)handleFinished {
    
    //回调
    if (self.doFinish) {
        _doFinish(_datePicker.date);
    }
    
    [self dismiss];
}

@end
