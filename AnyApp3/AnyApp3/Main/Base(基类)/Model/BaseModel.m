//
//  BaseModel.m
//  AnyApp
//
//  Created by 罗盼 on 2017/10/17.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

MJCodingImplementation;//自定义对象归档

//冲突名
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"names":@"name",
             @"desc":@"description",
             @"responseData": @"data"
             };
}

/**
 *  字典数组转模型数组
 */
+ (NSMutableArray *)modelArrayWithDictArray:(NSArray *)response {
    if ([response isKindOfClass:[NSArray class]]) {
        NSMutableArray *array = [self mj_objectArrayWithKeyValuesArray:response];
        return array;
    }
    return [NSMutableArray new];
}

/**
 *  字典转模型
 */
+ (id)modelWithDictionary:(NSDictionary *)dictionary {
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:dictionary];
    }
    return [[self alloc] init];
}

/**
 *  模型包含模型数组
 */
+ (void)setUpModelClassInArrayWithContainDict:(NSDictionary *)dict {
    if (dict.allKeys.count == 0) {
        return ;
    }
    [self mj_setupObjectClassInArray:^NSDictionary *{
        return dict;
    }];
}

/**
 *  字典数组转模型数组
 *  @param dict     模型包含模型数组 格式为 key-字段名字 value-[被包含的类名]
 */
+ (NSMutableArray *)modelArrayWithDictArray:(NSArray *)response containDict:(NSDictionary *)dict {
    if (dict == nil) {
        dict = [NSMutableDictionary new];
    }
    [self setUpModelClassInArrayWithContainDict:dict];
    return [self modelArrayWithDictArray:response];
}

+ (id)modelWithDictionary:(NSDictionary *)dictionary containDict:(NSDictionary *)dict {
    if (dict == nil) {
        dict = [NSMutableDictionary new];
    }
    [self setUpModelClassInArrayWithContainDict:dict];
    return [self modelWithDictionary:dictionary];
}

/**
 *  解档 - 取出模型
 */
- (id)unarchiver {
    id obj = [SPFileCacheManager getObjectByFileName:[self.class description]];
    return obj;
}

/**
 *  归档 - 存入模型
 */
- (void)archive {
    [SPFileCacheManager saveObject:self byFileName:[self.class description]];
}

/**
 *  移除缓存中的模型
 */
- (void)remove {
    [SPFileCacheManager removeObjectByFileName:[self.class description]];
}
@end
