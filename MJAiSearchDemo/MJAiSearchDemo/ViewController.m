//
//  ViewController.m
//  MJAiSearchDemo
//
//  Created by 袁兴杨 on 2018/11/5.
//  Copyright © 2018 袁兴杨. All rights reserved.
//

#import "ViewController.h"
#import <MJDataLib/MJDataLib.h>
#import <MJVinParseLib/MJVinParseLib.h>
#import <MJAreaSearchPartLib/MJAreaSearchPartLib.h>
#import <MJSearchEPCPartLib/MJSearchEPCPartLib.h>
#import <MJSearchPartLib/MJSearchPartLib.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSDictionary *userInfo = @{@"app_user_id"               :   @"18521099012",
                               @"app_user_name"             :   @"APP测试账号",
                               @"app_user_contact"          :   @"18520883027",
                               };
    //        [[MJDamageAssessmentManager sharedInstance]configureWithKey:@"f5866c4a4d6014ecced47960c2e3d07f" sesstionID:@"SDK_TB_001" sesstionName:@"测试" trankey:@"SDK_SPECIAL_SERVICE0405" userInfo:userInfo complete:^(BOOL success) {
    [[MJDamageAssessmentManager sharedInstance] configureWithUserInfo:nil
                                                             complete:^(BOOL success) {
                                                                 
                                                                 if (success) {
                                                                     [self VINPrase];
                                                                     
                                                                 }
                                                                 
                                                             }];
}

- (void)oeNumber {
    [MJSearchPartService searchPartWithOeNumber:@"" completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
        
        NSLog(@"responseresponseresponseresponse:%@",response);
        
    }];
}
#pragma mark -- MJVINParse

- (void)VINPrase {
    //    LFV2A28V0G5040585
    [MJVinParseService vinParseWithVinCode:@"LBV5S1106ESH78688" completion:^(MJVehicle* response, BOOL success, NSError * _Nullable error) {
        
        if (success) {
            NSLog(@"%@",response.assemble.gyroBrand);
            
            //                [MJVinParseService getPlanBBrandsCompletion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
            //                    [MJVinParseService getPlanBBrandDetailWithBrand:@"本田" maker:@"广汽本田" carSerial:@"飞度" body:@"两厢5门" completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
            //
            //                    }];
            //                }];
            
            [self drawCircleController];
            [self searchPartWithName];
            [self searchWithImageName];
            //            [MJSearchPartService requestImageWithImageName:@"前保险杠皮" completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
            //
            //                NSLog(@"%@",response);
            //                NSData* data = [[NSData alloc]initWithBase64EncodedString:response[@"ImageInfo"] options:NSDataBase64DecodingIgnoreUnknownCharacters];
            //                UIImage* photo = [UIImage imageWithData:data];
            //
            //            }];
        }
        
    }];
}

#pragma mark -- MJSearchPart
- (void)searchPartWithName {
    
    [MJSearchPartService searchPartWithKey:@"换前保险杠皮拆左前大灯壳" query:(MJSearchQureyManuel) completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
        //        [MJSearchPartService researchPartCompletion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
        //            NSLog(@"%@",response);
        //        }];
        
    }];
}

- (void)searchWithImageName {
    [MJSearchPartService requestImageWithImageName:@"前保险杠皮" completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
        
    }];
}

#pragma mark -- MJDrawCircle

- (void)drawCircleController {
    MJDrawCircleSearchPartController* draw = [[MJDrawCircleSearchPartController alloc]init];
    draw.delegate = self;
    [self addChildViewController:draw];
    draw.view.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64);
    [self.view addSubview:draw.view];
    [draw didMoveToParentViewController:self];
}

- (void)canvasCircleSelectedPartsCompletion:(NSArray<NSDictionary *> *)parts
{
    NSLog(@"%@",parts);
    [self searchWithImageNameAndOENumber:[parts lastObject]];
    //     [self searchPartWithName];
}


#pragma mark -- MJSearchEPCPart

- (void)searchWithImageNameAndOENumber:(MJPart *)part {
    
    //    [MJSearchEPCPartService searchRelatedPartsWithImageName:part.imageName imagepath:part.image_address_suffix oeNumber:part.partNumber.OE completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
    //        NSLog(@"relatedParts ::::: %@",response);
    //    }];
    [MJSearchEPCPartService searchRelatedPartsWithPart:part completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
        NSLog(@"relatedParts ::::: %@",response);
    }];
}


@end
