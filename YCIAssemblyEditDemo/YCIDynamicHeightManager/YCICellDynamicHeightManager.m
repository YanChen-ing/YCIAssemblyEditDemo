//
//  YCICellDynamicHeightManager.m
//  JianHuo
//
//  Created by yanchen on 15/7/13.
//  Copyright (c) 2015年 易达正丰. All rights reserved.
//

#import "YCICellDynamicHeightManager.h"

@interface YCICellDynamicHeightManager ()

@property (nonatomic ,strong) UITableViewCell<YCICellDynamicHeightManagerDelegate> *cell;

@end

@implementation YCICellDynamicHeightManager

- (instancetype)initWithCellClass:(Class)aClass{
    self = [super init];
    if (self) {
       _cell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(aClass) owner:nil options:nil][0];
        [self cellToSetPerferredWidth];
        
    }
    return self;
}

- (instancetype)initWithCell:(UITableViewCell<YCICellDynamicHeightManagerDelegate> *)aCell{
    self = [super init];
    if (self) {
        _cell = aCell;
        [self cellToSetPerferredWidth];
    }
    return self;
}

/**
 *  需要根据屏幕手动调整cell的宽度,未进入Layout阶段,宽度还属于设计值
 */
- (void)cellToSetPerferredWidth{
    if ([_cell respondsToSelector:@selector(setUpPreferredWidth)]) {
        [_cell setUpPreferredWidth];
    }else{
        CGRect frame = _cell.frame;
        frame.size.width = [UIScreen mainScreen].bounds.size.width;
    }
}

- (CGFloat)cellHeightWithModel:(NSObject *)model{
    
    [_cell bindDataWithModel:model];
    
    CGFloat height = [_cell getCellHeight];
    
    if (height > 1) {      //如果已经计算过
        return height;
    }
    
    [_cell updateConstraintsIfNeeded];
    [_cell layoutIfNeeded];
    
    height = [_cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height ++;
    
    [_cell saveCellHeight:height];
    
    return height;
}

@end
