//
//  MJSearchPartService.h
//  MJSearchPartLib
//
//  Created by 袁兴杨 on 2018/4/12.
//  Copyright © 2018年 袁兴杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJDataLib/MJDataLib.h>

typedef NS_ENUM(NSInteger, MJSearchQurey) {
    MJSearchQureyFuzzy , //首字母联想
    MJSearchQureyManuel , //手动输入
    MJSearchQureyVoice  // 语音输入
};


@interface MJSearchPartService : NSObject


/**
 首字母联想

 @param text 需要联想的字符串（可以是英文可以是中文）
 @param completion 返回的结果是配件名列表
 */
+ (void)firstLetterRecommendWithText:(nonnull NSString*)text completion:(_Nullable ServiceResponseBlock)completion;


/**
 搜索配件

 @param key 需要搜索的关键字：可以是配件名也可以是OE号，可以是多个配件名加上工项（更换，维修，喷漆，钣金，拆装。。。）
 @param query 搜索渠道（语音，手动输入，首字母）
 @param completion 搜索到的配件列表
 */
+ (void)searchPartWithKey:(nonnull NSString*)key query:(MJSearchQurey)query completion:(_Nullable ServiceResponseBlock)completion;



/**
 通过OE反查配件

 @param oeNumber oe号
 @param completion 搜索配件列表
 */
+ (void)searchPartWithOeNumber:(nonnull NSString*)oeNumber completion:(_Nullable ServiceResponseBlock)completion;



/**
 二次推荐配件

 @param completion 二次搜索到的配件列表
 */
+ (void)researchPartCompletion:(_Nullable ServiceResponseBlock)completion;

/**
 获取配件图片

 @param imageName 图片名
 @param completion 获取图片完
 */
+ (void)requestImageWithImageName:(nonnull NSString *)imageName
                      completion:(_Nullable ServiceResponseBlock)completion;

/**
  获取EPC图片

 @param imageName 图片名
 @param imagepath 图片路径
 @param completion 获取图片完成
 */
+ (void)requestImageWithImageName:(nonnull NSString *)imageName
                        imagepath:(nonnull NSString *)imagepath
                       completion:(_Nullable ServiceResponseBlock)completion;

@end
