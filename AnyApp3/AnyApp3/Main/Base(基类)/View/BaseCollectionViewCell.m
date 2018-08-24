//
//  BaseCollectionViewCell.m
//  AnyApp
//
//  Created by 罗盼 on 2017/10/17.
//  Copyright © 2017年 咖达. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self sp_setupViews];
    }
    return self;
}

- (void)sp_setupViews {}

@end
