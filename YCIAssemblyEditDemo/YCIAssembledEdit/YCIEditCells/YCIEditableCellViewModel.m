//
//  YCIEditableCellViewModel.m
//  YCIAssemblyEditDemo
//
//  Created by yanchen on 15/8/19.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import "YCIEditableCellViewModel.h"

@implementation YCIEditableCellViewModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"YCIEditableCellViewModel:--undefinedKey--%@",key);
}

@end
