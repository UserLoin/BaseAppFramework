//
//  NSString+SPExtension.h
//  AnyApp3
//
//  Created by 罗盼 on 2017/11/11.
//  Copyright © 2017年 罗盼. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (SPExtension)

/**
 1. 判断字符串是否为空
 */
- (BOOL)isBlankString:(NSString *)string;
- (BOOL)isBlankString;
/**
 * 2.1 判断手机号
 */
- (BOOL)isPhoneNumber;

/**
 * 2.2 判断手机号
 */
- (BOOL)isValidateMobile:(NSString *)mobileNum;

/**
 * 2.3 判断手机号为国际手机号
 */
-(BOOL)isGloabelNumberWithString:(NSString *)str;

/**
 * 3. 判断邮箱
 */
-(BOOL)isEmailWithString:(NSString *)str;

/**
 * 4. 无空格和换行的字符串
 */
- (NSString *)noWhiteSpaceString;

/**
 * 5. 计算字体大小和换行需要最大换行距离
 */
- (CGSize)sizeWithText:(UIFont *)font maxW:(CGFloat)maxW;

/**
 * 6. 计算字体大小和换行
 */
- (CGSize)sizeWithText:(UIFont *)font;

/**
 *  7.计算当前文件\文件夹的内容大小
 */
- (NSInteger)fileSize;

/**
 返回处理过的字符串，只保留小数点后两位，结尾0省略
 */
- (instancetype)dealedPriceString;
/**
 * 判断中文和英文字符串的长度
 */
- (int)convertToInt:(NSString*)strtemp;

@end
