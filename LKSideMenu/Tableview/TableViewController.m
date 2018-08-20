//
//  TableViewController.m
//  LKSideMenu
//
//  Created by Apple on 18/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)init{
    if(self = [super init]){
        [self setUpView];
    }
    return self;
}

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
    [self registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}


+ (TableViewController *)initlization{
    NSString *bundleIdentifier = @"com.LK.LKSideMenu";
    NSBundle *bundle = [NSBundle bundleWithIdentifier:bundleIdentifier];
    TableViewController *view =  [[bundle loadNibNamed:@"TableViewController" owner:nil options:nil] objectAtIndex:0];
    return view;
}


@end
