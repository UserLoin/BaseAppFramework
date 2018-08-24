//
//  BaseViewControllerProtocol.h
//  AnyApp
//
//  Created by 罗盼 on 2017/10/17.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelProtocol;

@protocol BaseViewControllerProtocol <NSObject>

@optional
- (instancetype)initWithViewModel:(id <BaseViewModelProtocol>)viewModel;

- (void)sp_addSubviews;
- (void)sp_layoutNavigation;
- (void)sp_getNewData;
- (void)recoverKeyboard;
@end
