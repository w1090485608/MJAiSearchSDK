//
//  MJOrderService.h
//  MJOrderServiceLib
//
//  Created by 袁兴杨 on 2018/11/6.
//  Copyright © 2018 袁兴杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJDataLib/MJDataLib.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJOrderService : NSObject


+ (void)assessmentWithParts:(nonnull NSArray *)parts  completion: (_Nullable ServiceResponseBlock)completion;


@end

NS_ASSUME_NONNULL_END
