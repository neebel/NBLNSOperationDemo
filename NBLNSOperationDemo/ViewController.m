//
//  ViewController.m
//  NBLNSOperationDemo
//
//  Created by snb on 16/11/15.
//  Copyright © 2016年 neebel. All rights reserved.
//

#import "ViewController.h"
#import "NBLOperationCreateViewController.h"
#import "NBLOperationPriorityViewController.h"
#import "NBLOperationDependencyViewController.h"
#import "NBLOperationCompletionViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *titles;

@end

static NSString *tableViewCellIdentifier = @"tableViewCellIdentifier";

@implementation ViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"操作和操作队列Demo";
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:tableViewCellIdentifier];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Getter

- (UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        tableView.delegate = self;
        tableView.dataSource = self;
        _tableView = tableView;
    }
    
    return _tableView;
}


- (NSArray *)titles
{
    if (!_titles) {
        NSArray *titles = [NSArray arrayWithObjects:@"创建", @"设置优先级", @"设置依赖", @"操作完成的回调", nil];
        _titles = titles;
    }
    
    return _titles;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = nil;
    switch (indexPath.row) {
        case 0:
            vc = [[NBLOperationCreateViewController alloc] init];
            break;
            
        case 1:
            vc = [[NBLOperationPriorityViewController alloc] init];
            break;
            
        case 2:
            vc = [[NBLOperationDependencyViewController alloc] init];
            break;
            
        case 3:
            vc = [[NBLOperationCompletionViewController alloc] init];
            break;
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
