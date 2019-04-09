    //
//  MJSearchEPCPartService.h
//  MJSearchEPCPartLib
//
//  Created by Tan on 2018/5/29.
//  Copyright © 2018年 tanjiankang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJDataLib/MJDataLib.h>

@interface MJSearchEPCPartService : NSObject




/**
 根据OE号 EPC图片名和图片路径查询相邻配件

 @param imageName EPC图片名      eg:part[@"imageName"]
 @param imagePath EPC图片路径    eg:part[@"image_address_suffix"]
 @param oeNumber OE号           eg:part[@"OENumber"]
 @param completion 返回参数
 */
+ (void)searchRelatedPartsWithImageName:(nonnull NSString *)imageName
                              imagepath:(nonnull NSString *)imagePath
                               oeNumber:(nonnull NSString *)oeNumber
                             completion:(_Nullable ServiceResponseBlock)completion;



/**
 根据MJPart查询相邻配件
 @param part 配件
 @param completion 返回参数
 */
+ (void)searchRelatedPartsWithPart:(nonnull MJPart *)part
                             completion:(_Nullable ServiceResponseBlock)completion;

@end
