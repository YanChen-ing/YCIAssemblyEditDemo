//
//  YCIModifyInfoViewController.m
//  YCIAssemblyEditDemo
//
//  Created by yanchen on 15/8/20.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import "YCIModifyInfoViewController.h"

@interface YCIModifyInfoViewController ()

@end

@implementation YCIModifyInfoViewController

- (NSMutableArray *)modelArrayForCell{
    
    return [self modelsArrayOfCellInfo];;
}

- (void)modifyWithModelArray:(NSMutableArray *)marr{
    
    for (YCIEditableCellViewModel *model in marr) {
        model.content = @"内容";
    }
}


@end
