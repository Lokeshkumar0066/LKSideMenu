//
//  SectionHeaderView.h
//  LKSideMenu
//
//  Created by Apple on 18/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionHeaderView : UIView
+ (SectionHeaderView *)initlization;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *companyName;
@property (weak, nonatomic) IBOutlet UILabel *companyAddress;
@end
