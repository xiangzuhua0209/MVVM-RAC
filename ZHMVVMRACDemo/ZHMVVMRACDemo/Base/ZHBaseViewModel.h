//
//  ZHBaseViewModel.h
//  ZHMVVMRACDemo
//
//  Created by xiangzuhua on 2018/5/22.
//  Copyright © 2018年 向祖华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHViewModelServices.h"
#import "ZHViewModelNavigationImpl.h"


@interface ZHBaseViewModel : NSObject

@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)ZHViewModelNavigationImpl *naviImpl;

-(instancetype)initWithServices:(id<ZHViewModelServices>)servies params:(NSDictionary *)params;

/*
 * 判断是否登录
 * 如果没有登录，是否跳转到登录界面
 */
-(BOOL)judgeWhetherLogin:(BOOL)goLogin;
@end
