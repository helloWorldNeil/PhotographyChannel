//
//  Extension.h
//  NetRadio
//
//  Created by KuaiyuIOS on 14-10-11.
//  Copyright (c) 2014年 KuaiyuD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Extension)

- (NSString *)urlEncode;

- (NSString *)md5String;

//- (NSString *)fixUrlString;

- (BOOL )isChinese;

- (BOOL )isCellPhoneNumber;

- (BOOL )isPhoneNumber;

- (BOOL)isEmail;

- (BOOL)isURL;

- (BOOL)isZipCode;
// 身份证
- (BOOL) validateIdentityCard;

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end
