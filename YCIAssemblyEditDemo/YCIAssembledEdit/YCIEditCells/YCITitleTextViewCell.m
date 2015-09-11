//
//  YCITitleTextViewCell.m
//  YCIAssemblyEditDemo
//
//  Created by yanchen on 15/8/18.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import "YCITitleTextViewCell.h"

@interface YCITitleTextViewCell ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lb_title;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation YCITitleTextViewCell
@synthesize yci_delegate = _yci_delegate;
@synthesize yci_model    = _yci_model;

- (void)awakeFromNib {
    // Initialization code
}

#pragma mark - ------- interface Method

- (void)yci_bindDataWithModel:(YCIEditableCellViewModel *)model{
    _lb_title.text = model.title;
    _textView.text = model.content;
}

+ (CGFloat)yci_heightWithModel:(YCIEditableCellViewModel *)model{
    return 129;
}

#pragma mark - ------- textview

- (void)textViewDidEndEditing:(UITextView *)textView{
    _yci_model.content = textView.text;
}


@end
