//
//  MJDamageAssessmentManager.h
//  MJDamageAssessment
//
//  Created by shiying on 10/04/2017.
//  Copyright © 2017 Data Enlighten. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "MJVehicle.h"


@interface MJDamageAssessmentManager : NSObject

//设置网络超时时间,默认为15s
@property (nonatomic) NSTimeInterval urlRequestTimeOut;

//是否手动管理SDK内部数据，默认为NO
@property (nonatomic , assign) BOOL manualClearSDKsData;


/**
 存放VIN定型后的数据
 */
@property (nonatomic , strong) MJVehicle* vehicle;


/**
  设置planb的车型数据

 @param data planb模式获得的车型数据，字典格式
 */
- (void)setPlanbDataWithData:(NSDictionary*)data;

+ (MJDamageAssessmentManager *_Nonnull)sharedInstance;

/**
 初始化SDK 校验权限是否有效
 
 @param userInfo 用户信息
 @param completed 校验结果
 */
- (void)configureWithUserInfo:(nullable NSDictionary *)userInfo complete:(nullable void(^)(BOOL))completed;



/**
清空SDK内部数据
 */
- (void)clearSDKsData;



@end






