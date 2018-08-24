//
//  SPRequest.m
//  AnyApp3
//
//  Created by 罗盼 on 2017/11/11.
//  Copyright © 2017年 罗盼. All rights reserved.
//

#import "SPRequest.h"

@implementation SPRequest

+ (instancetype)request {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.operationManager = [AFHTTPSessionManager manager];
    }
    return self;
}

- (void)GET:(NSString *)URLString
 parameters:(NSDictionary*)parameters
    success:(void (^)(SPRequest *request, NSDictionary *responseObject))success
    failure:(void (^)(SPRequest *request, NSError *error))failure {
    
    self.operationQueue = self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [self.operationManager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(self,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"[SPRequest]: %@",error.localizedDescription);
        failure(self,error);
    }];
    
}

- (void)POST:(NSString *)URLString
  parameters:(NSDictionary*)parameters
     success:(void (^)(SPRequest *request, NSDictionary *responseObject))success
     failure:(void (^)(SPRequest *request, NSError *error))failure{
    
    self.operationQueue = self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [self.operationManager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(self,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"[SPRequest]: %@",error.localizedDescription);
        failure(self,error);
    }];
}

- (void)postWithURL:(NSString *)URLString parameters:(NSDictionary *)parameters {
    
    [self POST:URLString
    parameters:parameters
       success:^(SPRequest *request, NSDictionary *responseObject) {
           if ([self.delegate respondsToSelector:@selector(SPRequest:finished:)]) {
               [self.delegate SPRequest:request finished:responseObject];
           }
       }
       failure:^(SPRequest *request, NSError *error) {
           if ([self.delegate respondsToSelector:@selector(SPRequest:Error:)]) {
               [self.delegate SPRequest:request Error:error];
           }
       }];
}

- (void)getWithURL:(NSString *)URLString {
    
    [self GET:URLString parameters:nil success:^(SPRequest *request, NSDictionary *responseObject) {
        if ([self.delegate respondsToSelector:@selector(SPRequest:finished:)]) {
            [self.delegate SPRequest:request finished:responseObject];
        }
    } failure:^(SPRequest *request, NSError *error) {
        if ([self.delegate respondsToSelector:@selector(SPRequest:Error:)]) {
            [self.delegate SPRequest:request Error:error];
        }
    }];
}

- (void)cancelAllOperations{
    [self.operationQueue cancelAllOperations];
}

@end
