//
//  PersonalCenterTableViewCell.h
//  PhotographyChannel
//
//  Created by Neil Wang on 16/5/26.
//  Copyright © 2016年 Neil Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalCenterTableViewCell : UITableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void)setCellWithTitle:(NSString *)title icon:(NSString *)icon;
@end
