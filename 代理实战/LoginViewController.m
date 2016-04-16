//
//  LoginViewController.m
//  代理实战
//
//  Created by Bruce on 15/12/9.
//  Copyright © 2015年 Bruce. All rights reserved.
//

#import "LoginViewController.h"
//4、导入类名代理名
#import "RegisterViewController.h"

@interface LoginViewController ()<UITextFieldDelegate,RegisterViewControllerDelegate>
{
    NSString *accString;
    NSString *pswString;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.9608 green:0.9608 blue:0.9608 alpha:1.0];
    self.title = @"登录";
//     更新
    NSArray *titleList = @[@"帐号",@"密码"];
    NSArray *buttonTitle = @[@"登录",@"注册"];
    for (int i=0; i<2; i++) {
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 80+44*i, CGRectGetWidth([UIScreen mainScreen].bounds), 44)];
        textField.borderStyle = UITextBorderStyleLine;
        textField.backgroundColor = [UIColor whiteColor];
        textField.placeholder = titleList[i];
        textField.tag = 100+i;
        textField.delegate = self;
        [self.view addSubview:textField];

        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(100+i*110, 400, 100, 40);
        [button setTitle:buttonTitle[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor brownColor];
        button.tag = 200+i;
        [button addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 100) {
        accString = textField.text;
    }else{
        pswString = textField.text;
    }
}

- (void)done:(UIButton *)sender{
    
    if (sender.tag == 200) {
        NSLog(@"%@ %@",accString, pswString);
    }else{
        RegisterViewController *reg = [[RegisterViewController alloc]init];
//        5、挂上代理
        reg.delegate = self;
        
        [self.navigationController pushViewController:reg animated:YES];
    }
    
}
//6、实现代理方法
-(void)didRegisterWithName:(NSString *)name psw:(NSString *)psw{
    NSLog(@"%@  %@",name,psw);
    
    UITextField *acc = [self.view viewWithTag:100];
    acc.text = name;
    UITextField *pasw = [self.view viewWithTag:101];
    pasw.text = psw;

    accString = name;
    pswString = psw;
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
