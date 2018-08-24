//
//  CTTabBarController.m
//  AnyApp3
//
//  Created by 罗盼 on 2017/11/11.
//  Copyright © 2017年 罗盼. All rights reserved.
//

#import "CTTabBarController.h"
#import "CTNavigationController.h"
#import "SPHomeViewController.h"
#import "SPCircleViewController.h"
#import "SPMeViewController.h"

@interface CTTabBarController ()

@end

@implementation CTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置所有UITabBarItem的文字属性
    [self setupItemTitleTextAttributes];
    
    //添加子控制器
    [self setupChildViewControllers];
}

/**
 设置所有UITabBarItem的文字属性
 */
- (void)setupItemTitleTextAttributes{
    UITabBarItem *item = [UITabBarItem appearance];
    
    //不同状态下的文字
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    //选中状态下的文字
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

/**
 添加子控制器
 */
-(void)setupChildViewControllers{
    
    [self setupOneChildViewController:[[CTNavigationController alloc]initWithRootViewController:[[SPHomeViewController alloc]init]] title:@"修炼" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupOneChildViewController:[[CTNavigationController alloc]initWithRootViewController:[[SPCircleViewController alloc]init]] title:@"交流" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupOneChildViewController:[[CTNavigationController alloc]initWithRootViewController:[[SPMeViewController alloc]init]] title:@"我的" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
}

/**
 初始化一个自控制器
 
 @param vc 自控制器
 @param title 标题tabBar_essence_icon
 @param image 图标
 @param selectedImage 选中的图标
 */
-(void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    vc.tabBarItem.title = title;
    if (image.length) {//图片名有具体值
        vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    [self addChildViewController:vc];
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
