//
//  RegisterViewController.h
//  代理实战
//
//  Created by Bruce on 15/12/9.
//  Copyright © 2015年 Bruce. All rights reserved.
//

#import <UIKit/UIKit.h>
//1、声明代理的方法
@protocol RegisterViewControllerDelegate <NSObject>

-(void)didRegisterWithName:(NSString *)name psw:(NSString *)psw;

@end

@interface RegisterViewController : UIViewController

//2、声明接口属性
@property (nonatomic,weak)id<RegisterViewControllerDelegate> delegate;

@end
