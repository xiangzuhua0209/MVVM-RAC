//
//  ZHViewModelNavigationImpl.m
//  ZHMVVMRACDemo
//
//  Created by xiangzuhua on 2018/5/22.
//  Copyright © 2018年 向祖华. All rights reserved.
//

#import "ZHViewModelNavigationImpl.h"

@interface ZHViewModelNavigationImpl()

@property(nonatomic,weak)UINavigationController *navigationController;

@end


@implementation ZHViewModelNavigationImpl

- (instancetype)initWithNavigationController:(UINavigationController *)navi{
    self = [super init];
    if (self) {
        _navigationController = navi;
    }
    return self;
}

-(void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    _navigationController.tabBarController.selectedIndex = selectedIndex;
}

-(void)pushViewModel:(id)viewModel animated:(BOOL)animated{
    if (!_navigationController) {
        NSLog(@"没有导航");
        SHOW_ERROE(@"导航错误");
        DISMISS_SVP(1.2);
        return;
    }
    if (_className.length <= 0) {
        [SVProgressHUD showWithStatus:@"错误，未指定viewController"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return;
    }
    ZHBaseViewController * vc = [[NSClassFromString(_className) alloc]initWithViewModel:viewModel];
    if (!vc) {
        NSLog(@"VC名字错误");
        return;
    }
    [_navigationController pushViewController:vc animated:animated];
}
-(void)popViewControllerWithAnimation:(BOOL)animated{
    if (!_navigationController) {
        NSLog(@"没有导航");
        return;
    }
    [_navigationController popViewControllerAnimated:animated];
}

-(void)popToRootViewModelWithAnimation:(BOOL)animated{
    if (!_navigationController) {
        NSLog(@"没有导航");
        return;
    }
    [_navigationController popToRootViewControllerAnimated:animated];
}

-(void)presentViewModel:(ZHBaseViewModel *)viewModel animated:(BOOL)animated complete:(void (^)())complete{
    if (!_navigationController) {
        NSLog(@"没有导航");
        return;
    }
    if (_className.length <= 0) {
        [SVProgressHUD showWithStatus:@"错误，未指定viewController"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return;
    }
    ZHBaseViewController * vc = [[NSClassFromString(_className) alloc] initWithViewModel:viewModel];
    if (!vc) {
        NSLog(@"VC名字错误");
        return;
    }
    [_navigationController presentViewController:vc animated:animated completion:complete];
}

-(void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated complete:(void (^)())complete{
    if (!_navigationController) {
        NSLog(@"没有导航");
        SHOW_ERROE(@"导航错误");
        DISMISS_SVP(1.2);
        return;
    }
    [_navigationController presentViewController:viewController animated:animated completion:complete];
}


@end
