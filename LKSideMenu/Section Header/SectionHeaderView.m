//
//  SectionHeaderView.m
//  LKSideMenu
//
//  Created by Apple on 18/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "SectionHeaderView.h"
#define IPAD     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@implementation SectionHeaderView

- (id)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setUpView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]) {
        [self setUpView];
    }
    return self;
}

- (void)setUpView{
    self.profileImage.layer.cornerRadius = 10.0f;
    self.profileImage.layer.masksToBounds = YES;
    self.profileImage.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.profileImage.layer.shadowOffset = CGSizeMake(3.0, 3.0);
    self.profileImage.layer.shadowRadius = 5.0;
    self.profileImage.clipsToBounds = NO;
    self.profileImage.layer.shadowOpacity = 1.0;
    self.profileImage.image = [UIImage imageNamed:@"download.jpeg"];
}

+ (SectionHeaderView *)initlization{
    NSString *bundleIdentifier = @"com.LK.LKSideMenu";
    NSBundle *bundle = [NSBundle bundleWithIdentifier:bundleIdentifier];
    SectionHeaderView *view =  [[bundle loadNibNamed:@"SectionHeaderView" owner:nil options:nil] objectAtIndex:0];
    [view setUpView];
    return view;
}





@end
