//
//  ZHBaseViewController.m
//  ZHMVVMRACDemo
//
//  Created by 向祖华 on 2018/5/10.
//  Copyright © 2018年 向祖华. All rights reserved.
//

#import "ZHBaseViewController.h"
#import "ZHBaseViewModel.h"
#import "ZHNavigationControllerDelegate.h"

@interface ZHBaseViewController ()<UIGestureRecognizerDelegate>
@property(nonatomic,strong,readwrite)ZHBaseViewModel *viewModel;
@property(nonatomic,strong,readwrite)UIPercentDrivenInteractiveTransition *interactivePopTransition;
@property(nonatomic,strong)ZHNavigationControllerDelegate *controllerDelegate;

@end

@implementation ZHBaseViewController

-(instancetype)initWithViewModel:(ZHBaseViewModel *)viewModel{
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

-(void)bindViewModel{
    RAC(self.navigationItem,title) = RACObserve(self.viewModel,title);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBACOLOR(240, 240, 240, 1);
    self.viewModel.naviImpl = [[ZHViewModelNavigationImpl alloc] initWithNavigationController:self.navigationController];
    if (self.navigationController && self != self.navigationController.viewControllers.firstObject) {
//        [self /]
        UIPanGestureRecognizer * popRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePopRecognizer:)];
        popRecognizer.delegate = self;
        
        
    }
    
    self.controllerDelegate = [[ZHNavigationControllerDelegate alloc] init];
    self.controllerDelegate.dismissTransition = @"ZHTransitionFromVCToVC";
    
}

-(void)resetNaviWithTitle:(NSString *)title{
    UIButton * leftBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"backbutton_icon3"] forState:(UIControlStateNormal)];
    leftBtn.frame = CGRectMake(0, 0, 30, 30);
    [leftBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}

-(void)backBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)handlePopRecognizer:(UIPanGestureRecognizer *)recognizer{
    //拖动手势在手机的横向位置比
    CGFloat progress = [recognizer translationInView:self.view].x/CGRectGetWidth(self.view.frame);//progress区分正负
    progress = MIN(1.0, MAX(0.0, progress));//progress的取值范围是0.0 ~ 1.0
    
    static BOOL flag = NO;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        flag = YES;
    }
    
    if (flag && progress > 0) {
        self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
        flag = NO;
    }
    
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        [self.interactivePopTransition updateInteractiveTransition:progress];
    }else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled){
        if (progress > 0.25) {
            [self.interactivePopTransition finishInteractiveTransition];
        }else{
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        self.interactivePopTransition = nil;
    }
}


-(void)dealloc{
    NSLog(@"%@--释放了",NSStringFromClass([self class]));
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
