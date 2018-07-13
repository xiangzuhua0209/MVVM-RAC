//
//  ZHLoginViewModel.h
//  ZHMVVMRACDemo
//
//  Created by xiangzuhua on 2018/5/22.
//  Copyright © 2018年 向祖华. All rights reserved.
//

#import "ZHBaseViewModel.h"

@interface ZHLoginViewModel : ZHBaseViewModel

@property(nonatomic,strong)NSString *phoneNum;

@property(nonatomic,strong)NSString *codeNum;

@property(nonatomic,strong)RACSignal *phoneSignal;

@property(nonatomic,strong)RACSignal *canLoginSignal;

@property(nonatomic,strong)RACSignal *canCodeSignal;

@property(nonatomic,strong)RACCommand *codeCommand;

@property(nonatomic,strong)RACCommand *loginCommand;


@end
