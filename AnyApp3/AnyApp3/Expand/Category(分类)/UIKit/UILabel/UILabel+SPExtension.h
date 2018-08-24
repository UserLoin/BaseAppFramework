//
//  UILabel+SPExtension.h
//  AnyApp3
//
//  Created by 罗盼 on 2017/11/11.
//  Copyright © 2017年 罗盼. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SPExtension)

#pragma mark - 1. 初始化Label
/**
 *  1.1 对象方法快速创建label
 */
- (instancetype)initWithFont:(UIFont *)font
                   textColor:(UIColor *)textColor
               textAlignment:(NSTextAlignment)textAlignment;
/**
 *  1.2 类方法快速创建label
 */
+ (instancetype)labelWithFont:(UIFont *)font
                    textColor:(UIColor *)textColor
                textAlignment:(NSTextAlignment)textAlignment;

#pragma mark - 2. 给Label设置行间距+字间距+获取高度
/**
 *  2.1 改变行间距
 */
- (void)sp_setLineSpace:(float)space;

/**
 *  2.2 改变字间距
 */
- (void)sp_setWordSpace:(float)space;

/**
 *  2.3 改变行间距和字间距
 */
- (void)sp_setLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

/**
 *  2.4 获取带行间距label的高度
 */
-(CGFloat)sp_getLabelHeightWithFont:(UIFont*)font width:(CGFloat)width lineSpice:(CGFloat)lineSpice;

/**
 *  2.5 获取带行间距和字间距label的高度
 */
-(CGFloat)sp_getLabelHeightWithFont:(UIFont*)font width:(CGFloat)width lineSpice:(CGFloat)lineSpice wordSpice:(CGFloat)wordSpice;


#pragma mark - 3. 给Label设置字体+颜色+下划线+中划线
/**
 *  3.1 给Label设置不同字体颜色 + 给范围
 */
- (void)sp_setLabelTextColor:(UIColor *)color font:(UIFont *)font range:(NSRange)range;

/**
 *  3.2 给Label设置不同字体颜色 + 给范围 + 下/中划线
 */
- (void)sp_setLabelTextColor:(UIColor *)color font:(UIFont *)font range:(NSRange)range isStrike:(BOOL)isStrike isUnderline:(BOOL)isUnderline;

/**
 *  3.3 给Label设置不同字体颜色 + 给字符串
 */
- (void)sp_setLabelTextWithColor:(UIColor *)color font:(UIFont *)font sring:(NSString *)string;

/**
 *  3.4 给Label设置不同字体颜色 + 给字符串 + 下/中划线
 */
- (void)sp_setLabelTextWithColor:(UIColor *)color font:(UIFont *)font sring:(NSString *)string isStrike:(BOOL)isStrike isUnderline:(BOOL)isUnderline;
/**
 *  3.5 给Label添加下/中划线
 */
- (void)sp_setLabelTextWithStrike:(BOOL)isStrike Underline:(BOOL)isUnderline;

@end
