//
//  BaseViewController.m
//  AnyApp
//
//  Created by 罗盼 on 2017/10/17.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    BaseViewController *viewController = [super allocWithZone:zone];
    
    @weakify(viewController)
    
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        
        @strongify(viewController)
        [viewController sp_addSubviews];
    }];
    
    [[viewController rac_signalForSelector:@selector(viewWillAppear:)] subscribeNext:^(id x) {
        
        @strongify(viewController)
        [viewController sp_layoutNavigation];
        [viewController sp_getNewData];
    }];
    
    return viewController;
}

#pragma mark - RAC
/**
 *  添加控件
 */
- (void)sp_addSubviews {}

/**
 *  设置navation
 */
- (void)sp_layoutNavigation {}

/**
 *  初次获取数据
 */
- (void)sp_getNewData {}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = SPRandomColor;
}
@end
