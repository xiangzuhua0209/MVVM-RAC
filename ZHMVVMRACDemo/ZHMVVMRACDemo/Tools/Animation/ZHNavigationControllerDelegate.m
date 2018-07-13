//
//  UINavigationControllerDelegate.m
//  ZHMVVMRACDemo
//
//  Created by xiangzuhua on 2018/5/24.
//  Copyright © 2018年 向祖华. All rights reserved.
//

#import "ZHNavigationControllerDelegate.h"

@implementation ZHNavigationControllerDelegate

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        if (self.presentTransition) {
            Class transition = NSClassFromString(self.presentTransition);
            return [[transition alloc] init];
        }
        
    } else if(operation == UINavigationControllerOperationPop){
        if (self.dismissTransition) {
            Class transition = NSClassFromString(self.dismissTransition);
            return [[transition alloc] init];
        }
        
    }
    return nil;
}


@end
