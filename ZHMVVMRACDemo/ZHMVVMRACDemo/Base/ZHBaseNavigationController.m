//
//  ZHBaseNavigationController.m
//  ZHMVVMRACDemo
//
//  Created by 向祖华 on 2018/5/10.
//  Copyright © 2018年 向祖华. All rights reserved.
//

#import "ZHBaseNavigationController.h"
#import "ZHBaseViewController.h"


@interface ZHBaseNavigationController ()<UINavigationControllerDelegate>

@end

@implementation ZHBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetNavi];
    self.delegate = self;
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    // Do any additional setup after loading the view.
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
