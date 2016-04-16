

//
//  RegisterViewController.m
//  代理实战
//
//  Created by Bruce on 15/12/9.
//  Copyright © 2015年 Bruce. All rights reserved.
//



#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>
{
    NSString *accString;
    NSString *pswString;
    NSString *rpswString;
}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.9608 green:0.9608 blue:0.9608 alpha:1.0];
    self.title = @"注册";
    
    NSArray *titleList = @[@"帐号",@"密码",@"确认密码"];
    for (int i=0; i<titleList.count; i++) {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 80+44*i, CGRectGetWidth([UIScreen mainScreen].bounds), 44)];
        textField.borderStyle = UITextBorderStyleLine;
        textField.backgroundColor = [UIColor whiteColor];
        textField.placeholder = titleList[i];
        textField.tag = 100+i;
       
        textField.delegate = self;
        if (i != 0) {
//        设置输入内容是密文形式显示
            textField.secureTextEntry = YES;
        }

        [self.view addSubview:textField];
        
    }
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(200, 400, 100, 100);
    [button setTitle:@"注册" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor brownColor];
    [button addTarget:self action:@selector(done) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 100) {
        accString = textField.text;
    }if (textField.tag == 101) {
        pswString = textField.text;
    }
    
    switch (textField.tag) {
        case 100:
            accString = textField.text;
            break;
        case 101:
            pswString = textField.text;
            break;
        case 102:
            rpswString = textField.text;
            break;
        default:
            break;
    }
    
}

- (void)done{
    
    for (int i=0; i<3; i++) {
        UITextField *tt = [self.view viewWithTag:100+i];
        [tt resignFirstResponder];
    }
    NSLog(@"%@ %@ %@",accString, pswString,rpswString);
    
//    3、什么时候（当点击注册的时候）调用代理
    [self.delegate didRegisterWithName:accString psw:pswString];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    //    popViewControllerAnimated 返回上一页
    //    self.navigationController popToViewController:(nonnull UIViewController *) animated:<#(BOOL)#> 返回哪一个页面
    //    popToRootViewControllerAnimated 返回首页
//    self.navigationController.viewControllers已经压栈进入过得视图控制器
    
//    UIViewController *vc = self.navigationController.viewControllers[1];
    
//    [self.navigationController popToViewController:vc animated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
