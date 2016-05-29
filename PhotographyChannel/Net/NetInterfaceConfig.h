//
//  NetInterfaceConfig.h
//  HotChat
//
//  Created by HeLin on 16/4/3.
//  Copyright © 2016年  ChangHong-HeLin. All rights reserved.
//

#ifndef NetInterfaceConfig_h
#define NetInterfaceConfig_h

/**
 *  服务器ROOT地址
 */
#pragma mark 服务器ROOT地址
#define ROOT_URL @"http://182.150.6.33:9999"  //服务器根地址
#define DEFAULT_URL_PREFIX @"/remote" //所有接口默认已/remote开头

#pragma mark POST方式
#define REQUEST_USER_LOGIN @"/user/login"  //登陆接口
#define REQUEST_SMS_GET @"/sms/get"  //获取短信随机码
#define REQUEST_TOKEN_UPLOAD @"/token/upload "  //文件上传
#define REQUEST_TOKEN_USER_UPDATE @"/token/user/update" //修改个人资料
#define REQUEST_TOKEN_USER_INFO_BYID @"/token/user/info/byId" //用户基本信息
#define REQUEST_TOKEN_LOVERS_MY @"/token/lovers/my" //我的情侣列表
#define REQUEST_TOKEN_CALL_MY @"/token/call/my" // 我的朋友列表
#define REQUEST_TOKEN_CALL_ASK @"/token/call/ask" // 申请朋友
#define REQUEST_TOKEN_LOVERS_ASK @"/token/lovers/ask" // 申请情人
#define REQUEST_TOKEN_CALL_OK @"/token/call/ok" // 同意申请朋友
#define REQUEST_TOKEN_LOVERS_OK @"/token/lovers/ok" // 同意申请情人
#define REQUEST_TOKEN_CALL_REJECT @"/token/call/reject" // 拒绝朋友申请
#define REQUEST_TOKEN_LOVERS_REJECT @"/token/lovers/reject" // 拒绝情人申请
#define REQUEST_TOKEN_CALL_DELETE @"/token/call/delete" // 删除朋友
#define REQUEST_TOKEN_LOVERS_DELETE @"/token/lovers/delete" // 删除情人
#define REQUEST_TOKEN_USER_LIST @"/token/user/list" //获取用户列表
#define REQUEST_TOKEN_USER_RANDOM @"/token/user/random"//随机获取一个异性ID

#pragma mark GET方式
#define REQUEST_TOKEN_USER_INFO_MY @"/token/user/info/my" //我的基本信息
#define REQUEST_TOKEN_LIKES @"/token/likes" //技能列表

// 上传文件完整路径
#define UploadFileUrl @"http://182.150.6.33:9999/remote/token/upload"
// 下载文件完整路径
#define DownloadFileUrl @"http://182.150.6.33:9999/remote/download/"

#endif /* NetInterfaceConfig_h */
