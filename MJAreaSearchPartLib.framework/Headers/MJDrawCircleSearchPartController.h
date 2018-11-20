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
设置汽车图片的上下偏移量
 carTopOffset   顶部偏移，默认0
 carBottomOffset   底部偏移,默认0，通常设置负值
 */
@property (nonatomic , assign) CGFloat carTopOffset;
@property (nonatomic , assign) CGFloat carBottomOffset;


/**
 三厢四门车体图片
 */
@property (nonatomic , strong) UIImage* sxsmBodyImage;

/**
 三厢四门底盘图片
 */
@property (nonatomic , strong) UIImage* sxsmChassisImage;

/**
 两厢五门车体图片
 */
@property (nonatomic , strong) UIImage* lxwmBodyImage;

/**
 两厢五门底盘图片
 */
@property (nonatomic , strong) UIImage* lxwmChassisImage;

/**
 SUV车体图片
 */
@property (nonatomic , strong) UIImage* suvBodyImage;

/**
 SUV底盘图片
 */
@property (nonatomic , strong) UIImage* suvChassisImage;

/**
 MPV车体图片
 */
@property (nonatomic , strong) UIImage* mpvBodyImage;

/**
 MPV底盘图片
 */
@property (nonatomic , strong) UIImage* mpvChassisImage;

/**
 圈选模式选择
 
 @param mode 圈选模式：MJDrawModeBody  //车身件
                     MJDrawModeChassis  //底盘件
 */
- (void)switchDrawSearchModeWithMode:(MJDrawMode)mode;

@end
