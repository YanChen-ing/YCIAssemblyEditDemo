//
//  YCIDatePickerView.h
//  YCIAssemblyEditDemo
//
//  Created by yanchen on 15/8/20.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YCIDatePickerView : UIView

typedef void(^YCIDateFinishBlock)(NSDate *date);

@property (nonatomic, copy  ) YCIDateFinishBlock doFinish;


@property (weak, nonatomic,readonly) UIDatePicker *datePicker;

+ (instancetype)sharedInstance;

- (void)setTitle:(NSString *)title completion:(YCIDateFinishBlock)completion;

- (void)show;

@end
