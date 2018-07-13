//
//  ZHTransitionFromVCToVC.m
//  ZHMVVMRACDemo
//
//  Created by xiangzuhua on 2018/5/24.
//  Copyright © 2018年 向祖华. All rights reserved.
//

#import "ZHTransitionFromVCToVC.h"

@implementation ZHTransitionFromVCToVC

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    ZHBaseViewController * fromVC = (ZHBaseViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ZHBaseViewController * toVC = (ZHBaseViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView * containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView transitionFromView:fromVC.view toView:toVC.view duration:duration options:(UIViewAnimationOptionTransitionFlipFromLeft) completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        fromVC.view.transform = CGAffineTransformIdentity;
        toVC.view.transform = CGAffineTransformIdentity;
        
    }];
}


@end
