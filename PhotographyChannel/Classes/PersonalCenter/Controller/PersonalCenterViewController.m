//
//  PersonalCenterViewController.m
//  PhotographyChannel
//
//  Created by Neil Wang on 16/5/26.
//  Copyright © 2016年 Neil Wang. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "PersonalCenterHeadView.h"
#import "PersonalCenterTableViewCell.h"
#import "MyAlbumViewController.h"
#import "SettingViewController.h"
#import "UIBarButtonItem+Extension.h"
@interface PersonalCenterViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_iconArray;
    NSArray *_titleArray;
    BOOL     _isOpen;
}

@property (nonatomic,retain) UITableView *tableView;

@end



@implementation PersonalCenterViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self initData];
    [self setupTableView];
    [self setupNaviBarItem];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

#pragma mark-init
- (void)setupTableView{
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}


- (void)setupNaviBarItem{
   
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(goLeftPage) image:@"形状-6-副本-3---Assistor" highImage:@"形状-6-副本-3---Assistor"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(goSettting) image:@"形状-6-副本-3---Assistor" highImage:@"形状-6-副本-3---Assistor"];
}


- (void)initData{
    self.title = @"个人中心";
    _isOpen = NO;
    _iconArray  = @[@"1---Assistor",
                    @"2---Assistor",
                    @"3---Assistor",
                    @"4---Assistor",
                    @"5---Assistor",
                    @"6---Assistor"];
    _titleArray = @[@"我的相册",
                    @"我的收藏",
                    @"我的关注",
                    @"我的粉丝",
                    @"我的活动",
                    @"我的群组"];

    
}


#pragma mark- tableViewDataSource&Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    PersonalCenterHeadView *headView = [[PersonalCenterHeadView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 170.0f)];
    
    return headView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"PersonalCenterTableViewCell";
    
    PersonalCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[PersonalCenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell setCellWithTitle:_titleArray[indexPath.row] icon:_iconArray[indexPath.row]];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    if (indexPath.row == 0) {
        MyAlbumViewController *myAlbum = [[MyAlbumViewController alloc] init];
        [self.navigationController pushViewController:myAlbum animated:YES];
    }
}


#pragma mark- buttonAction
- (void)goLeftPage{
   
    if (_isOpen) {
        [[AppDelegate shareInstance].drawerController closeDrawerAnimated:YES completion:nil];
  
    }else{
        [[AppDelegate shareInstance].drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];

    }
    _isOpen = !_isOpen;

  }

- (void)goSettting{
    SettingViewController *setting = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}

@end
