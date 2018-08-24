//
//  BaseView.m
//  AnyApp
//
//  Created by 罗盼 on 2017/10/17.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "BaseView.h"
#import "AppDelegate.h"

@implementation BaseView

#pragma mark - 初始化1
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self sp_setupViews];
    }
    return self;
}

#pragma mark - 初始化2
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel {
    
    self = [super init];
    if (self) {
        
        [self sp_setupViews];
    }
    return self;
}
- (void)sp_setupViews {}

#pragma mark - 键盘退出屏幕
- (void)sp_addReturnKeyBoard {
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [tap.rac_gestureSignal subscribeNext:^(id x) {
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate.window endEditing:YES];
    }];
    [self addGestureRecognizer:tap];
}

@end
