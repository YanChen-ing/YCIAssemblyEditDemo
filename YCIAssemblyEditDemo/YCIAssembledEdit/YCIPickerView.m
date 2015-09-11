//
//  YCIPickerView.m
//  YCIAssemblyEditDemo
//
//  Created by yanchen on 15/8/18.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import "YCIPickerView.h"
#import "AppDelegate.h"

//#define APPDELEGATE (AppDelegate *)([UIApplication sharedApplication].delegate)
//#define APPDELEGATE ([UIApplication sharedApplication].delegate)

@interface YCIPickerView ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSArray *_arr_data;
    NSArray *_arr_propertyNameArray;
}

@property (weak, nonatomic) IBOutlet UIView *background;

@property (weak, nonatomic) IBOutlet UIView *bottomBox;
@property (weak, nonatomic) IBOutlet UILabel      *lb_title;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation YCIPickerView
const static CGFloat animateDuration = 0.25;
/**用于记录被选中元素的位置,位==列,数==行,最多5列 */
static NSInteger selected[5] = {0};

#pragma mark - ------- interface Method

+ (instancetype)sharedInstance{
    
    static YCIPickerView *picker = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        picker = [[NSBundle mainBundle] loadNibNamed:@"YCIPickerView" owner:nil options:nil][0];
//        picker = [[self alloc]init];
    });
    
    return picker;
}

- (void)setTitle:(NSString *)str pickerDataArr:(NSArray *)dataArr completion:(FinishBlock)finish{
    [self setTitle:str pickerDataArr:dataArr titleKVCPathArray:@[@"",@"",@"",@"",@""] completion:finish];
}

- (void)setTitle:(NSString *)str pickerDataArr:(NSArray *)dataArr titleKVCPathArray:(NSArray *)propertyNameArray completion:(FinishBlock)finish{
    
    _lb_title.text = str;
    _arr_data      = dataArr;
    _doFinish      = finish;
    _arr_propertyNameArray   = propertyNameArray;
    
}

- (void)show{
    
    self.frame = [UIScreen mainScreen].bounds;
    //初始状态
    self.background.alpha = .0f;
    
    CGRect frame = self.bottomBox.frame;
    frame.origin.y = self.bounds.size.height;
    self.bottomBox.frame = frame;
    
    [[[UIApplication sharedApplication].delegate window] addSubview:self];
    
    __weak YCIPickerView  *weakSelf = self;
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
    
    NSMutableArray *selectedMARR = [NSMutableArray array];
    
    //转换选中数组
    for (int i = 0; i < 5; i++) {
        NSNumber *num = [NSNumber numberWithInteger: selected[i]];
        [selectedMARR addObject:num];
    }
    
    //回调
    if (self.doFinish) {
        _doFinish(selectedMARR);
    }
    
    [self dismiss];
}

#pragma mark - ------- pickerview

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return _arr_data.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_arr_data[component] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSString *key = _arr_propertyNameArray[component];
    if ([key isEqualToString:@""]) {
        return _arr_data[component][row];
    }
    return [_arr_data[component][row] valueForKey:key];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //记录选中的位置
    selected[component] = row;
}

#pragma mark - ------- logic


@end
