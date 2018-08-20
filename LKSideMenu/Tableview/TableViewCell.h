//
//  TableViewCell.h
//  LKSideMenu
//
//  Created by Apple on 18/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lblLine;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@end
