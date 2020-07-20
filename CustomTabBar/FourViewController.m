//
//  FourViewController.m
//  CustomTabBar
//
//  Created by yang.sun on 2020/6/15.
//  Copyright © 2020 sun. All rights reserved.
//

#import "FourViewController.h"

#define iPhoneX (([UIScreen mainScreen].bounds.size.height) >= 812 ? YES : NO)
#define kBottomSafeHeight (iPhoneX ? 34 : 0)

@interface FourViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

//数据源方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID1 = @"CellID1";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID1];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID1];
    }
    
    cell.backgroundColor = [UIColor yellowColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
    
}

#pragma mark - 懒加载
-(UITableView *)tableView {
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 49 - kBottomSafeHeight)];
        _tableView.backgroundColor = [UIColor redColor];
        _tableView.layoutMargins = UIEdgeInsetsZero;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        //添加页脚，隐藏多余分割线
        UIView *footView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.tableFooterView = footView;
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
            _tableView.estimatedRowHeight = 44;
            _tableView.rowHeight = UITableViewAutomaticDimension;
        }
    }
    return _tableView;
}
@end
