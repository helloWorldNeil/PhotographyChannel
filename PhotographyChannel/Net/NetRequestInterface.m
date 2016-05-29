//
//  HCNetRequestInterface.m
//  HotChat
//
//  Created by 欣睿 on 16/3/14.
//  Copyright © 2016年 iething. All rights reserved.
//

#import "NetRequestInterface.h"
#import "NetInterfaceConfig.h"
#import <AFNetworking/AFNetworking.h>
#import "NetRequestParameter.h"
//#import "YHAccount.h"

@implementation NetRequestInterface

/**
 *  初始化网络请求
 *
 *  @return 返回 AFHTTPSessionManager 对象
 */
+(AFHTTPSessionManager *) installAFHTTPSessionManager {
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] init];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    return sessionManager;
}

/**
 *  请求参数配置，包含请求url，请求参数，请求方式
 *
 *  @param parameter 参数（NetRequestParameter类封装）
 *  @param progress  进度
 *  @param success   返回成功代码块
 *  @param failure   返回失败代码块
 */
+(void)requestServerWithConfigure:(NetRequestParameter *)parameter progress:(ProgressBlock) progress success:(SuccessBlock) success failure:(FailureBlock) failure{
    
    if ([parameter.methodName isEqualToString:@"Post"]) {
        [NetRequestInterface postRequestServerWithParameter:parameter progress:^(NSProgress *downloadProgress) {
            if(progress){
                progress(downloadProgress);
            }
        } success:^(NSURLSessionDataTask *task, id responseObject) {
            if(success){
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if(failure){
                failure(task,error);
            }
        }];
    }else if([parameter.methodName isEqualToString:@"Get"]){
        [NetRequestInterface getRequestServerWithParameter:parameter progress:^(NSProgress *downloadProgress) {
            if(progress){
                progress(downloadProgress);
            }
        } success:^(NSURLSessionDataTask *task, id responseObject) {
            if(success){
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if(failure){
                failure(task,error);
            }
        }];
    }
}

+(void)postRequestServerWithParameter:(NetRequestParameter *)parameter progress:(ProgressBlock) postProgress success:(SuccessBlock) postSuccess failure:(FailureBlock) postFailure{
    AFHTTPSessionManager *sessionManager = [NetRequestInterface installAFHTTPSessionManager];
    if (parameter.isNeedToken) {
//        NSString *token = [YHAccount shareAccount].userToken;
//        [sessionManager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    }
    
    if (parameter.formDatas!=nil && parameter.formDatas.count>=1) {
      
        [sessionManager POST:parameter.requestURL parameters:parameter.requestParam constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            for (HLFormData *data in parameter.formDatas) {
                [formData appendPartWithFileData:data.data name:data.name fileName:data.filename mimeType:data.mimeType];
            }

        } success:^(NSURLSessionDataTask *task, id responseObject) {
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
        
        
        
        
//        [sessionManager POST:parameter.requestURL parameters:parameter.requestParam constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//            for (HLFormData *data in parameter.formDatas) {
//                [formData appendPartWithFileData:data.data name:data.name fileName:data.filename mimeType:data.mimeType];
//            }
//        } progress:^(NSProgress * _Nonnull uploadProgress) {
//            if (postProgress) {
//                postProgress(uploadProgress);
//            }
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            if (postSuccess) {
//                NSDictionary *responseDict = (NSDictionary *)responseObject;
//                postSuccess(task,responseDict);
//            }
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            if (postFailure) {
//                postFailure(task,error);
//            }
//        }];
    }else{
        [sessionManager POST:parameter.requestURL parameters:parameter.requestParam progress:^(NSProgress * _Nonnull uploadProgress) {
            if (postProgress) {
                postProgress(uploadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (postSuccess) {
                NSDictionary *responseDict = (NSDictionary *)responseObject;
                postSuccess(task,responseDict);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (postFailure) {
                postFailure(task,error);
            }
        }];
    }
}

+(void)getRequestServerWithParameter:(NetRequestParameter *)parameter progress:(ProgressBlock) postProgress success:(SuccessBlock) postSuccess failure:(FailureBlock) postFailure{
    AFHTTPSessionManager *sessionManager = [NetRequestInterface installAFHTTPSessionManager];
    if (parameter.isNeedToken) {
        NSString *token = [YHAccount shareAccount].userToken;
        [sessionManager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    }
    
    [sessionManager GET:parameter.requestURL parameters:parameter.requestParam progress:^(NSProgress * _Nonnull downloadProgress) {
        if (postProgress) {
            postProgress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (postSuccess) {
            NSDictionary *responseDict = (NSDictionary *)responseObject;
            postSuccess(task,responseDict);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (postFailure) {
            postFailure(task,error);
        }
    }];
}

+(void) requestServerWithPOST:(NSDictionary *)paramDict progress:(ProgressBlock) progress success:(SuccessBlock) success failure:(FailureBlock) failure {
    
    [[self installAFHTTPSessionManager] POST:ROOT_URL parameters:paramDict progress:^(NSProgress * uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
        
    } success:^(NSURLSessionDataTask *  task, id responseObject) {
        if (success) {
            NSDictionary *resultDict = (NSDictionary *)responseObject;
            success(task,resultDict);
        }
        
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        if (failure) {
            failure(task,error);
        }
    }];
    
}

+(void) requestServerWithGet:(NSDictionary *)paramDict progress:(ProgressBlock) progress success:(SuccessBlock) success failure:(FailureBlock) failure {
    
    [[self installAFHTTPSessionManager] GET:ROOT_URL parameters:paramDict progress:^(NSProgress * downloadProgress) {
        progress(downloadProgress);
    } success:^(NSURLSessionDataTask * task, id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        success(task,resultDict);
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        failure(task,error);
    }];
}
//解析错误类型
+(NSError *)parseErrorType:(NSError *)error{
    NSDictionary *errorTypeDictionary = @{@"E00001":@"请求地址不存在",
                                     @"E00002":@"服务器错误",
                                     @"E00003":@"参数错误",
                                     @"E00004":@"请求超时",
                                     @"E00005":@"验证码错误",
                                     @"E00006":@"验证码已发送",
                                     @"E00007":@"令牌无效或已过期",
                                     @"E00008":@"不存在",
                                     @"E00009":@"账户或密码错误",
                                     };
    NSString *codeString = [NSString stringWithFormat:@"%ld",(long)error.code];
    NSString *domain = errorTypeDictionary[codeString]==nil?@"未知错误":errorTypeDictionary[codeString];
    NSError *parseError = [[NSError alloc]initWithDomain:domain code:error.code userInfo:error.userInfo];
    return parseError;
}

+(void) uploadImageToServer:(NSData *)imageData parameter:(NSDictionary *)paramDict progress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    AFHTTPSessionManager *sessionManager = [self installAFHTTPSessionManager];
    NSString *token = [YHAccount shareAccount].userToken;
    [sessionManager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    
    [sessionManager POST:UploadFileUrl parameters:paramDict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:imageData name:@"file" fileName:@"image.png" mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * task, id responseObject) {
        if (success) {
            NSDictionary *resultDict = (NSDictionary *)responseObject;
            success(task,resultDict);
        }
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        if (failure) {
            failure(task,error);
        }
    }];
}


+(void) uploadAudioToServer:(NSData *)audioData parameter:(NSDictionary *)paramDict progress:(ProgressBlock)progress success:(SuccessBlock) success failure:(FailureBlock) failure {
    
    AFHTTPSessionManager *sessionManager = [self installAFHTTPSessionManager];
    NSString *token = [YHAccount shareAccount].userToken;
    [sessionManager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    
    [sessionManager POST:UploadFileUrl parameters:paramDict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:audioData name:@"file" fileName:@"audio.mp3" mimeType:@"audio/mpeg"];
        
    } progress:^(NSProgress * uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * task, id responseObject) {
        if (success) {
            NSDictionary *resultDict = (NSDictionary *)responseObject;
            success(task,resultDict);
        }
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        if (failure) {
            failure(task,error);
        }
    }];
}


+(void) downLoadFileFromServer:(NSString *)fileId progress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    AFHTTPSessionManager *sessionManager = [self installAFHTTPSessionManager];
    NSString *token = [YHAccount shareAccount].userToken;
    [sessionManager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    
    [sessionManager GET:[NSString stringWithFormat:@"%@%@",DownloadFileUrl,fileId] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
    
}


@end
