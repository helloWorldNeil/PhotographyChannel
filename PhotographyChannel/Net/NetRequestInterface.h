//
//  HCNetRequestInterface.h
//  HotChat
//
//  Created by 欣睿 on 16/3/14.
//  Copyright © 2016年 iething. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  网络请求成功代码块
 *
 *  @param result 返回成功的数据，目前是字典类型
 */
typedef void(^SuccessBlock)(NSURLSessionDataTask * task, id responseObject);

/**
 *  网络请求失败代码块
 *
 *  @param error 返回失败的错误信息
 */
typedef void(^FailureBlock)(NSURLSessionDataTask * task, NSError * error);

/**
 *  请求网络数据进度
 *
 *  @param progress 返回进度NSProgress
 */
typedef void(^ProgressBlock)(NSProgress * downloadProgress);

@class NetRequestParameter;
@interface NetRequestInterface : NSObject
/**
 *  请求参数配置，包含请求url，请求参数，请求方式
 *
 *  @param parameter 参数（NetRequestParameter类封装）
 *  @param progress  进度
 *  @param success   返回成功代码块
 *  @param failure   返回失败代码块
 */
+(void)requestServerWithConfigure:(NetRequestParameter *)parameter progress:(ProgressBlock) progress success:(SuccessBlock) success failure:(FailureBlock) failure;


/**
 *  post请求
 *
 *  @param paramDict 参数（以字典格式包装）
 *  @param progress  进度
 *  @param success   返回成功代码块
 *  @param failure   返回失败代码块
 */
+(void) requestServerWithPOST:(NSDictionary *)paramDict progress:(ProgressBlock) progress success:(SuccessBlock) success failure:(FailureBlock) failure;

/**
 *  get请求
 *
 *  @param paramDict 参数（以字典格式包装）
 *  @param progress  进度
 *  @param success   返回成功代码块
 *  @param failure   返回失败代码块
 */
+(void) requestServerWithGet:(NSDictionary *)paramDict progress:(ProgressBlock) progress success:(SuccessBlock) success failure:(FailureBlock) failure;

/**
 *  上传文件（图片）
 *
 *  @param imageData 图片数据
 *  @param paramDict 参数
 *  @param progress  进度
 *  @param success   返回成功代码块
 *  @param failure   返回失败代码块
 */
+(void) uploadImageToServer:(NSData *)imageData parameter:(NSDictionary *)paramDict progress:(ProgressBlock)progress success:(SuccessBlock) success failure:(FailureBlock) failure;


/**
 *  上传文件（音频）
 *
 *  @param audioData 音频数据
 *  @param paramDict 参数
 *  @param progress  进度
 *  @param success   返回成功代码块
 *  @param failure   返回失败代码块
 */
+(void) uploadAudioToServer:(NSData *)audioData parameter:(NSDictionary *)paramDict progress:(ProgressBlock)progress success:(SuccessBlock) success failure:(FailureBlock) failure;

/**
 *  下载文件
 *
 *  @param paramDict 参数
 *  @param progress  进度
 *  @param success   返回成功代码块
 *  @param failure   返回失败代码块
 */
+(void) downLoadFileFromServer:(NSString *)fileId progress:(ProgressBlock)progress success:(SuccessBlock) success failure:(FailureBlock) failure;

@end
