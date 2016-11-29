//
//  NBLOperationCreateViewController.m
//  NBLNSOperationDemo
//
//  Created by snb on 16/11/28.
//  Copyright © 2016年 neebel. All rights reserved.
//

#import "NBLOperationCreateViewController.h"

@interface NBLOperationCreateViewController ()

@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UITextView *infoTextView;

@end

@implementation NBLOperationCreateViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"创建";
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
    //    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(sayHello) object:nil];
    //    [operation start];
    
    //    NSInvocationOperation *downloadOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadPic) object:nil];
    //    [downloadOperation start];
    //    NSLog(@"complete");
    
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"start download ------ %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:2.0];
    }];
    
    [blockOperation addExecutionBlock:^{
        NSLog(@"hello1 ------ %@", [NSThread currentThread]);
    }];
    
    [blockOperation addExecutionBlock:^{
        NSLog(@"hello2 ------ %@", [NSThread currentThread]);
    }];
    
    [blockOperation addExecutionBlock:^{
        NSLog(@"hello3 ------ %@", [NSThread currentThread]);
    }];
    
    [blockOperation start];
    
    NSLog(@"complete------ %@", [NSThread currentThread]);
}

//- (void)sayHello
//{
//    NSLog(@"Hello World");
//}


//- (void)downloadPic
//{
//    NSLog(@"start download");
//    [NSThread sleepForTimeInterval:2.0];
//}

@end
