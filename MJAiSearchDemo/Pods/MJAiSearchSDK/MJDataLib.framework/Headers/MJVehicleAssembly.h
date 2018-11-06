//
//  VehicleAssembly.h
//  AnItemForACar
//
//  Created by shiying on 6/22/16.
//  Copyright © 2016 shiying. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @author shiying, 16-06-22 21:06:55
 *
 *  @brief 车型配置
 */
@interface MJVehicleAssembly : NSObject

@property (nonatomic,copy)      NSString *transMission;                          //"CVT"
@property (nonatomic,copy)      NSString *motor;                                 //"2.4"
@property (nonatomic,copy)      NSString *produceYear;                           //"2015"
@property (nonatomic,copy)      NSString *optionCode;                          //4402
@property (nonatomic,copy)      NSString *optionInfo;                            //"导航系统|天窗|左驾"
@property (nonatomic,strong)    NSArray  *standardPartNames;                    //配件列表
@property (nonatomic,copy)      NSString *carSerial;                //天籁
@property (nonatomic,copy)      NSString *vehicleId;   //制造商
@property (nonatomic,copy)      NSString *carType;                  //小车、中车、大车
@property (nonatomic,copy)      NSString *body;                     //三厢4门、二厢5门、SUV、MPV
@property (nonatomic,copy)      NSString *minPrice;                 //最低价
@property (nonatomic,copy)      NSString *maxPrice;                 //最高价
@property (nonatomic,copy)      NSString *carCountry;               //国别
@property (nonatomic,copy)      NSString *gyroBrand;               //陀螺仪品牌
@property (nonatomic,copy)      NSString *modelName;
@property (nonatomic,copy)      NSString *modelNameEng;
@property (nonatomic,copy)      NSString *brandClass;
@property (nonatomic,copy)      NSString *maker;   //制造商

@end
