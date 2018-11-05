//
//  MJVehicle.h
//  MJDamageAssessmentDemo
//
//  Created by shiying on 11/04/2017.
//  Copyright © 2017 Data Enlighten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJVehicleAssembly.h"
/**
 汽车
 */
@interface MJVehicle : NSObject

@property (nonatomic,copy) NSString *VIN;       //VIN码
@property (nonatomic,copy) NSString *BrandGyro; //陀螺仪品牌
@property (nonatomic,copy) NSString *Brand;     //品牌
@property (nonatomic,copy) NSString *BrandCode; //品牌ID
@property (nonatomic,copy) NSString *Maker;     //制造商
@property (nonatomic,copy) NSString *PlateID;   //车牌号
@property (nonatomic,copy) NSString *modelName;
@property (nonatomic,copy) NSString *brandClass;   

@property (nonatomic,strong) NSMutableArray<MJVehicleAssembly *> *optionAssembles;  //配置

@property (nonatomic,strong) MJVehicleAssembly *assemble;  //选中的车型配置

@property (nonatomic,assign)    BOOL vinSupported; //当前VIN,是否是系统支持的VIN

- (instancetype)updateAttributes:(NSDictionary *)attributes;

@end
