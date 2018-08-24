//
//  AppDelegate+Service.m
//  AnyApp3
//
//  Created by 罗盼 on 2017/11/11.
//  Copyright © 2017年 罗盼. All rights reserved.
//

#import "AppDelegate+Service.h"
#import "CTTabBarController.h"

@interface AppDelegate()<UITabBarControllerDelegate>
@end

@implementation AppDelegate (Service)

#pragma mark- 创建Window
- (void)setupWindow{
    
    //创建窗口
    UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    
    //设置跟控制器
    CTTabBarController *rootVc = [[CTTabBarController alloc]init];
    rootVc.delegate = self;
    self.window.rootViewController = rootVc;
    
    //显示窗口
    [self.window makeKeyAndVisible];
}

#pragma mark- 设置键盘监听管理
- (void)setupIQKeyboard{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
}
@end
