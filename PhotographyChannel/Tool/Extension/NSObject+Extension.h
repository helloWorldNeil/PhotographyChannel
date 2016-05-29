//
//  asdfa.h
//  NetRadio
//
//  Created by KuaiyuIOS on 14-10-11.
//  Copyright (c) 2014年 KuaiyuD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject (Extension)

- (NSMutableArray *)attributeList;

/*设备相关*/
/*当前设备的系统版本号*/
- (float)deviceSystemVersion;

/*当前设备模型*/
- (NSString *)deviceModel;

/*当前设备名称*/
- (NSString *)deviceName;

/*当前设备是否为iPad*/
- (BOOL)deviceIsPad;

/*当前设备是否为iPhone*/
- (BOOL)deviceIsPhone;

/*当前设备是否为iPod touch*/
- (BOOL)deviceIsTouch;

- (BOOL)isIOS7;

- (BOOL)isIOS8;

- (CGFloat)headViewHeight;

- (CGFloat)scaleHeightFactor;

- (CGFloat)scaleWidthFactor;

/*当前设备是否为视网膜屏*/
- (BOOL)deviceIsRetina;

/*判断是否为iPhone5*/
- (BOOL)deviceIsPhone5;

/*判断是否为iPhone4s*/
- (BOOL)deviceIsPhone4S;

/*判断是否为iPhone4*/
- (BOOL)deviceIsPhone4;

- (BOOL)openSYSURL:(NSURL *)url;

- (void)sendSYSMail:(NSString *)mail;

- (void)sendSYSSMS:(NSString *)number;

- (void)callSYSNumber:(NSString *)number;


//  从字典中得到值
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

- (BOOL)isDictionary;

- (BOOL)isArray;

- (BOOL)isString;

- (BOOL)isNumber;

- (NSString *)formatString:(time_t)time;

@end
