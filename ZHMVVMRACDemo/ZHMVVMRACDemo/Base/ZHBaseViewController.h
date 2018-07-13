//
//  ZHBaseViewController.h
//  ZHMVVMRACDemo
//
//  Created by 向祖华 on 2018/5/10.
//  Copyright © 2018年 向祖华. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZHBaseViewModel;
@interface ZHBaseViewController : UIViewController
@property(nonatomic,strong,readonly)ZHBaseViewModel *viewModel;
@property(nonatomic,strong,readonly)UIPercentDrivenInteractiveTransition *interactivePopTransition;
-(instancetype)initWithViewModel:(ZHBaseViewModel *)viewModel;

-(void)bindViewModel;
@end
