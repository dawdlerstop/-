//
//  AppDelegate.m
//  代理实战
//
//  Created by Bruce on 15/12/9.
//  Copyright © 2015年 Bruce. All rights reserved.
//
/*
 1、属性  setter getter  实现BabyBox里面的隐藏导航栏
 2、封装继承  封装BabyBox中的BaseViewController 让所有视图控制器都继承它
 3、设置分栏控制器里面tabBar的图层颜色
 4、默认选中分栏控制器里面的哪一个Item
 5、runtime：通过字符串获得类名NSClassFromString(@"")
 6、代理：反向传值使用代理；在不知道什么时候方法执行完毕也可以使用代理
 使用步骤：
 (1)声明代理方法
 (2)声明接口属性
 (3)确定什么时候触发代理 //前三步是写在给别人值那  第二个页面
 (4)导入类名，代理名
 (5)挂上代理（是否能调用代理方法）
 (6)实现代理方法   //后三步是写在接收数据那  第一个页面
 
 */
#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    self.window.rootViewController = nc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
