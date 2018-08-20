//
//  ViewController.m
//  LKSideMenu
//
//  Created by Apple on 18/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "ViewController.h"
#import "LKMenu.h"
@interface ViewController (){
    LKMenu *menu;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    menu = [LKMenu loadFromNib:@"LKMenu" classToLoad:[LKMenu class]];
    menu.frame = CGRectMake(-self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:menu];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideSideMenu:)
                                                 name:@"hideSideMenu" object:nil];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)show{
    [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self->menu.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hide :(UIViewController *)viewController identifier:(NSString *)identifier index:(NSInteger)index{
    [UIView animateWithDuration:0.5f delay:0.2f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self->menu.frame = CGRectMake(-self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished) {
        if (![identifier isEqualToString:@"NoClass"]) {
            [self pushView:viewController identifier:identifier index:index];
        }
    }];
}


- (IBAction)BtnShow:(id)sender {
    [self show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)hideSideMenu :(NSNotification *)notification{
    
    NSDictionary *dict = [notification object];
    if (dict.count > 0)
        [self hide:[dict objectForKey:@"viewController"] identifier:[dict objectForKey:@"class_Identifier"] index:[[dict objectForKey:@"Index"]integerValue]];
    else
        [self hide:nil identifier:@"NoClass" index:10000];
}

- (void)pushView :(UIViewController *)viewController identifier:(NSString *)identifier index:(NSInteger)index{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    viewController = [story instantiateViewControllerWithIdentifier:identifier];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
