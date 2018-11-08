//
//  MJDrawCircleSearchPartController.h
//  MJDamageAssessmentDemo
//
//  Created by shiying on 13/04/2017.
//  Copyright © 2017 Data Enlighten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJDataLib/MJPart.h>

typedef NS_ENUM(NSInteger, MJDrawMode) {
    MJDrawModeBody, //车身件
    MJDrawModeChassis  //底盘件
};

@protocol MJCanvasCircleSelectedPartProtocol <NSObject>

@optional


/**
 圈选结果代理

 @param parts 圈选得到的配件结果 值为nil时代表推荐失败或者没有配件
 */
- (void)canvasCircleSelectedPartsCompletion:(NSArray<MJPart *> *)parts;

/**
 圈选之后开始请求
 */
- (void)canvasCircleRequestStart;

/**
 圈选请求结束
 */
- (void)canvasCircleRequestEnd;

@end

@interface MJDrawCircleSearchPartController : UIViewController

@property (nonatomic,weak) id<MJCanvasCircleSelectedPartProtocol>delegate;


/**
 圈选模式选择
 
 @param mode 圈选模式：MJDrawModeBody  //车身件
                     MJDrawModeChassis  //底盘件
 */
- (void)switchDrawSearchModeWithMode:(MJDrawMode)mode;

@end
