//
//  PersonalCenterTableViewCell.m
//  PhotographyChannel
//
//  Created by Neil Wang on 16/5/26.
//  Copyright © 2016年 Neil Wang. All rights reserved.
//

#import "PersonalCenterTableViewCell.h"

#define Space 5.0f

@implementation PersonalCenterTableViewCell
{
    UIView      *_bgView;
    UIImageView *_iconView;
    UILabel     *_titleLable;
    UIImageView *_arrowImage;
    
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews{
    
    self.backgroundColor = [UIColor grayColor];
    
    _bgView = [[UIView alloc] init];
    _iconView = [[UIImageView alloc] init];
    _titleLable = [[UILabel alloc] init];
    _arrowImage = [[UIImageView alloc] init];
    
    _bgView.backgroundColor = [UIColor whiteColor];
    _titleLable.font = [UIFont systemFontOfSize:12.0f];
    _titleLable.textColor = [UIColor grayColor];
    
    [self addSubview:_bgView];
    [_bgView addSubview:_iconView];
    [_bgView addSubview:_titleLable];
    [_bgView addSubview:_arrowImage];
}

- (void)layoutSubviews{
  
    [_bgView setFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)-1.0f)];
    
    [_iconView setFrame:CGRectMake(20.0f, Space, 30.0f, 30.0f)];
    [_arrowImage setFrame:CGRectMake(CGRectGetWidth(_bgView.frame)-20.0f-20.0f, Space*2, 15.0f, 15.0f)];
    [_titleLable setFrame:CGRectMake(CGRectGetMaxX(_iconView.frame)+Space, Space, CGRectGetWidth(_bgView.frame)-CGRectGetMaxX(_iconView.frame)-CGRectGetWidth(_arrowImage.frame)-20.0f, 30.0f)];
    
}

- (void)setCellWithTitle:(NSString *)title icon:(NSString *)icon{
    [_arrowImage setImage:[UIImage imageNamed:@"形状-6-副本-3---Assistor"]];
    [_iconView setImage:[UIImage imageNamed:icon]];
    [_titleLable setText:title];
}


@end
