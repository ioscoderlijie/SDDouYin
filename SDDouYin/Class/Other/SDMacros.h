//
//  SDMacros.h
//  SDInKe
//
//  Created by slowdony on 2018/1/10.
//  Copyright © 2018年 slowdony. All rights reserved.
//

#ifndef SDMacros_h
#define SDMacros_h

#pragma mark ---------- 尺寸 ---------

///屏幕宽高
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

///判断设备类型是否iPhoneX
#define ISIphoneX    (SCREEN_WIDTH == 375.f && SCREEN_HEIGHT == 812.f ? YES : NO)

///导航栏内容高度(不包括状态栏)
#define kNavContentBarHeight 44.0
///状态栏高度
#define kStatusBarHeight (ISIphoneX ? 44.f : 20.f)
///导航栏高度
#define kNavBarHeight (ISIphoneX ? 88.f : 64.f)
///底部标签栏高度
#define kTabBarHeight (ISIphoneX ? 49.f + 34.f : 49.f)

///屏幕适配
#define kWidth(x) ((x)*(SCREEN_WIDTH)/375.0)
#define kHeight(y) ((y)*(SCREEN_HEIGHT)/667.0)

#define KWeakself __weak typeof(self) weakSelf = self;


#pragma mark ---------- 颜色 ---------
///颜色
#define UIColorFromRGB0X(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBAlpha(rgbValue,alpha) [UIColorFromRGB0X(rgbValue) colorWithAlphaComponent:alpha]

///随机色
#define UIColorFormRandom [UIColor colorWithRed:(arc4random() % 256)/255.0 green:(arc4random() % 256)/255.0 blue:(arc4random() % 256)/255.0 alpha:1]

///导航栏标题颜色
#define KNavigationTitleColor ([UIColor whiteColor])
///导航栏背景颜色
#define KNavigationBarBackgroundColor (UIColorFromRGB0X(0x2B2841))
///主题背景色
#define KMainBackgroundColor (UIColorFromRGB0X(0x242137))
///列表标题
#define KTitleColor (UIColorFromRGB0X(0xFFFFFF))
///子标题
#define KDetailTitleColor (UIColorFromRGB0X(0x979698))

#pragma mark ---------- 字体 ---------
///字体
#define SDFont(size) ([UIFont systemFontOfSize:size])
#define SDBoldFont(size) ([UIFont boldSystemFontOfSize:size])
#define SDFontCustomName(name,fontSize) ([UIFont fontWithName:name  size:fontSize])
///标题
#define KDouYinTitle @"抖音"

/// AppDelegate
#define KAppDelegate ((AppDelegate *)([UIApplication sharedApplication].delegate))

//log扩展
#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif


#ifndef    xWeakify
#if __has_feature(objc_arc)
#define xWeakify autoreleasepool{} __weak __typeof__(self) weakRef = self;
#else
#define xWeakify autoreleasepool{} __block __typeof__(self) blockRef = self;
#endif
#endif

#ifndef     xStrongify
#if __has_feature(objc_arc)
#define xStrongify try{} @finally{} __strong __typeof__(weakRef) self = weakRef;
#else
#define xStrongify try{} @finally{} __typeof__(blockRef) self = blockRef;
#endif
#endif

#endif /* SDMacros_h */
