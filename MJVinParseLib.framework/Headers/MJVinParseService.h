//
//  MJVinParseService.h
//  MJVinParseLib
//
//  Created by 袁兴杨 on 2018/3/20.
//  Copyright © 2018年 袁兴杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJDataLib/MJDataLib.h>

@interface MJVinParseService : NSObject

/**
 VIN定型

 @param vinCode VIN码
 @param completion 返回数据
 */
+ (void)vinParseWithVinCode:(nonnull NSString *)vinCode completion:(_Nullable ServiceResponseBlock)completion;

/**
 检查VIN前三位

 @param vintop3 前三位VIN码
 @param completion 返回数据
 */
+ (void)checkVINTop3:(nonnull NSString*)vintop3 completion:(_Nullable ServiceResponseBlock)completion;

/**
获得可查询品牌

 @param completion 返回数据
 */
+ (void)getMyAuthBrandsCompletion:(_Nullable ServiceResponseBlock)completion;

/**
  获得PlanB数据

 @param brand 品牌
 @param completion 返回数据
 */
+ (void)getPlanBBrandsWithBrand:(nonnull NSString*)brand completion:(_Nullable ServiceResponseBlock)completion;


/**
  根据车辆品牌，制造商以及车型获取车辆的排量以及变速箱等信息

 @param brand 车辆品牌   -从+ (void)getPlanBBrandsWithBrand:(nonnull NSString*)brand completion:(_Nullable ServiceResponseBlock)completion;接口中获取到的数据
 @param maker 制造商    -从+ (void)getPlanBBrandsWithBrand:(nonnull NSString*)brand completion:(_Nullable ServiceResponseBlock)completion;接口中获取到的数据
 @param vehicleChn 车型  -从+ (void)getPlanBBrandsWithBrand:(nonnull NSString*)brand completion:(_Nullable ServiceResponseBlock)completion;接口中获取到的数据
 @param body 车体 -从+ (void)getPlanBBrandsWithBrand:(nonnull NSString*)brand completion:(_Nullable ServiceResponseBlock)completion;接口中获取到的数据
 @param completion  返回数据
 */
+ (void)getPlanBBrandDetailWithBrand:(nonnull NSString*)brand maker:(nonnull NSString*)maker vehicleChn:(nonnull NSString*)vehicleChn  body:(nonnull NSString*)body completion:(ServiceResponseBlock)completion;


/**
 ocr服务 识别行驶证

 @param image 行驶证图片
 @param completion 返回数据
 */
+ (void)ocrServiceWithImage:(nonnull UIImage*)image completion:(_Nullable ServiceResponseBlock)completion;

@end
