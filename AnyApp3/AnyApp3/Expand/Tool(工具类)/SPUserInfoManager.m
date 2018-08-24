//
//  SPUserInfoManager.m
//  AnyApp3
//
//  Created by 罗盼 on 2017/11/11.
//  Copyright © 2017年 罗盼. All rights reserved.
//

#import "SPUserInfoManager.h"
#import "SPUserInfoModel.h"
#import "SPFileCacheManager.h"

@implementation SPUserInfoManager
+ (instancetype)sharedManager {
    static SPUserInfoManager *_singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[SPUserInfoManager alloc] init];
    });
    return _singleton;
}

// 当前用户信息
- (SPUserInfoModel *)currentUserInfo {
    
    id obj = [SPFileCacheManager getObjectByFileName:NSStringFromClass([SPUserInfoModel class])];
    if (obj != nil) {
        return  obj;
    }
    return nil;
}

// 重置用户信息
- (void)resetUserInfoWithUserInfo:(SPUserInfoModel *)userInfo {
    [userInfo archive];
}

// 登陆
- (void)didLoginInWithUserInfo:(id)userInfo {
    
    SPUserInfoModel *userInfoModel = [SPUserInfoModel modelWithDictionary:userInfo];
    [userInfoModel archive];
    
    [SPFileCacheManager saveUserData:@YES forKey:SPHasLoginFlag];
}

// 退出登陆
- (void)didLoginOut {
    [SPFileCacheManager removeObjectByFileName:NSStringFromClass([SPUserInfoModel class])];
    
    [SPFileCacheManager saveUserData:@NO forKey:SPHasLoginFlag];
}

// 判断是否是登陆状态
- (BOOL)isLogin {
    return [[NSUserDefaults standardUserDefaults] boolForKey:SPHasLoginFlag];
}
@end
