//
//  YCIEditableCellViewModel.h
//  YCIAssemblyEditDemo
//
//  Created by yanchen on 15/8/19.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreImage/CoreImage.h>

const static NSString *cTextFieldName = @"YCITitleTextFieldCell";
const static NSString *cTextViewName  = @"YCITitleTextViewCell";
const static NSString *cCallPickerViewName  = @"YCITitleCallPickerViewCell";

/**
 *  用于可编辑cell展示的数据模型
 */
@interface YCIEditableCellViewModel : NSObject

/**
 *  cell的类名,必须保证正确
 */
@property (nonatomic, copy  ) NSString *cellName;
/**
 *  cell 展示的类型,模式用来控制展示样式,或输入限制法则等
 */
@property (nonatomic,       ) NSUInteger type;

@property (nonatomic, copy  ) NSString *title;

/**
 *  强引用,直接修改原模型的数据.
 */
@property (nonatomic, strong) NSString *content;

/**
 *  补充数据
 */
@property (nonatomic, strong) id supplement;


/** 记录cell的高度*/
@property (nonatomic,       ) CGFloat cellHeight;


@end
