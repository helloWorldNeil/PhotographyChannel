//
//  LeftSlidViewController.m
//  PhotographyChannel
//
//  Created by Neil Wang on 16/5/26.
//  Copyright © 2016年 Neil Wang. All rights reserved.
//

#import "LeftSlidViewController.h"
#import "AppDelegate.h"

@interface LeftSlidViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) UIButton *logOuntButton;

@end


@implementation LeftSlidViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self initUI];
    [self initData];
}

- (void)initUI{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self setupTableView];
    [self setupButton];
}

- (void)initData{
    
}

- (void)setupTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-40.0f) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)setupButton{
    _logOuntButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_logOuntButton setFrame:CGRectMake(20.0f, CGRectGetHeight(self.view.frame)-50.0f, 200.0f-20.0f*2, 40.0f)];
    _logOuntButton.backgroundColor = [UIColor redColor];
    _logOuntButton.layer.cornerRadius = 5.0f;
    _logOuntButton.layer.masksToBounds = YES;
    [_logOuntButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [_logOuntButton addTarget:self action:@selector(logOutAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_logOuntButton];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentify = @"UITableViewCellIdentify1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    cell.textLabel.text = @"个人中心";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [[AppDelegate shareInstance].drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
            NSLog(@"关闭左侧抽屉");
        }];
    }
}


#pragma mark- logout

//退出登录
- (void)logOutAction:(id)sender{
  
    [[AppDelegate shareInstance].drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        NSLog(@"关闭左侧抽屉");
    }];

}

@end
