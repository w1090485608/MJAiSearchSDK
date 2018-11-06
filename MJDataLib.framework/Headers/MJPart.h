//
//  MJPresetAreaPart.h
//  MJDamageAssessmentDemo
//
//  Created by shiying on 16/04/2017.
//  Copyright © 2017 Data Enlighten. All rights reserved.
//

#import "MJOemNumber.h"



@interface MJPart : NSObject<NSCopying>

@property (nonatomic,copy) NSString *presetAreaID;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *priority;
@property (nonatomic,copy) NSString *threeCoordinate;

@property (nonatomic,strong) MJOemNumber *partNumber;       //OE号
@property (nonatomic,copy) NSString *substitute;            //替代号
@property (nonatomic,copy) NSString *substitutePrice;       //替代件价格
@property (nonatomic,copy) NSString *partPrice;             //配件价格
@property (nonatomic,copy) NSString *image_address_suffix;  //图片地址后缀
@property (nonatomic,copy) NSString *imageName;             //图片名称
@property (nonatomic,copy) NSString *thumbnailImage;        //配件缩略图

@property (nonatomic , strong) NSMutableArray* moreOEParts; //存放多OE配件


@property (nonatomic,copy) NSString *epc_image_address_suffix;             //图片名称
@property (nonatomic,copy) NSString *epc_imageName;             //图片名称

//@property (nonatomic,copy) NSString *preview_image_base64; //图片base64数据
@property (nonatomic,copy) NSString *imageIndex;            //配件在EPC图上的索引

@property (nonatomic,copy) NSString *damageDegree;          //损伤程度.(填写维修金额时，可选择损伤程度)

@property (nonatomic,strong) NSArray *inoperables;          //不可操作工项

/**************自定义添加属性 -- 维修方式***********************/
@property (nonatomic,assign) BOOL replaceStatus;        //更换状态,是否更换
@property (nonatomic,assign) BOOL paintStatus;          //喷漆状态，是否喷漆
@property (nonatomic,assign) BOOL fitStatus;            //拆卸状态，是否拆卸
@property (nonatomic,assign) BOOL panelStatus;            //维修状态，是否维修
@property (nonatomic,assign) BOOL auxiliaryStatus;                 //维修状态，是否辅料
@property (nonatomic,assign) BOOL outRepairStatus;           //维修状态，是否外修
@property (nonatomic,assign) BOOL electroMechanicalStatus;            //维修状态，是否机电
@property (nonatomic,copy) NSNumber* electroMechanicalPrice;            //机电价格
@property (nonatomic,assign) BOOL accessoryStatus;          //拆装附件状态，是否拆装附件


@property (nonatomic,assign) double panelPrice;     //钣金价格


@property (nonatomic , copy) NSString* ExternalRepairer;//外修公司
@property (nonatomic , copy) NSString* ExternalInstructions; //外修备注

@property (nonatomic,readonly) BOOL hasOperationSelected; //是否选择了工项

@property (nonatomic , assign) BOOL isCustom; //自定义件
@property (nonatomic , copy) NSString* partAttribute; //配件类型（小件：EPC；自定义件：custom；正常件：normal）
@property (nonatomic,assign) NSString *laborPrice;             //自定义件工时价格

@end
