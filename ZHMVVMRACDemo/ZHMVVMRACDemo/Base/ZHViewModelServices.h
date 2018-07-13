//
//  ZHViewModelServices.h
//  ZHMVVMRACDemo
//
//  Created by xiangzuhua on 2018/5/22.
//  Copyright © 2018年 向祖华. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZHBaseViewModel;

@protocol ZHViewModelServices <NSObject>

- (void)pushViewModel:(ZHBaseViewModel *)viewModel animated:(BOOL)animated;

- (void)popViewControllerWithAnimation:(BOOL)animated;

- (void)popToRootViewModelWithAnimation:(BOOL)animated;

- (void)presentViewModel:(ZHBaseViewModel *)viewModel animated:(BOOL)animated complete:(void(^)())complete;

///模态弹出vc，用于alert
- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated complete:(void(^)())complete;

@end
