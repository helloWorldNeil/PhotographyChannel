//
//  Extension.m
//  NetRadio
//
//  Created by KuaiyuIOS on 14-10-11.
//  Copyright (c) 2014年 KuaiyuD. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>
//#import "NetInterfaceConfig.h"


@implementation NSString(Extension)

- (NSString *)urlEncode{
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                                    NULL,
                                                                                                    (CFStringRef)self,
                                                                                                    NULL,
                                                                                                    (CFStringRef)@"!*';:@&=+$,/?%#[]",// ()  暂时去除
                                                                                                    kCFStringEncodingUTF8 ));
    return encodedString;
}

- (NSString *)md5String{
    if (!self) {
        return nil;
    }
    const char* original_str=[self UTF8String];
    unsigned char digist[CC_MD5_DIGEST_LENGTH]; //CC_MD5_DIGEST_LENGTH = 16
    CC_MD5(original_str, (UInt32)strlen(original_str), digist);
    NSMutableString* outPutStr = [NSMutableString stringWithCapacity:10];
    for(int  i =0; i<CC_MD5_DIGEST_LENGTH;i++){
        [outPutStr appendFormat:@"%02x", digist[i]];//小写x表示输出的是小写MD5，大写X表示输出的是大写MD5
    }
    return [outPutStr lowercaseString];
}

//- (NSString *)fixUrlString{
//    if(![self hasPrefix:@"http://"]){return [NSString stringWithFormat:@"%@%@",KIMG_SEVER_ADDRESS,self];}
//    return self;
//}

- (BOOL)isEmail {
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isURL {
    static NSString *urlRegEx = @"((https?|ftp|gopher|telnet|file|notes|ms-help):((//)|(\\\\))+[\\w\\d:#@%/;$()~_?\\+-=\\\\.&]*)";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:self];
}

- (BOOL)isChinese
{
    NSString *chineseRegEx = @"[^x00-xff]";
    NSPredicate *chineseTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", chineseRegEx];
    return [chineseTest evaluateWithObject:self];
}

- (BOOL)isZipCode {
    NSString *zipCodeRegEx = @"[1-9]\\d{5}$";
    NSPredicate *zipCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", zipCodeRegEx];
    return [zipCodeTest evaluateWithObject:self];
}

- (BOOL)isCellPhoneNumber {
    NSString *cellPhoneRegEx = @"^1(3[0-9]|4[0-9]|5[0-9]|8[0-9])\\d{8}$";
    NSPredicate *cellPhoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", cellPhoneRegEx];
    return [cellPhoneTest evaluateWithObject:self];
}

- (BOOL)isPhoneNumber {
    NSString *phoneRegEx= @"((^0(10|2[0-9]|\\d{2,3})){0,1}-{0,1}(\\d{6,8}|\\d{6,8})$)";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegEx];
    return [phoneTest evaluateWithObject:self];
}

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


- (BOOL) validateIdentityCard
{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

@end
