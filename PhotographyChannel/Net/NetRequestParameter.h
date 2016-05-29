//
//  NetRequestParam.h
//  WisdomMedical
//
//  Created by  ChangHong-HeLin on 15/9/10.
//  Copyright (c) 2015年 tuotuoyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetRequestParameter : NSObject
/**
 *  请求路径
 */
@property (nonatomic, copy)NSString *requestURL;  //请求路径
/**
 *  请求方式
 */
@property (nonatomic, copy)NSString *methodName;  //请求方式
/**
 *  请求参数
 */
@property (nonatomic, retain)NSDictionary *requestParam; //请求参数
/**
 *  请求的头里面是否含有token
 */
@property (nonatomic, assign)BOOL isNeedToken; //请求的头里面是否含有token
/**
 *  将文件、图片转换成NSdata类型的数据，存储在数组中,（用户文件存储）
 */
@property (nonatomic, strong)NSArray *formDatas;//将文件、图片转换成NSdata类型的数据，存储在数组中,（用户文件存储）

+(NetRequestParameter *)parameter;

@end


@interface HLFormData : NSObject
/**
 *  文件数据
 */
@property (nonatomic, strong) NSData *data;

/**
 *  参数名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  文件名
 */
@property (nonatomic, copy) NSString *filename;

/**
 *  文件类型
 */
@property (nonatomic, copy) NSString *mimeType;
@end