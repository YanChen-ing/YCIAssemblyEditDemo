//
//  YCIEditBaseViewController.m
//  YCIAssemblyEditDemo
//
//  Created by yanchen on 15/8/18.
//  Copyright (c) 2015年 yanchen. All rights reserved.
//

#import "YCIEditBaseViewController.h"

//cells
#import "YCITitleTextFieldCell.h"
#import "YCITitleTextViewCell.h"
#import "YCITitleCallPickerViewCell.h"

@interface YCIEditBaseViewController ()
{
    
    NSArray *_cellNameArray;
}

@end

@implementation YCIEditBaseViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self yci_initData];
    [self yci_setupUI];
    [self yci_loadData];
    [self registerCellForTableView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   
}

- (void)yci_initData{
    
    
}

- (void)yci_loadData{
    
    _marr_model = [self modelsArrayOfCellInfo];
    
    [self modifyWithModelArray:_marr_model];
}

- (void)yci_setupUI{
    
    self.tableView.allowsSelection = NO;
    //防止显示多余的分割线
    UIView *footer = [[UIView alloc]initWithFrame:CGRectZero];
    [self.tableView setTableFooterView:footer];
}



- (void)registerCellForTableView{
    
    _cellNameArray = @[
                       cTextFieldName,
                       cTextViewName,
                       cCallPickerViewName,
                       ];
    
    [_cellNameArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
        [self.tableView registerNib:[UINib nibWithNibName:obj bundle:nil] forCellReuseIdentifier:obj];
    }];
}
#pragma mark - ------- interface Method

- (NSMutableArray *)modelsArrayOfCellInfo{
    
    static NSArray *arr_propertyName;
    if (!arr_propertyName) {
        arr_propertyName = @[
                             @"cellName",
                             @"type",
                             @"title",
                             @"supplement",
//                             @"inono",
                             ];
        
    }
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"YCIEditableVC" ofType:@"plist"];
    NSDictionary *editableVCDic = [[NSDictionary alloc]initWithContentsOfFile:plistPath];
    NSArray *cellInfoArr = [editableVCDic valueForKey:NSStringFromClass([self class])];
    
    if (cellInfoArr) {
        
        NSMutableArray *marr = [NSMutableArray array];
        
        for (NSDictionary *dic in cellInfoArr) {
            
            YCIEditableCellViewModel *model = [[YCIEditableCellViewModel alloc]init];
            for (NSString *name in arr_propertyName) {
                
                [model setValue:dic[name] forKey:name];
            }
            
            [marr addObject:model];
            
        }
        
        return marr;
    }
    
    return nil;
}

#pragma mark 子类重写
- (NSMutableArray *)modelArrayForCell{
    
    NSMutableArray *marr = [NSMutableArray array];
    
    for (int i = 0; i < 20; i++) {
        
        YCIEditableCellViewModel *model =[[YCIEditableCellViewModel alloc]init];
        
        NSInteger random = arc4random()%_cellNameArray.count;
        model.cellName   = _cellNameArray[random];
        model.title   = @"标大题";
        model.content = @"好多的内容啊好多的内容啊好多的内容啊好多的内容啊好多的内容啊好多的内容啊";
        [marr addObject:model];
    }
    return marr;
}

- (void)modifyCellModelWithModelArray:(NSMutableArray *)marr{
    
}

#pragma mark - ------- setter & getter

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _marr_model.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YCIEditableCellViewModel *model = _marr_model[indexPath.row];
    
    Class<YCIEditableCellMethod> cellClass = NSClassFromString(model.cellName);
    
    return [cellClass yci_heightWithModel:model];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    YCIEditableCellViewModel *model = _marr_model[indexPath.row];
    
    UITableViewCell<YCIEditableCellMethod> *cell = [tableView dequeueReusableCellWithIdentifier:model.cellName forIndexPath:indexPath];
    
    cell.yci_delegate = self;
    
    [cell yci_bindDataWithModel:model];
    
    return cell;
}

#pragma mark - ------- Cell Delegate

#pragma mark  title callPickerView cell Delegate

- (void)yci_editableCell:(UITableViewCell *)cell callPickerBtn:(UIButton *)btn selectedArray:(NSArray *)selectedArray{
    NSLog(@"selected:%@",selectedArray);
}

@end
