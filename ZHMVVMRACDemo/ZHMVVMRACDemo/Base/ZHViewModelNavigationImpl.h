//
//  ZHViewModelNavigationImpl.h
//  ZHMVVMRACDemo
//
//  Created by xiangzuhua on 2018/5/22.
//  Copyright © 2018年 向祖华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHViewModelNavigationImpl : NSObject<ZHViewModelServices>

@property(nonatomic,copy)NSString *className;

@property(nonatomic,assign)NSInteger selectedIndex;

-(instancetype)initWithNavigationController:(UINavigationController*)navi;




@end
