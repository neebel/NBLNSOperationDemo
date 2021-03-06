//
//  NBLOperationPriorityViewController.m
//  NBLNSOperationDemo
//
//  Created by snb on 16/11/28.
//  Copyright © 2016年 neebel. All rights reserved.
//

#import "NBLOperationPriorityViewController.h"

@interface NBLOperationPriorityViewController ()

@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UITextView *infoTextView;

@end

@implementation NBLOperationPriorityViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置优先级";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.startButton];
    [self.view addSubview:self.infoTextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Getter

- (UIButton *)startButton
{
    if (!_startButton) {
        UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 80, 80, 30)];
        [startButton setTitle:@"点我开始" forState:UIControlStateNormal];
        [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [startButton addTarget:self action:@selector(startAction) forControlEvents:UIControlEventTouchUpInside];
        startButton.backgroundColor = [UIColor blueColor];
        _startButton = startButton;
    }
    
    return _startButton;
}


- (UITextView *)infoTextView
{
    if (!_infoTextView) {
        UITextView *infoTextView = [[UITextView alloc] initWithFrame:CGRectMake(60, 120, self.view.frame.size.width - 120, 300)];
        infoTextView.textColor = [UIColor redColor];
        infoTextView.text = @"执行结果请查看控制台输出";
        _infoTextView = infoTextView;
    }
    
    return _infoTextView;
}


#pragma mark - Action

- (void)startAction
{
    NSBlockOperation *downloadPicOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"start download picture ------ %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:2.0];//模拟下载操作
    }];
    [downloadPicOperation setQueuePriority:NSOperationQueuePriorityVeryLow];
    
    
    NSBlockOperation *downloadMusicOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"start download music ------ %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:4.0];//模拟下载操作
    }];
    [downloadMusicOperation setQueuePriority:NSOperationQueuePriorityVeryHigh];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:downloadPicOperation];
    [queue addOperation:downloadMusicOperation];
}

@end
