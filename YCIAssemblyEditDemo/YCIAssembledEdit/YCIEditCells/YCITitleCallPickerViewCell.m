//
//  YCITitleCallPickerViewCell.m
//  YCIAssemblyEditDemo
//
//  Created by yanchen on 15/8/18.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import "YCITitleCallPickerViewCell.h"
//#import "YCIPickerView.h"

//测试
#import "YCIDatePickerView.h"

@interface YCITitleCallPickerViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *lb_title;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation YCITitleCallPickerViewCell
@synthesize yci_delegate = _yci_delegate;
@synthesize yci_model    = _yci_model;

- (void)awakeFromNib {
    // Initialization code
}

- (void)yci_bindDataWithModel:(YCIEditableCellViewModel *)model{
    _lb_title.text = model.title;
    [_btn setTitle:model.content forState:UIControlStateNormal];
}

+ (CGFloat)yci_heightWithModel:(YCIEditableCellViewModel *)model{
    return 68;
}


#pragma mark - ------- action

- (IBAction)handleShowPickerView:(id)sender {
//    YCIPickerView *picker = [YCIPickerView sharedInstance];
//    
//    NSMutableArray *marr = [NSMutableArray array];
//    for (int i = 0; i < 20; i++) {
//        [marr addObject:[NSString stringWithFormat:@"%@",@(i)]];
//    }
//    
//    __weak YCITitleCallPickerViewCell *weakSelf = self;
//    [picker setTitle:@"随便" pickerDataArr:@[marr,marr,marr] completion:^(NSArray *array) {
//        
//        [weakSelf.yci_delegate yci_editableCell:weakSelf callPickerBtn:sender selectedArray:array];
//    }];
//    
//    [picker show];
    
#warning 测试
    YCIDatePickerView *picker = [YCIDatePickerView sharedInstance];
    picker.datePicker.minimumDate = [NSDate date];
    [picker setTitle:@"日期选择" completion:^(NSDate *date) {
        NSLog(@"%@",date);
    }];

    [picker show];
    
}

@end
