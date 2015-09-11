//
//  YCITitleTextFieldCell.m
//  YCIAssemblyEditDemo
//
//  Created by yanchen on 15/8/18.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import "YCITitleTextFieldCell.h"

@interface YCITitleTextFieldCell ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lb_title;
@property (weak, nonatomic) IBOutlet UITextField *textfield;

@end

@implementation YCITitleTextFieldCell

@synthesize yci_delegate = _yci_delegate;
@synthesize yci_model    = _yci_model;

- (void)awakeFromNib {
    // Initialization code
}

#pragma mark - ------- interface Method
- (void)yci_bindDataWithModel:(YCIEditableCellViewModel *)model{
    _lb_title.text = model.title;
    _textfield.text = model.content;
}

+ (CGFloat)yci_heightWithModel:(YCIEditableCellViewModel *)model{
    return 68;
}

#pragma mark - ------- textfield 

- (void)textFieldDidEndEditing:(UITextField *)textField{
    _yci_model.content = textField.text;
}





@end
