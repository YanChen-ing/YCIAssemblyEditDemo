//
//  YCIEditBaseViewController.h
//  YCIAssemblyEditDemo
//
//  Created by yanchen on 15/8/18.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCIEditableCellMethod.h"

@interface YCIEditBaseViewController : UITableViewController<YCIEditableCellDelegate>

@property (nonatomic, strong) NSMutableArray *marr_model;


- (NSMutableArray *)modelsArrayOfCellInfo;

#pragma mark - ------- 重写
/**
 *  子类用于修改显示的方法
 */
- (void)modifyWithModelArray:(NSMutableArray *)marr;



@end
