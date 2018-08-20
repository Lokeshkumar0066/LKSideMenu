//
//  LKMenu.h
//  LKSideMenu
//
//  Created by Apple on 18/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKMenu : UIView
+ (id)loadFromNib:(NSString *)name classToLoad:(Class)classToLoad;
@end
