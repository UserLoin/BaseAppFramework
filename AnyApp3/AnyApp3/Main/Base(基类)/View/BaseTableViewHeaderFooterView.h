//
//  BaseTableViewHeaderFooterView.h
//  AnyApp
//
//  Created by 罗盼 on 2017/10/17.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewHeaderFooterViewProtocol.h"
@interface BaseTableViewHeaderFooterView : UITableViewHeaderFooterView<BaseTableViewHeaderFooterViewProtocol>

/**
 *  快速创建一个不是从xib中加载的tableview header footer
 */
+ (instancetype)headerFooterViewWithTableView:(UITableView *)tableView;
/**
 *  快速创建一个从xib中加载的tableview header footer
 */
+ (instancetype)nibHeaderFooterViewWithTableView:(UITableView *)tableView;

@end
