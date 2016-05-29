//
//  asdfa.m
//  NetRadio
//
//  Created by KuaiyuIOS on 14-10-11.
//  Copyright (c) 2014年 KuaiyuD. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)
- (NSMutableArray *)attributeList {
    static NSMutableDictionary *classDictionary = nil;
    if (classDictionary == nil) {
        classDictionary = [[NSMutableDictionary alloc] init];
    }
    
    NSString *className = NSStringFromClass(self.class);
    
    NSMutableArray *propertyList = [classDictionary objectForKey:className];
    
    if (propertyList != nil) {
        return propertyList;
    }
    
    propertyList = [[NSMutableArray alloc] init];
    
    id theClass = object_getClass(self);
    [self getPropertyList:theClass forList:&propertyList];
    
    [classDictionary setObject:propertyList forKey:className];
#if !__has_feature(objc_arc)
    [propertyList release];
#endif
    return propertyList;
}

- (void)getPropertyList:(id)theClass forList:(NSMutableArray **)propertyList {
    id superClass = class_getSuperclass(theClass);
    unsigned int count, i;
    objc_property_t *properties = class_copyPropertyList(theClass, &count);
    for (i=0; i<count; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property)
                                                          encoding:NSUTF8StringEncoding];
        if (propertyName != nil) {
            [*propertyList addObject:propertyName];
#if !__has_feature(objc_arc)
            [propertyName release];
#endif
            propertyName = nil;
        }
    }
    free(properties);
    
    if (superClass != [NSObject class]) {
        [self getPropertyList:superClass forList:propertyList];
    }
}


/*设备相关*/
- (float)deviceSystemVersion {
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    return version;
}

- (NSString *)deviceModel {
    NSString *model = [[UIDevice currentDevice] model];
    model = [model stringByReplacingOccurrencesOfString: @" " withString:@"_"];
    return model;
}

- (NSString *)deviceName {
    NSString *name = [[UIDevice currentDevice] name];
    return name;
}

- (BOOL)deviceIsPad { return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad);}

- (BOOL)deviceIsPhone {return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone);}

- (BOOL)deviceIsTouch {
    return [[self deviceModel] rangeOfString:@"iPod touch"].length > 0;
}

- (BOOL)isIOS7{
    return [UIDevice currentDevice].systemVersion.doubleValue >= 7.0;
}

- (BOOL)isIOS8{
    return [UIDevice currentDevice].systemVersion.doubleValue >= 8.0;
}

- (CGFloat)headViewHeight{return 64.0;}

- (BOOL)deviceIsRetina {
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        if ([[UIScreen mainScreen] scale] == 2) {return YES; }
    }
    return NO;
}

static CGSize targetSize = {750,1334};

- (CGFloat)scaleHeightFactor{
    static CGFloat factor = -1.0;
    if(factor == -1){
        CGSize bounds =  [[UIScreen mainScreen] bounds].size;
        factor = bounds.height / targetSize.height;
    }
    return factor;
}

- (CGFloat)scaleWidthFactor{
    static CGFloat factor = -1.0;
    if(factor == -1){
        CGSize bounds =  [[UIScreen mainScreen] bounds].size;
        factor = bounds.width / targetSize.width;
    }
    return factor;
}

- (BOOL)deviceIsPhone5 {
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)]?CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen] currentMode].size):NO);
}

/*判断是否为iPhone4s*/
- (BOOL)deviceIsPhone4S{
    
    return [[UIDevice currentDevice].deviceModel hasPrefix:@"iPhone4"];
    
}

/*判断是否为iPhone4*/
- (BOOL)deviceIsPhone4{
    return [[UIDevice currentDevice].deviceModel hasPrefix:@"iPhone3"];
    
}

- (BOOL)openSYSURL:(NSURL *)url { return [[UIApplication sharedApplication] openURL:url];}

- (void)sendSYSMail:(NSString *)mail {
    NSString *url = [NSString stringWithFormat:@"mailto://%@", mail];
    [self openSYSURL:[NSURL URLWithString:url]];
}

- (void)sendSYSSMS:(NSString *)number {
    NSString *url = [NSString stringWithFormat:@"sms://%@", number];
    [self openSYSURL:[NSURL URLWithString:url]];
}

- (void)callSYSNumber:(NSString *)number {
    NSString *url = [NSString stringWithFormat:@"tel://%@", number];
    [self openSYSURL:[NSURL URLWithString:url]];
}


- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict{
    id object = [dict objectForKey:aKey];
    if([object isNumber]) object = [object description];
    return [object isEqual:[NSNull null]] ? @"" : object;
}

- (BOOL)isDictionary{ return [[self class] isSubclassOfClass:[NSDictionary class]];}

- (BOOL)isArray{return [[self class] isSubclassOfClass:[NSArray class]];}

- (BOOL)isString{ return [[self class] isSubclassOfClass:[NSString class]];}

- (BOOL)isNumber{return [[self class] isSubclassOfClass:[NSNumber class]];}

- (NSString *)formatString:(time_t)time{
    static int num1 = 60;
    static int num2 = 3600;
    static int num3 = 3600 * 24;
    static int num4 = 3600 * 24 * 30;
    static int num5 = 3600 * 24 * 30 * 12;
    
    NSString *returnString;
    if(time <= 10){returnString = @"刚刚";}
    else if(time < num1){returnString = [NSString stringWithFormat:@"%ld秒前",time];}
    else if(time < num2){returnString = [NSString stringWithFormat:@"%ld分钟前",time / num1];}
    else if(time < num3){returnString = [NSString stringWithFormat:@"%ld小时前",time / num2]; }
    else if(time < num4){ returnString  = [NSString stringWithFormat:@"%ld天前",time / num3];}
    else if(time < num5){returnString = [NSString stringWithFormat:@"%ld月前",time / num4];}
    else{returnString = [NSString stringWithFormat:@"%ld年前",time / num5];}
    return returnString;
}


@end
