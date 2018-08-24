//
//  UILabel+SPExtension.m
//  AnyApp3
//
//  Created by 罗盼 on 2017/11/11.
//  Copyright © 2017年 罗盼. All rights reserved.
//

#import "UILabel+SPExtension.h"
#import "NSString+SPExtension.h"

@implementation UILabel (SPExtension)
#pragma mark - 1. 初始化Label
- (instancetype)initWithFont:(UIFont *)font
                   textColor:(UIColor *)textColor
               textAlignment:(NSTextAlignment)textAlignment {
    if (self = [super init]) {
        self.font = font;
        self.textAlignment = textAlignment ? textAlignment : NSTextAlignmentLeft;
        self.textColor = textColor;
    }
    return self;
}
+ (instancetype)labelWithFont:(UIFont *)font
                    textColor:(UIColor *)textColor
                textAlignment:(NSTextAlignment)textAlignment {
    return [[UILabel alloc] initWithFont:font textColor:textColor textAlignment:textAlignment];
}

#pragma mark - 2. 给Label设置行间距+字间距+获取高度
- (void)sp_setLineSpace:(float)space {
    if ([self.text isBlankString]) return;
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
    
}

- (void)sp_setWordSpace:(float)space {
    if ([self.text isBlankString]) return;
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
    
}

- (void)sp_setLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    if ([self.text isBlankString]) return;
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
    
}
-(CGFloat)sp_getLabelHeightWithFont:(UIFont*)font width:(CGFloat)width lineSpice:(CGFloat)lineSpice {
    if ([self.text isBlankString]) return 0;
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpice;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle};
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}
-(CGFloat)sp_getLabelHeightWithFont:(UIFont*)font width:(CGFloat)width lineSpice:(CGFloat)lineSpice wordSpice:(CGFloat)wordSpice{
    if ([self.text isBlankString]) return 0;
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpice;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@(wordSpice)};
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}

#pragma mark - 3. 给Label设置字体+颜色+下划线+中划线
- (void)sp_setLabelTextColor:(UIColor *)color font:(UIFont *)font range:(NSRange)range{
    
    // 如果为空、直接退出
    if ( [self.text isBlankString]) return;
    // 创建富文本
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    // 设置字号
    [attribtStr addAttribute:NSFontAttributeName value:font range:range];
    // 设置文字颜色
    [attribtStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    self.attributedText = attribtStr;
}
- (void)sp_setLabelTextColor:(UIColor *)color font:(UIFont *)font range:(NSRange)range isStrike:(BOOL)isStrike isUnderline:(BOOL)isUnderline {
    // 如果为空、直接退出
    if ([self.text isBlankString]) return;
    // 创建富文本
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    // 设置字号
    [attribtStr addAttribute:NSFontAttributeName value:font range:range];
    // 设置文字颜色
    [attribtStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    //添加中划线
    if (isStrike) {
        [attribtStr setAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)} range:NSMakeRange(0,self.text.length)];
    }
    
    //添加下划线
    if (isUnderline) {
        [attribtStr setAttributes:@{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]} range:NSMakeRange(0,self.text.length)];
    }
    self.attributedText = attribtStr;
    
}
- (void)sp_setLabelTextWithColor:(UIColor *)color font:(UIFont *)font sring:(NSString *)string{
    
    // 如果为空、直接退出
    if ([string isBlankString]) return;
    if ([self.text isBlankString]) return;
    // 计算范围
    NSRange range = [self.text rangeOfString:string];
    if (range.location != NSNotFound) {
        NSLog(@"found at location = %ld, length = %ld",range.location,range.length);
    }else{
        return;
    }
    // 创建富文本
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    // 设置字号
    [attribtStr addAttribute:NSFontAttributeName value:font range:range];
    
    // 设置文字颜色
    [attribtStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    self.attributedText = attribtStr;
}
- (void)sp_setLabelTextWithColor:(UIColor *)color font:(UIFont *)font sring:(NSString *)string isStrike:(BOOL)isStrike isUnderline:(BOOL)isUnderline {
    // 如果为空、直接退出
    if ([string isBlankString]) return;
    if ([self.text isBlankString]) return;
    // 计算范围
    NSRange range = [self.text rangeOfString:string];
    if (range.location != NSNotFound) {
        NSLog(@"found at location = %ld, length = %ld",range.location,range.length);
    }else{
        return;
    }
    // 创建富文本
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    // 设置字号
    [attribtStr addAttribute:NSFontAttributeName value:font range:range];
    
    // 设置文字颜色
    [attribtStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    //添加中划线
    if (isStrike) {
        [attribtStr setAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)} range:NSMakeRange(0,self.text.length)];
    }
    
    //添加下划线
    if (isUnderline) {
        [attribtStr setAttributes:@{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]} range:NSMakeRange(0,self.text.length)];
    }
    self.attributedText = attribtStr;
}
- (void)sp_setLabelTextWithStrike:(BOOL)isStrike Underline:(BOOL)isUnderline{
    // 如果为空、直接退出
    if ([self.text isBlankString]) return;
    // 创建富文本
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    if (isStrike) {
        [attribtStr setAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)} range:NSMakeRange(0,self.text.length)];
    }
    
    //添加下划线
    if (isUnderline) {
        [attribtStr setAttributes:@{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]} range:NSMakeRange(0,self.text.length)];
    }
    self.attributedText = attribtStr;
}
@end
