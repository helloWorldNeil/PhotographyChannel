//
//  PersonalCenterHeadView.h
//  PhotographyChannel
//
//  Created by Neil Wang on 16/5/26.
//  Copyright © 2016年 Neil Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoModel.h"
@interface PersonalCenterHeadView : UIView
@property (nonatomic, retain) UserInfoModel *userInfo;

- (instancetype)initWithFrame:(CGRect)frame;

@end
