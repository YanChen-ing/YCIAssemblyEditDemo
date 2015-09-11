//
//  YCIPickerView.h
//  YCIAssemblyEditDemo
//
//  Created by yanchen on 15/8/18.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import <UIKit/UIKit.h>

//MARK::暂不支持关联切换(注:component1 根据 component0的结果显示)

typedef void(^FinishBlock)(NSArray *array);

@interface YCIPickerView : UIView



@property (nonatomic, copy  ) FinishBlock doFinish;

+ (instancetype)sharedInstance;


- (void)setTitle:(NSString *)str pickerDataArr:(NSArray *)dataArr completion:(FinishBlock)finish;
/**
 *  设置pickerview的数据
 *
 *  @param str     标题
 *  @param dataArr 数据,必须是二维数组,第一维表示组件列数,第二维表示行数
 *  @param kvcPath 内层数组中,若为model,通过kvc的方式,取得要显示title.若为string,传入@"".
 */
- (void)setTitle:(NSString *)str pickerDataArr:(NSArray *)dataArr titleKVCPathArray:(NSArray *)propertyNameArray completion:(FinishBlock)finish;


- (void)show;

@end
