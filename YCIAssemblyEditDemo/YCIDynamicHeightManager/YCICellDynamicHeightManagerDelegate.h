//
//  YCICellDynamicHeightManagerDelegate.h
//  YCIAssemblyEditDemo
//
//  Created by yanchen on 15/8/19.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YCICellDynamicHeightManagerDelegate <NSObject>
@required
//根据model刷新UI
- (void)bindDataWithModel:(NSObject *)model;

//保存/获取高度信息,建议保存在model中
- (void)saveCellHeight:(CGFloat)height;
- (CGFloat)getCellHeight;

@optional
//配置宽度
- (void)setUpPreferredWidth;

@end
