//
//  ZHLoginViewModel.m
//  ZHMVVMRACDemo
//
//  Created by xiangzuhua on 2018/5/22.
//  Copyright © 2018年 向祖华. All rights reserved.
//

#import "ZHLoginViewModel.h"

@interface ZHLoginViewModel()

@property(nonatomic,assign)NSInteger code;

@property(nonatomic,assign)NSInteger time;

@end
@implementation ZHLoginViewModel
-(instancetype)initWithServices:(id<ZHViewModelServices>)servies params:(NSDictionary *)params{
    self = [super initWithServices:servies params:params];
    if (self) {
        [self initViewModel];
    }
    return self;
}

-(void)initViewModel{
    @weakify(self);
    RACSignal * phoneSignal = [RACObserve(self, phoneNum)map:^id(id value) {
        @strongify(self);
        return @([self isPhoneNum:value]);
    }];
    
    RACSignal * codeSignal = [RACObserve(self, codeNum)map:^id(id value) {
        @strongify(self);
        return @([self isCodeNum:value]);
    }];
    
    //是否可以点击登录
    self.canLoginSignal = [RACSignal combineLatest:@[phoneSignal,codeSignal]
                                            reduce:^id(NSNumber *phone,NSNumber *code){
        return @([phone boolValue]&&[code boolValue]);
    }];
    
    //是否可以发送验证码
    self.canCodeSignal = [RACSignal combineLatest:@[phoneSignal]
                                           reduce:^id(NSNumber *phone){
        return @([phone boolValue]);
    }];
    
    self.codeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        UIButton *btn = input;
        btn.enabled = NO;
        self.time = 60;
        [btn setTitle:[NSString stringWithFormat:@"%ld",self.time] forState:(UIControlStateNormal)];
        //创建计时器，进行倒计时
        __block NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCodeTime:) userInfo:btn repeats:YES];
        
        //倒计时结束，恢复UI
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(60 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [timer invalidate];
            timer = nil;
            btn.enabled = YES;
            [btn setTitle:@"验证" forState:(UIControlStateNormal)];
        });
        
        //???
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(arc4random() % 12 / 15.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            SHOW_SUCCESS(@"发送成功");
            DISMISS_SVP(1.2);
        });
        return [RACSignal empty];
    }];
    
//    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
//       
//    }];
}

-(void)updateCodeTime:(NSTimer *)timer{
    UIButton *btn = timer.userInfo;
    self.time--;
    if (self.time <= 0) {
        self.time = 60;
        [btn setTitle:@"验证" forState:(UIControlStateNormal)];
    }else{
        [btn setTitle:[NSString stringWithFormat:@"%ld",self.time] forState:(UIControlStateNormal)];
    }
}

-(BOOL)isPhoneNum:(NSString*)phoneNum{
    if ([phoneNum hasPrefix:@"1"]) {
        return phoneNum.length == 13;
    }
    return NO;
}

-(BOOL)isCodeNum:(NSString*)code{
    return [code integerValue] == self.code;
}


@end
