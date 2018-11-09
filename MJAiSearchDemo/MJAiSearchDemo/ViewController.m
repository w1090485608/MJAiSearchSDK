//
//  ViewController.m
//  MJDataLibDemo
//
//  Created by 袁兴杨 on 2018/3/8.
//  Copyright © 2018年 袁兴杨. All rights reserved.
//



#import "ViewController.h"
#import <MJDataLib/MJDataLib.h>
#import <MJVinParseLib/MJVinParseLib.h>
#import <MJAreaSearchPartLib/MJAreaSearchPartLib.h>
#import <MJSearchEPCPartLib/MJSearchEPCPartLib.h>
#import <MJSearchPartLib/MJSearchPartLib.h>
#import <Masonry/Masonry.h>
#import "DrawCircleController.h"

@interface ViewController ()<MJCanvasCircleSelectedPartProtocol>

@property (nonatomic, strong) UITextField *vinField;
@property (nonatomic, strong) UILabel   *carInfoLabel;
@property (nonatomic, strong) UIButton  *vinPraseButton;
@property (nonatomic, strong) UIButton  *conformButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view, typically from a nib.
    NSDictionary *userInfo = @{@"app_user_id"               :   @"18521099012",
                               @"app_user_name"             :   @"APP测试账号",
                               @"app_user_contact"          :   @"18520883027",
                               };
    [[MJDamageAssessmentManager sharedInstance] configureWithUserInfo:nil
                                                       complete:^(BOOL success) {

                                                           if (success) {
                                                       
                                                               
                                                           }
                                                           
    }];
    [self configUI];
    
}

- (void)configUI {
    [self.view addSubview:self.vinField];
    [self.view addSubview:self.carInfoLabel];
    [self.view addSubview:self.vinPraseButton];
    [self.view addSubview:self.conformButton];
    
    [self layout];
}


- (void)oeNumber {
    [MJSearchPartService searchPartWithOeNumber:@"" completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
        
        NSLog(@"responseresponseresponseresponse:%@",response);
        
    }];
}
#pragma mark -- MJVINParse

- (void)VINPrase {
//    LFV2A28V0G5040585
    [MJVinParseService vinParseWithVinCode:self.vinField.text completion:^(MJVehicle* response, BOOL success, NSError * _Nullable error) {

        if (success) {
            NSLog(@"%@",response.assemble.gyroBrand);
            self.carInfoLabel.text = [NSString stringWithFormat:@"%@ %@-%@-%@款",response.assemble.gyroBrand,response.assemble.modelNameEng,response.assemble.motor,response.assemble.produceYear];
            self.conformButton.hidden = NO;
            //                [MJVinParseService getPlanBBrandsCompletion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
            //                    [MJVinParseService getPlanBBrandDetailWithBrand:@"本田" maker:@"广汽本田" carSerial:@"飞度" body:@"两厢5门" completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
            //
            //                    }];
            //                }];
            [MJSearchPartService firstLetterRecommendWithText:@"Q" completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
                
            }];
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



- (void)searchWithImageName {
    [MJSearchPartService requestImageWithImageName:@"前保险杠皮" completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
        
    }];
}

- (void)assessment
{
//    [MJOrderService assessmentWithParts:@[] completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
//
//    }];
}

#pragma mark -- MJDrawCircle

- (void)drawCircleController {
    MJDrawCircleSearchPartController* draw = [[MJDrawCircleSearchPartController alloc]init];
    draw.delegate = self;
    [self addChildViewController:draw];
    draw.view.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64);
    [self.view addSubview:draw.view];
    [draw didMoveToParentViewController:self];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [draw switchDrawSearchModeWithMode:MJDrawModeChassis];
    });
}



- (void)textChange:(UITextField *)textField{
    
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

- (void)layout {
    [self.vinField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.view).offset(100);
        make.height.equalTo(@40);
    }];
    [self.carInfoLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.vinPraseButton.mas_bottom).offset(15);
    }];
    [self.vinPraseButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.vinField.mas_bottom).offset(15);
        make.height.equalTo(@30);
    }];
    
    [self.conformButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.carInfoLabel.mas_bottom).offset(15);
        make.height.equalTo(@30);
    }];
}

- (UITextField *)vinField{
    if (_vinField == nil) {
        _vinField = [[UITextField alloc] init];
        [_vinField addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
        _vinField.text = @"LBV5S1106ESH78688";
        _vinField.textColor = [UIColor blackColor];
        _vinField.backgroundColor = [UIColor orangeColor];
    }
    return _vinField;
}

- (UILabel *)carInfoLabel {
    if (_carInfoLabel == nil) {
        _carInfoLabel = [[UILabel alloc] init];
        _carInfoLabel.textColor = [UIColor blackColor];
    }
    return _carInfoLabel;
}

- (UIButton *)vinPraseButton {
    if (_vinPraseButton == nil) {
        _vinPraseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_vinPraseButton addTarget:self action:@selector(VINPrase) forControlEvents:UIControlEventTouchUpInside];
        [_vinPraseButton setTitle:@"VIN解析" forState:UIControlStateNormal];
        [_vinPraseButton setBackgroundColor:[UIColor orangeColor]];
    }
    return _vinPraseButton;
}

- (UIButton *)conformButton {
    if (_conformButton == nil) {
        _conformButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_conformButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [_conformButton setTitle:@"圈选" forState:UIControlStateNormal];
        [_conformButton setBackgroundColor:[UIColor orangeColor]];
        _conformButton.hidden = YES;
    }
    return _conformButton;
}

- (void)click {
    DrawCircleController *d = [[DrawCircleController alloc] init];
    [self.navigationController pushViewController:d animated:YES];
}

@end
