//
//  ViewController.m
//  代理实战
//
//  Created by Bruce on 15/12/9.
//  Copyright © 2015年 Bruce. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.9608 green:0.9608 blue:0.9608 alpha:1.0];
    self.title = @"首页";
//     更新
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"登录" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor brownColor];
    [button addTarget:self action:@selector(doit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)doit{
    LoginViewController *login = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
