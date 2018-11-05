//
//  MJNetworkInterface.h
//  MJDamageAssessmentDemo
//
//  Created by shiying on 17/04/2017.
//  Copyright © 2017 Data Enlighten. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "MJNetworkInterface.h"

/**
 *
 *  @brief 服务器响应回调
 *
 *  @param response 返回的结果数据
 *  @param success  是否成功返回数据
 *  @param error    未成功返回时的出错信息
 */
typedef void(^ServiceResponseBlock)(id _Nullable response,BOOL success,NSError *_Nullable error);


/**
 和server交互
 */
@interface MJNetworkInterface : NSObject




/**
 *  警告：私有方法  请勿使用
 *  @param method          HTTP方法,GET、POST、PUT、DELETE等
 *  @param urlString       接口地址
 *  @param parameters      请求参数
 *  @param completion      数据回调
 
 错误码
 //1001    VIN不合法
 //1002    VIN不支持
 //1003    非乘用车
 //1004    VIN错误
 //1005    VIN无法解析
 //1006    您无权查看该品牌数据，请确认！
 //1011     请求VIN的配件数据不存在！
 //1012    该车无此配件
 //1013    请求图片不存在，请确认！
 //1091    后台API程序异常
 //1092    获取视图定义失败
 //9001    系统错误
 //9002     token已过期
 //9003    参数不合法
 
 */

+(void)sendRequestToServerWithMethod:(NSString * _Nullable)method
                                    url:(NSString * _Nullable)urlString
                         transactionKey:(NSString * _Nullable)transactionKey
                             parameters:(id _Nullable)parameters
                        verification:(nonnull NSString*)verification
                             completion:(_Nullable ServiceResponseBlock)completion;


@end
