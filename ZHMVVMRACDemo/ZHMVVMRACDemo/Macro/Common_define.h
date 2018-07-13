//
//  Common_define.h
//  ZHMVVMRACDemo
//
//  Created by 向祖华 on 2018/5/10.
//  Copyright © 2018年 向祖华. All rights reserved.
//

/*
                **定义简化代码的宏定义**
 */
/********************* 沙盒路径****************************/
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/* ********************** 屏幕尺寸 ********************** */

// App Frame
#define Application_Frame [[UIScreen mainScreen] applicationFrame]

// App Frame Height&Width
#define App_Frame_Height [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width [[UIScreen mainScreen] applicationFrame].size.width

// MainScreen Height&Width
#define Main_Screen_Height [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width [[UIScreen mainScreen] bounds].size.width

/* ********************** view坐标大小 ********************** */

#define X(view)                    (view).frame.origin.x
#define Y(view)                    (view).frame.origin.y
#define WIDTH(view)                (view).frame.size.width
#define HEIGHT(view)               (view).frame.size.height

#define MinX(view)                 CGRectGetMinX((view).frame)
#define MinY(view)                 CGRectGetMinY((view).frame)

#define MidX(view)                 CGRectGetMidX((view).frame)
#define MidY(view)                 CGRectGetMidY((view).frame)

#define MaxX(view)                 CGRectGetMaxX((view).frame)
#define MaxY(view)                 CGRectGetMaxY((view).frame)

/* ********************** 系统控件默认高度 ********************** */

#define kStatusBarHeight        (20.f)

#define kTopBarHeight           (44.f)

#define kBottomBarHeight        (49.f)

#define kCellDefaultHeight      (44.f)

#define kEnglishKeyboardHeight  (216.f)

#define kChineseKeyboardHeight  (252.f)

/* ********************** 获取PNG/JPG图片的路径 ********************** */

#define PNGPATH(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define JPGPATH(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
#define PATH(NAME, EXT)         [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]

/* ********************** 加载PNG/JPG图片 ********************** */

#define PNGkImg(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define JPGkImg(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define kImg(NAME, EXT)        [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]

/* ********************** 设置字体大小及颜色 ********************** */

//黑体
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]

//普通
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

// RGB颜色转换（16进制->10进制）
#define COLORFROM0X(rgbValue)\
\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

//常用颜色
#define black_color     [UIColor blackColor]
#define blue_color      [UIColor blueColor]
#define brown_color     [UIColor brownColor]
#define clear_color     [UIColor clearColor]
#define darkGray_color  [UIColor darkGrayColor]
#define darkText_color  [UIColor darkTextColor]
#define white_color     [UIColor whiteColor]
#define yellow_color    [UIColor yellowColor]
#define red_color       [UIColor redColor]
#define orange_color    [UIColor orangeColor]
#define purple_color    [UIColor purpleColor]
#define lightText_color [UIColor lightTextColor]
#define lightGray_color [UIColor lightGrayColor]
#define green_color     [UIColor greenColor]
#define gray_color      [UIColor grayColor]
#define magenta_color   [UIColor magentaColor]

/* ********************** 圆角边框 ********************** */
// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

/* ********************** 当前版本/语言 ********************** */

// 当前版本
#define kFloatSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define kDoubleSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define kSystemVersion          ([[UIDevice currentDevice] systemVersion])

// 当前语言
#define kCurrentLanguage        ([[NSLocale preferredLanguages] objectAtIndex:0])


/* ********************** 其他 ********************** */

///SVP
#define SHOW_SVP(title) \
[SVProgressHUD showWithStatus:title];

#define SHOW_ERROE(title) \
[SVProgressHUD showErrorWithStatus:title];

#define SHOW_SUCCESS(title) \
[SVProgressHUD showSuccessWithStatus:title];

#define DISMISS_SVP(time) \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ \
[SVProgressHUD dismiss]; \
});



