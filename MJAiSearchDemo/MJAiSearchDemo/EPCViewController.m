//
//  EPCViewController.m
//  MJDataLibDemo
//
//  Created by 谭健康 on 2018/11/8.
//  Copyright © 2018 袁兴杨. All rights reserved.
//

#import "EPCViewController.h"
#import <MJSearchPartLib/MJSearchPartLib.h>

@interface EPCViewController ()

@property (nonatomic, strong) UIImageView *epcImageView;

@end

@implementation EPCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.epcImageView];
    [MJSearchPartService requestEpcImageWithPart:self.part completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
        if (error) {
            return ;
        }
        NSLog(@"%@",response);
        self.epcImageView.image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:response]]];
    }];
}



- (UIImageView *)epcImageView {
    if (_epcImageView == nil) {
        _epcImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 300)];
        _epcImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _epcImageView;
}

@end
