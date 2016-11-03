//
//  MMTableViewController.m
//  ObjCPlayStand
//
//  Created by vivek on 05/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import "MMTableViewController.h"
#import "PlayListTableViewCell.h"
#import "UIColor+HexRepresentation.h"
@interface MMTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray * datasource;
    NSArray * productBrand;
    NSArray * productType;
    NSArray * productWeight;
    NSArray * productPrice;
    
}
@end

@implementation MMTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    _tableViewdataArray = [_subCatMenuDetailsDesc valueForKey:@"title"];
    datasource = [_subCatMenuDetailsDesc valueForKey:@"image_path"];
    if (datasource == (id)[NSNull null] || [datasource count] == 0) {
        NSLog(@"array is empty");
        datasource = [NSMutableArray new];
    }
    productBrand = [_subCatMenuDetailsDesc valueForKey:@"brand"];
    if (productBrand == (id)[NSNull null] || [productBrand count] == 0) {
        NSLog(@"array is empty");
        productBrand = [NSMutableArray new];
    }
    productType = [_subCatMenuDetailsDesc valueForKey:@"product_type"];
    if (productType == (id)[NSNull null] || [productType count] == 0) {
        NSLog(@"array is empty");
        productType = [NSMutableArray new];
    }
    productPrice =[_subCatMenuDetailsDesc valueForKey:@"market price"];
    if (productPrice == (id)[NSNull null] || [productPrice count] == 0) {
        NSLog(@"array is empty");
        productPrice = [NSMutableArray new];
    }
    productWeight =[_subCatMenuDetailsDesc valueForKey:@"weight"];
    if (productWeight == (id)[NSNull null] || [productWeight count] == 0) {
        NSLog(@"array is empty");
        productWeight = [NSMutableArray new];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    if (_tableViewdataArray == (id)[NSNull null] || [_tableViewdataArray count] == 0) {
        NSLog(@"array is empty");
        _tableViewdataArray = [NSMutableArray new];
    }
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    UIView *clearView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200)];
    clearView.backgroundColor = [UIColor clearColor];
    
    UILabel *logo = [[UILabel alloc] initWithFrame:CGRectMake(0, clearView.center.y - 30, _tableView.frame.size.width, 60)];
    logo.text = _tittleTxt;
    logo.textAlignment=NSTextAlignmentCenter;
    [logo setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25]];
    logo.contentMode = UIViewContentModeCenter;
    logo.textColor = [UIColor whiteColor];
    [clearView addSubview:logo];
    
    
    _tableView.tableHeaderView = clearView;
    [self.tableView registerNib:[UINib nibWithNibName:@"PlayListTableViewCell" bundle:nil] forCellReuseIdentifier:@"PlayListCell"];
    self.tableView.rowHeight = 177;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    //    _tableView.decelerationRate =  UIScrollViewDecelerationRateFast;
    _tableView.alwaysBounceVertical = NO;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _tableViewdataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"PlayListCell";
    PlayListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell = [[PlayListTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.headerImage setImageWithURL:[NSURL URLWithString:[datasource objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"loading_gif"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    if(![zoHukumConstant checkNullorNil:[NSString stringWithFormat:@"%@",[productType objectAtIndex:indexPath.row]]]){
     cell.type.text   = [NSString stringWithFormat:@"%@",[productType objectAtIndex:indexPath.row]];
    }
    if(![zoHukumConstant checkNullorNil:[NSString stringWithFormat:@"%@",[productWeight objectAtIndex:indexPath.row]]]){
       cell.weight.text = [NSString stringWithFormat:@"Weight:%@",[productWeight objectAtIndex:indexPath.row]];
    }
//    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
//    [formatter setLocale:[NSLocale currentLocale]];
    if(![zoHukumConstant checkNullorNil:[NSString stringWithFormat:@"%@",[productPrice objectAtIndex:indexPath.row]]]){
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [formatter setLocale:[NSLocale currentLocale]];
        
        [cell.price setTitle:[NSString stringWithFormat:@"%@",[formatter stringFromNumber:[productPrice objectAtIndex:indexPath.row]]] forState:UIControlStateNormal];
    }
    if(![zoHukumConstant checkNullorNil:[NSString stringWithFormat:@"%@",[productBrand objectAtIndex:indexPath.row]]]){
        cell.brand.text  = [NSString stringWithFormat:@"Brand: %@",[productBrand objectAtIndex:indexPath.row]];
    }
   
    if(![zoHukumConstant checkNullorNil:[NSString stringWithFormat:@"%@",[_tableViewdataArray objectAtIndex:indexPath.row]]]){
         cell.titleNews.text= [NSString stringWithFormat:@"%@",[_tableViewdataArray objectAtIndex:indexPath.row]];
    }
    
    return cell;
}

@end
