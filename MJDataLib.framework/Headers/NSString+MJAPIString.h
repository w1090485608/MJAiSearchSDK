//
//  NSString+MJAPIString.h
//  MJDataLib
//
//  Created by Tan on 2018/4/12.
//  Copyright © 2018年 袁兴杨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MJAPIString)


/**
 获取请求接口

 @return 完整请求链接
 */
- (NSString *)mj_getAPIURL;

@end
