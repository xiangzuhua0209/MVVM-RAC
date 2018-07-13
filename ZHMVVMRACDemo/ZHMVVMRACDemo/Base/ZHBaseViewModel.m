//
//  ZHBaseViewModel.m
//  ZHMVVMRACDemo
//
//  Created by xiangzuhua on 2018/5/22.
//  Copyright © 2018年 向祖华. All rights reserved.
//

#import "ZHBaseViewModel.h"

@interface ZHBaseViewModel()

@property(nonatomic,weak)id<ZHViewModelServices>servies;
@property(nonatomic,strong)NSDictionary *params;

@end

@implementation ZHBaseViewModel

-(id)initWithServices:(id<ZHViewModelServices>)servies params:(NSDictionary *)params{
    self = [super init];
    if (self) {
        self.title = params[@"title"];
        self.params = params;
        self.servies = servies;
    }
    return self;
}

-(BOOL)judgeWhetherLogin:(BOOL)goLogin{
    return YES;
}

@end
