//
//  YCIEditableCellMethod.h
//  YCIAssemblyEditDemo
//
//  Created by yanchen on 15/8/19.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCIEditableCellViewModel.h"

/**
 *  可编辑cell的代理协议
 */
@protocol YCIEditableCellDelegate <NSObject>

@optional
- (void)yci_editableCell:(UITableViewCell *)cell heightChanged:(NSInteger)height;

//pickerView
- (void)yci_editableCell:(UITableViewCell *)cell callPickerBtn:(UIButton *)btn selectedArray:(NSArray *)selectedArray;

@end


/**
 *  可编辑cell的共有方法
 */
@protocol YCIEditableCellMethod <NSObject>

@required

@property (nonatomic, weak  ) id<YCIEditableCellDelegate> yci_delegate;

@property (nonatomic, strong) YCIEditableCellViewModel *yci_model;


+ (CGFloat)yci_heightWithModel:(YCIEditableCellViewModel *)model;

- (void)yci_bindDataWithModel:(NSObject *)model;




@end
