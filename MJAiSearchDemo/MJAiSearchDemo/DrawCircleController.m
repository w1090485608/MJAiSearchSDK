//
//  DrawCircleController.m
//  MJDataLibDemo
//
//  Created by 谭健康 on 2018/11/7.
//  Copyright © 2018 袁兴杨. All rights reserved.
//

#import "DrawCircleController.h"
#import <MJDataLib/MJDataLib.h>
#import <MJVinParseLib/MJVinParseLib.h>
#import <MJAreaSearchPartLib/MJAreaSearchPartLib.h>
#import <MJSearchEPCPartLib/MJSearchEPCPartLib.h>
#import <MJSearchPartLib/MJSearchPartLib.h>
#import <Masonry/Masonry.h>
#import "MJRefresh.h"
#import "EPCViewController.h"

@class PartListContrller;
@interface DrawCircleController () <MJCanvasCircleSelectedPartProtocol>

@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation DrawCircleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self drawCircleController];
    [self.view addSubview:self.nextButton];
    [self.nextButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@30);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-10);
    }];
}

- (void)drawCircleController {
    MJDrawCircleSearchPartController* draw = [[MJDrawCircleSearchPartController alloc]initWithCanvasFrame:CGRectMake(0,64, self.view.bounds.size.width, self.view.bounds.size.height-64)];
    draw.delegate = self;
    [self addChildViewController:draw];
    [self.view addSubview:draw.view];
    [draw didMoveToParentViewController:self];
}

- (void)canvasCircleSelectedPartsCompletion:(NSArray<MJPart *> *)parts
{
    NSLog(@"%@",parts);
    NSMutableArray* s = [[NSMutableArray alloc]init];
    for (int i = 0; i < parts.count; i ++) {
        MJPart* part = parts[i];
        if (i == 0) {
            part.replaceStatus = YES;
        }
        if (i == 1) {
            part.paintStatus = YES;
        }
        if (i == 2) {
            part.fitStatus = YES;
        }
        if (i == 3) {
            part.panelStatus = YES;
        }
        if (i == 4) {
            part.outRepairStatus = YES;
        }
        if (i == 5) {
            part.electroMechanicalStatus = YES;
        }
        if (i == 6) {
            part.auxiliaryStatus = YES;
        }
        
        [s addObject:part];
    }
    //     [self searchPartWithName];
    self.dataArray = s;
    [self click];
}

- (UIButton *)nextButton {
    if (_nextButton == nil) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
        [_nextButton setBackgroundColor:[UIColor orangeColor]];
        _nextButton.hidden = YES;
    }
    return _nextButton;
}

- (void)click {
    PartListContrller *part = [[PartListContrller alloc] init];
    part.dataArray = self.dataArray;
    [self.navigationController pushViewController:part animated:YES];
    self.nextButton.hidden = NO;
}

@end

static NSString *partCellIdentity = @"partCellIdentity";
@interface PartListContrller () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *searchName;

@end

@implementation PartListContrller

- (void)viewDidLoad {
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:partCellIdentity];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:partCellIdentity];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    MJPart *part = self.dataArray[indexPath.row];
    cell.textLabel.text = part.name;
    cell.detailTextLabel.text = part.partPrice;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MJPart *part = self.dataArray[indexPath.row];
    EPCViewController *epc = [[EPCViewController alloc] init];
    epc.part = part;
    [self.navigationController pushViewController:epc animated:YES];
}

- (void)loadSecondRecommand {
    [MJSearchPartService researchPartCompletion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
        if ([response[@"partResult"] count] > 0) {
            [self.dataArray addObjectsFromArray:response[@"partResult"]];
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
        }else {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self searchPartWithName];
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -- MJSearchPart
- (void)searchPartWithName {
    if (self.searchName.text.length < 1) {
        return ;
    }
    [MJSearchPartService searchPartWithKey:self.searchName.text query:(MJSearchQureyManuel) completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
        if ([response[@"partResult"] count] > 0) {
            [self.dataArray removeAllObjects];
            [self.dataArray addObjectsFromArray:response[@"partResult"]];
            [self.tableView reloadData];
        }
    }];
//  首字母查询
//    [MJSearchPartService firstLetterRecommendWithText:@"" completion:^(id  _Nullable response, BOOL success, NSError * _Nullable error) {
//        NSLog(@"%@",response);
//    }];
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self loadSecondRecommand];
        }];
        [footer setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
        [footer setTitle:@"上拉二次推荐" forState:MJRefreshStateIdle];
        [footer setTitle:@"没有更多推荐了" forState:MJRefreshStateNoMoreData];
        
        _tableView.mj_footer = footer;
        _tableView.tableHeaderView = self.searchName;
    }
    return _tableView;
}
- (UITextField *)searchName{
    if (_searchName == nil) {
        _searchName = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        _searchName.delegate = self;
        _searchName.placeholder = @"输入配件名称";
        _searchName.textColor = [UIColor blackColor];
        _searchName.backgroundColor = [UIColor orangeColor];
    }
    return _searchName;
}

@end
