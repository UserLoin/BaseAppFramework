//
//  AppMacros.h
//  DuanSheLi
//
//  Created by 咖达 on 17/3/13.
//  Copyright © 2017年 咖达. All rights reserved.
//

#ifndef AppMacros_h
#define AppMacros_h

//1. 颜色
#define SPRGBColorA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]//RGBA
#define SPRGBColor(r, g, b) SPRGBColorA((r), (g), (b), 255)//RGB
#define SPRandomColor SPRGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))//随机色
#define SPColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]// rgb颜色转换（16进制->10进制）
#define SPWhiteColor [UIColor whiteColor]
#define SPBlackColor [UIColor blackColor]
#define SPDarkGrayColor [UIColor darkGrayColor]
#define SPLightGrayColor [UIColor lightGrayColor]
#define SPGrayColor [UIColor grayColor]
#define SPRedColor [UIColor redColor]
#define SPGreenColor [UIColor greenColor]
#define SPBlueColor [UIColor blueColor]
#define SPCyanColor [UIColor cyanColor]
#define SPYellowColor [UIColor yellowColor]
#define SPMagentaColor [UIColor magentaColor]
#define SPOrangeColor [UIColor orangeColor]
#define SPPurpleColor [UIColor purpleColor]
#define SPBrownColor [UIColor brownColor]
#define SPClearColor [UIColor clearColor]


//2. 打印
#ifdef DEBUG
#define SPLog(...) NSLog(@"\n打印结果:\n %s    第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define SPLog(...)
#endif

#define SPLogFunc  NSLog(@"方法名:\n %s", __func__);//只打印函数名称


//3. 单利
//单例化一个类
#if __has_feature(objc_arc)//ARC

#define SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(classname) \
\
+ (classname *)shared##classname;

#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
static dispatch_once_t pred; \
dispatch_once(&pred, ^{ shared##classname = [[classname alloc] init]; }); \
return shared##classname; \
}

#else//MRC

#define SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(classname) \
\
+ (classname *)shared##classname;

#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
static dispatch_once_t pred; \
dispatch_once(&pred, ^{ shared##classname = [[classname alloc] init]; }); \
return shared##classname; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
} \
\
- (id)retain \
{ \
return self; \
} \
\
- (NSUInteger)retainCount \
{ \
return NSUIntegerMax; \
} \
\
- (oneway void)release \
{ \
} \
\
- (id)autorelease \
{ \
return self; \
}

#endif


//4.字体
#define SPFont(float) [UIFont systemFontOfSize:float]
#define SPBoldFont(float) [UIFont boldSystemFontOfSize:float]
#define SPCommonFont SPFont(13)


//5.尺寸
#define SPStatusBar_Height 20
#define SPNavigationBar_Height 44
#define SPHeight_64  64
#define SPTabBar_Height 49
#define SPScreen_Width ([UIScreen mainScreen].bounds.size.width)
#define SPScreen_Height ([UIScreen mainScreen].bounds.size.height)
#define SPScreen_Bounds [UIScreen mainScreen].bounds
#define SPShowView_Height Screen_Height - Height_64 - TabBar_Height

// 适配
// 现在产品设计稿有以iPhone6为基准的
#define SPScreenWidthRatio  (SPScreen_Width / 375.0)
#define SPScreenHeightRatio (SPScreen_Height / 667.0)
#define SPAdapted_Width(x)  (ceilf((x) * SPScreenWidthRatio))
#define SPAdapted_Height(x)  (ceilf((x) * SPScreenHeightRatio))
#define SPWidth  SPAdapted_Width(8)
#define SPHeight SPAdapted_Height(8)
// 字体大小适应
#define SPSystemFont  @"Heiti SC"
#define SPSystemFontWithSize(R)  [UIFont fontWithName: kULSystemFont size: (Adapted_Width(R))]
/*
 round：如果参数是小数，则求本身的四舍五入。
 ceil：如果参数是小数，则求最小的整数但不小于本身.
 floor：如果参数是小数，则求最大的整数但不大于本身.
 */



//6.
// 获取图片资源（本地）
#define SPGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

// 一些常用缩写
#define SPNotificationCenter   [NSNotificationCenter defaultCenter]
#define SPApplication          [UIApplication sharedApplication]
#define SPKeyWindow            [UIApplication sharedApplication].keyWindow
#define SPAppDelegate          [UIApplication sharedApplication].delegate
#define SPUserDefaults         [NSUserDefaults standardUserDefaults]
#define SPNotificationCenter   [NSNotificationCenter defaultCenter]


//7. 弱引用/强引用
#define SPWeakSelf(type)  __weak typeof(type) weak##type = type;
#define SPStrongSelf(type)  __strong typeof(type) type = weak##type;


//8. 圆角、边框
#define SPViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


//9. 提示框
//AlertView
#define  SPAVShow(Message)   [[[UIAlertView alloc]initWithTitle:@"提示" message:Message delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show]

//UIAlertController的宏定义
//参数中的 MESSAGE是提示内容,  SPVC是UIViewController就是你当前操作的页面,调用时直接传递 self
#define SPACShow(Message,SPVC) \
UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:Message preferredStyle:UIAlertControllerStyleAlert]; \
UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]; \
[alertController addAction:okAction]; \
[SPVC presentViewController:alertController animated:YES completion:nil];



//10. 判断字符串、数组、字典、对象为空
//字符串是否为空
#define SPStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define SPArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define SPDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define SPObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))



//11. 获取一些路径
//获取沙盒Document路径
#define SPDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒temp路径
#define SPTempPath NSTemporaryDirectory()
//获取沙盒Cache路径
#define SPCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
//Library/Caches 文件路径
#define SPFilePath ([[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil])
#endif /* AppMacros_h */



//12. 用户相关信息
//用户信息对象
#define UserInfoManager [SPUserInfoManager sharedManager]
//用户信息Model
#define UserInfoModel [[SPUserInfoManager sharedManager] currentUserInfo]
//获取分享对象
#define ShareManager [SPShareManager sharedManager]
//获取文件管理对象
#define FileCacheManager [SPFileCacheManager sharedManager]
