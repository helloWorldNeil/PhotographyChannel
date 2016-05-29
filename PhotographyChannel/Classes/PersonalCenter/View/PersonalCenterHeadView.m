//
//  PersonalCenterHeadView.m
//  PhotographyChannel
//
//  Created by Neil Wang on 16/5/26.
//  Copyright © 2016年 Neil Wang. All rights reserved.
//

#import "PersonalCenterHeadView.h"

#define PhotoWidth 100.0f
#define Space 10.0f

@implementation PersonalCenterHeadView
{
    
    UIImageView *_photoImageView;
    UILabel *_nameLable;
    UILabel *_signLable;
    UILabel *_accountLable;
    UILabel *_registTimeLable;
    UILabel *_separateLine;
    
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
        
        
    }
    return self;
}

- (void)layoutSubviews{
    [_photoImageView setFrame: CGRectMake((CGRectGetWidth(self.frame)-PhotoWidth)/2, Space, PhotoWidth, PhotoWidth)];
    [_nameLable setFrame:CGRectMake(Space, CGRectGetMaxY(_photoImageView.frame)+Space/2, CGRectGetWidth(self.frame)-Space*2, Space*3)];
    
    [_signLable setFrame:CGRectMake(Space, CGRectGetMaxY(_nameLable.frame)+Space/2, CGRectGetWidth(self.frame)-Space*2, Space*2)];

    [_accountLable setFrame:CGRectMake(Space, CGRectGetMaxY(_signLable.frame)+Space/2, (CGRectGetWidth(self.frame)-Space*2)/2-1, Space*2)];
   
    [_separateLine setFrame:CGRectMake(CGRectGetMaxX(_accountLable.frame), CGRectGetMaxY(_signLable.frame)+Space/2, 2, Space*2)];
    
    [_registTimeLable setFrame:CGRectMake(CGRectGetMaxX(_accountLable.frame)+2, CGRectGetMaxY(_signLable.frame)+Space/2, (CGRectGetWidth(self.frame)-Space*2)/2-1, Space*2)];

}


- (void)setupSubviews{
    
    self.backgroundColor = [UIColor redColor];
    _photoImageView = [[UIImageView alloc] init];
    _nameLable = [[UILabel alloc] init];
    _accountLable = [[UILabel alloc] init];
    _registTimeLable = [[UILabel alloc] init];
    _separateLine = [[UILabel alloc] init];
    _signLable = [[UILabel alloc] init];
    
    _photoImageView.layer.cornerRadius = PhotoWidth/2;
    _photoImageView.layer.masksToBounds = YES;
   
    _nameLable.textColor = [UIColor whiteColor];
    _nameLable.font = [UIFont systemFontOfSize:16.0f];
    _nameLable.textAlignment = NSTextAlignmentCenter;
   
    _accountLable.textColor = [UIColor grayColor];
    _accountLable.font = [UIFont systemFontOfSize:12.0f];
    _accountLable.textAlignment = NSTextAlignmentRight;
    
    _signLable.textColor = [UIColor grayColor];
    _signLable.font = [UIFont systemFontOfSize:12.0f];
    _signLable.textAlignment = NSTextAlignmentCenter;
    _registTimeLable.textColor = [UIColor grayColor];
    _registTimeLable.font = [UIFont systemFontOfSize:12.0f];
    
    _separateLine.backgroundColor = [UIColor whiteColor];
    
    
    [self addSubview:_photoImageView];
    [self addSubview:_signLable];
    [self addSubview:_nameLable];
    [self addSubview:_accountLable];
    [self addSubview:_registTimeLable];
    [self addSubview:_separateLine];
    
    //demo测试数据
    [_photoImageView setImage:[UIImage imageNamed:@"体检信息---Assistor"]];
    _nameLable.text = @"张三";
    _signLable.text = @"我是一条签名";
    _accountLable.text = @"18581842206";
    _registTimeLable.text = @"20160525";
}

- (void)setUserInfo:(UserInfoModel *)userInfo{
    
//    [_photoImageView setImage:[UIImage imageNamed:userInfo.portrait]];
//    [_signLable setText:userInfo.sign];
//    [_]
}


@end
