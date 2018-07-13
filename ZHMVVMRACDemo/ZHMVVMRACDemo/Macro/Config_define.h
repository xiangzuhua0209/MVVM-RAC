//
//  Config_define.h
//  ZHMVVMRACDemo
//
//  Created by 向祖华 on 2018/5/10.
//  Copyright © 2018年 向祖华. All rights reserved.
//
#import "Common_define.h"
/*
                    **配置相关宏定义**
 */
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define WTKLog(fmt, ...) NSLog((@"\n[文件名:%s]\n""[函数名:%s]""[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NSLog(...) {}
#define WTKLog(...);
#endif


//App颜色
#define BASE_COLOR RGBACOLOR(243, 243, 246, 1.0)//基础色

#define THEME_COLOR RGBACOLOR(250, 98, 97, 1)//主色

#define SECONDLY_COLOR RGBACOLOR(210, 210, 210, 1.0)//次主色

#define THEME_COLOR_ALPHA RGBACOLOR(250, 98, 97, 0.99)//带透明度的主题色

#define BACK_COLOR RGBACOLOR(240,240,240,1)//背景色

#define LINE_COLOR RGBACOLOR(50,50,50,1)//线条颜色

#define TITLE_WORDS_COLOR COLORFROM0X(0x5c5c5c) // 主文字颜色

#define DESCRIBE_WORDS_COLOR COLORFROM0X(0x5c5c5c) // 辅助文字颜色

#define LINKS_COLOR [UIColor COLORFROM0X(0x333333) // 链接 (深绿)

