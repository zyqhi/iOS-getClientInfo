//
//  ViewController.m
//  ClientTest
//
//  Created by 王鹏飞 on 16/7/1.
//  Copyright © 2016年 王鹏飞. All rights reserved.
//

#import "ViewController.h"
#import "BasicViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSDictionary *infosDict;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 60;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
    
    _infosDict = @{
                   @(BasicInfoTypeHardWare): @"HardWare",
                   @(BasicInfoTypeBattery): @"Battery",
                   @(BasicInfoTypeIpAddress): @"IpAddress",
                   @(BasicInfoTypeCPU): @"CPU",
                   @(BasicInfoTypeDisk): @"Disk"
                   };
}

- (void)viewDidAppear:(BOOL)animated {
    self.navigationItem.title = nil;
}

- (void)_pushVCWithType:(BasicInfoType)type title:(NSString *)title {
    BasicViewController *basicVC = [[BasicViewController alloc] initWithType:type];
    basicVC.navigationItem.title = title;
    [self.navigationController pushViewController:basicVC  animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _infosDict.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = _infosDict[@(indexPath.row)];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self _pushVCWithType:indexPath.row title:_infosDict[@(indexPath.row)]];
}

@end
