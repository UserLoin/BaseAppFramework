//
//  BaseViewProtocol.h
//  AnyApp
//
//  Created by 罗盼 on 2017/10/17.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelProtocol;
@protocol BaseViewProtocol <NSObject>

- (instancetype)initWithViewModel:(id <BaseViewModelProtocol>)viewModel;

- (void)sp_setupViews;
- (void)sp_addReturnKeyBoard;

@end
