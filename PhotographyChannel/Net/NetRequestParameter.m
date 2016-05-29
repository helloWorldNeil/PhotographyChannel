//
//  NetRequestParam.m
//  WisdomMedical
//
//  Created by  ChangHong-HeLin on 15/9/10.
//  Copyright (c) 2015年 tuotuoyi. All rights reserved.
//

#import "NetRequestParameter.h"
#import "NetInterfaceConfig.h"

@implementation NetRequestParameter
+(NetRequestParameter *)parameter{
    NetRequestParameter *parameter = [[self alloc]init];
    parameter.methodName = @"Post";
    return parameter;
}

-(void)setRequestURL:(NSString *)requestURL{
    NSString *url =[NSString stringWithFormat:@"%@%@%@",ROOT_URL,DEFAULT_URL_PREFIX,requestURL];
    _requestURL = url;
}

@end

@implementation HLFormData

@end
