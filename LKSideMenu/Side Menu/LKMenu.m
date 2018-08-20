//
//  LKMenu.m
//  LKSideMenu
//
//  Created by Apple on 18/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "LKMenu.h"
#import "TableViewController.h"
#import "SectionHeaderView.h"
#import "TableViewCell.h"
#import "OneClassVC.h"
#import "TwoClassVC.h"
#import "ThreeClassVC.h"
#define tableViewWidth self.frame.size.width / 2 + 50

@interface LKMenu() <UITableViewDelegate, UITableViewDataSource>{
    TableViewController *tblViewObj;
    SectionHeaderView *sectionHeaderViewObj;
    UITapGestureRecognizer *tapGesture;
    NSMutableArray *arrPush;
    NSArray *arrTitle;
    NSArray *arrImage;
    OneClassVC *oneObj;
    TwoClassVC *twoObj;
    ThreeClassVC *threeObj;
}
@end

@implementation LKMenu

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


+ (id)loadFromNib:(NSString *)name classToLoad:(Class)classToLoad {
    NSString *bundleIdentifier = @"com.LK.LKSideMenu";
    NSBundle *bundle = [NSBundle bundleWithIdentifier:bundleIdentifier];
    UIView *view =  [[bundle loadNibNamed:name owner:nil options:nil] objectAtIndex:0];
    return view;
}


- (void)setUpView{
    tblViewObj = [TableViewController initlization];
    tblViewObj.delegate = self;
    tblViewObj.dataSource = self;
    tblViewObj.frame = CGRectMake(0, 0, tableViewWidth, self.frame.size.height);
    [self addSubview:tblViewObj];
    [self loadData];
    [self setPushClasses];
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide:)];
    gestureRecognizer.numberOfTapsRequired = 1;
    [self addGestureRecognizer:gestureRecognizer];
    [tblViewObj reloadData];
}

- (void)loadData{
    arrTitle = [NSArray arrayWithObjects:@"One",@"Two",@"Three", nil];
    arrImage = [NSArray arrayWithObjects:@"0.png",@"1.png",@"2.png", nil];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        sectionHeaderViewObj = [SectionHeaderView initlization];
        return sectionHeaderViewObj;
    }return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 120;
    }return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section != 0) {
        return arrTitle.count;
    }return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.imgView.image = [UIImage imageNamed:[arrImage objectAtIndex:indexPath.row]];
    cell.lblName.text = [arrTitle objectAtIndex:indexPath.row];
    cell.lblLine.backgroundColor = [UIColor purpleColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}


- (void)hide :(UITapGestureRecognizer *)recognizer{
    if(recognizer.state == UIGestureRecognizerStateEnded){
        CGPoint position = [recognizer locationInView:tblViewObj];
        
        NSIndexPath *indexPath = [tblViewObj indexPathForRowAtPoint:position];
        if (indexPath == nil){
            if (position.x >= tableViewWidth) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"hideSideMenu" object:nil];
            }
        }
        else {
            NSInteger index = indexPath.row;
//            UITableViewCell *cell = [tblViewObj cellForRowAtIndexPath:indexPath];
//            CGPoint pointInCell = [cell convertPoint:position fromView:tblViewObj];
            NSDictionary *dict = [self tappedObject:index];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"hideSideMenu" object:dict];
        }
    }
}


- (NSDictionary *)tappedObject :(NSInteger)tappedIndex{
    NSPredicate *thePredicate = [NSPredicate predicateWithFormat:@"%K LIKE %@", @"Index", [NSString stringWithFormat:@"%ld",(long)tappedIndex]];
    NSArray *filteredList = [arrPush filteredArrayUsingPredicate:thePredicate];
    
    NSDictionary *selectedDict = [[NSDictionary alloc]init];
    selectedDict = [filteredList lastObject];
    return selectedDict;
}

- (void)setPushClasses{
    arrPush = [NSMutableArray new];
    if (arrPush.count > 0) {
        [arrPush removeAllObjects];
    }
    oneObj = [OneClassVC new];
    twoObj = [TwoClassVC new];
    threeObj = [ThreeClassVC new];
    NSArray *arrClassName = [NSArray arrayWithObjects:oneObj,twoObj,threeObj, nil];
    NSArray *arrStoryBoardID = [NSArray arrayWithObjects:@"OneClassVC",@"TwoClassVC",@"ThreeClassVC", nil];
    for (int iCount = 0; iCount < arrClassName.count; iCount++) {
        NSDictionary *dict = [self setDataIntoDictionary:[arrClassName objectAtIndex:iCount] identifier:[arrStoryBoardID objectAtIndex:iCount] index:iCount];
        [arrPush addObject:dict];
    }
    
}


- (NSDictionary *)setDataIntoDictionary :(UIViewController *)viewController identifier:(NSString *)identifier index:(NSInteger)index{
    NSDictionary *dict = @{
                           @"viewController" : viewController,
                           @"class_Identifier" : identifier,
                           @"Index" : [NSString stringWithFormat:@"%ld",(long)index]
                           };
    return dict;
}
@end
