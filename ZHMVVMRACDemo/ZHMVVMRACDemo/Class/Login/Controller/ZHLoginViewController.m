//
//  ZHLoginViewController.m
//  ZHMVVMRACDemo
//
//  Created by xiangzuhua on 2018/5/22.
//  Copyright © 2018年 向祖华. All rights reserved.
//

#import "ZHLoginViewController.h"
#import "ZHLoginViewModel.h"
@interface ZHLoginViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)ZHLoginViewModel * viewModel;

@end

@implementation ZHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindViewModel];
    [self initView];
//    self.navigationController.navigationBar setBackIndicatorImage:[UIImage ]
    // Do any additional setup after loading the view from its nib.
}

-(void)bindViewModel{
    [super bindViewModel];
    
    @weakify(self);
    RAC(self.viewModel,phoneNum) = self.phoneNumberTextField.rac_textSignal;
    RAC(self.viewModel,codeNum) = self.passwordTextField.rac_textSignal;
    RAC(self.LoginButton,enabled) = self.viewModel.canLoginSignal;
    RAC(self.sendMessage,enabled) = self.viewModel.canCodeSignal;
    
    [[self.sendMessage rac_signalForControlEvents:(UIControlEventTouchUpInside)]
     subscribeNext:^(id x) {
         @strongify(self);
         [self.viewModel.codeCommand execute:x];
     }];
    
    [[self.LoginButton rac_signalForControlEvents:(UIControlEventTouchUpInside)]subscribeNext:^(id x) {
        @strongify(self);
        [self.viewModel.loginCommand execute:x];
    }];
    
    [self.viewModel.loginCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        if([x[@"code"] integerValue] == 100){
            @strongify(self);
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

-(void)initView{
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:RGBACOLOR(70, 70, 70, 1)};
    self.phoneNumberTextField.delegate = self;
    self.phoneNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.passwordTextField.delegate = self;
    self.passwordTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    self.sendMessage.layer.cornerRadius = 6;
    self.sendMessage.layer.masksToBounds = YES;
    self.sendMessage.layer.borderColor = THEME_COLOR.CGColor;
    self.sendMessage.layer.borderWidth = 0.3;
    self.sendMessage.enabled = NO;
    
    self.LoginButton.layer.cornerRadius = 6;
    self.LoginButton.layer.masksToBounds = YES;
    self.LoginButton.layer.borderColor = THEME_COLOR.CGColor;
    self.LoginButton.layer.borderWidth = 0.3;
    self.LoginButton.enabled = NO;
    
    
    
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
