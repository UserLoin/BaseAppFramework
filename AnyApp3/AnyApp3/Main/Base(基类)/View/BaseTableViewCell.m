//
//  BaseTableViewCell.m
//  AnyApp
//
//  Created by 罗盼 on 2017/10/17.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (UITableView *)tableView {
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version >= 7.0) {
        return (UITableView *)self.superview.superview;
    } else {
        return (UITableView *)self.superview;
    }
}

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        self.contentView.backgroundColor = [UIColor clearColor];
        
        [self sp_setupViews];
    }
    return self;
}
- (void)sp_setupViews{}

#pragma mark - 注册方式创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    if (tableView == nil) {
        return [[self alloc] init];
    }
    NSString *classname = NSStringFromClass([self class]);
    NSString *identifier = [classname stringByAppendingString:@"CellID"];
    [tableView registerClass:[self class] forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

#pragma mark - Nib方式创建cell
+ (instancetype)nibCellWithTableView:(UITableView *)tableView {
    if (tableView == nil) {
        return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    }
    NSString *classname = NSStringFromClass([self class]);
    NSString *identifier = [classname stringByAppendingString:@"nibCellID"];
    UINib *nib = [UINib nibWithNibName:classname bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

@end
