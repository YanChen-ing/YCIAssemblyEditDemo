//
//  YCICellDynamicHeightManager.h
//  JianHuo
//
//  Created by yanchen on 15/7/13.
//  Copyright (c) 2015年 易达正丰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "YCICellDynamicHeightManagerDelegate.h"

/**
 仅支持autolayout布局的cell,必须遵守<YCICellDynamicHeightManagerDelegate>
 */
@interface YCICellDynamicHeightManager : NSObject

/**
 *  注: cell必须遵守协议<YCICellDynamicHeightManagerDelegate>
 */
- (instancetype)initWithCellClass:(Class)aClass;
- (instancetype)initWithCell:(UITableViewCell<YCICellDynamicHeightManagerDelegate> *)aCell;

/**
 *  计算高度,已包含对 获取/存储 高度信息的处理
 */
- (CGFloat)cellHeightWithModel:(NSObject *)model;

@end
