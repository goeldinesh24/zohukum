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
#import "QueryDetailsViewController.h"
#import "APIManager.h"

@interface MMTableViewController ()<UITableViewDelegate,UITableViewDataSource,ZHApiManagerDelegate>
{
    NSArray * datasource;
    NSArray * productBrand;
    NSArray * productType;
    NSArray * productWeight;
    NSArray * productPrice;
    NSArray * productId;
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
    productId = [_subCatMenuDetailsDesc valueForKey:@"id"];
    if (productId == (id)[NSNull null] || [productId count] == 0) {
        NSLog(@"array is empty");
        productId = [NSMutableArray new];
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
    
    CGRect frame = _tableView.frame;
    frame.size.height = self.tableView.frame.size.height-150;
    [_tableView setFrame:frame];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createPopUpView:(UIButton *)sender{
    
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
    cell.plusMinusView.hidden = NO;
    cell.minus.hidden = NO;
    cell.minus.hidden = NO;
    cell.price.hidden =NO;
    cell.buyListProduct.hidden = NO;
    if (cell==nil) {
        cell = [[PlayListTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.headerImage setImageWithURL:[NSURL URLWithString:[datasource objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"loading_gif"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    if(![zoHukumConstant checkNullorNil:[NSString stringWithFormat:@"%@",[productType objectAtIndex:indexPath.row]]]){
        if(![[NSString stringWithFormat:@"%@",[productType objectAtIndex:indexPath.row]] isEqualToString:@"Query"]){
            cell.type.text   = [NSString stringWithFormat:@"%@",[productType objectAtIndex:indexPath.row]];
        }else{
            cell.plusMinusView.hidden = YES;
            cell.buyListProduct.hidden = YES;
            cell.minus.hidden = YES;
            cell.plus.hidden = YES;
            cell.addtoCartProduct.hidden =YES;
            cell.type.text   = [NSString stringWithFormat:@"Send %@",[productType objectAtIndex:indexPath.row]];
            cell.type.backgroundColor = [UIColor brownColor];
            cell.type.textColor = [UIColor whiteColor];
            [cell.type.layer setValue:[NSString stringWithFormat:@"%@",[productPrice objectAtIndex:indexPath.row]] forKey:@"marketPrice"];
            [cell.type.layer setValue:[NSString stringWithFormat:@"%@",[_tableViewdataArray objectAtIndex:indexPath.row]] forKey:@"tittle"];
            cell.type.tag = [[productId objectAtIndex:indexPath.row]intValue];
            cell.type.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(getBuyListView:)];
            tap.numberOfTapsRequired = 1;
            [cell.type addGestureRecognizer:tap];
        }
     
    }
    if(![zoHukumConstant checkNullorNil:[NSString stringWithFormat:@"%@",[productWeight objectAtIndex:indexPath.row]]]){
       cell.weight.text = [NSString stringWithFormat:@"Weight:%@",[productWeight objectAtIndex:indexPath.row]];
    }
    NSLog(@"vvvv%@",cell.quantityOfSelectediTem.text);
    cell.addtoCartProduct.tag = [[productId objectAtIndex:indexPath.row] intValue];
    [cell.addtoCartProduct addTarget:self action:@selector(addtoCartProductDetails:) forControlEvents:UIControlEventTouchUpInside];
    if(![zoHukumConstant checkNullorNil:[NSString stringWithFormat:@"%@",[productPrice objectAtIndex:indexPath.row]]]){
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [formatter setLocale:[NSLocale currentLocale]];
        if(![[NSString stringWithFormat:@"%@",[productPrice objectAtIndex:indexPath.row]] isEqualToString:@""]){
            [cell.price setTitle:[NSString stringWithFormat:@"%@",[formatter stringFromNumber:[productPrice objectAtIndex:indexPath.row]]] forState:UIControlStateNormal];
        }else{
            cell.price.hidden =YES;
        }
        
    }else{
        cell.price.hidden =YES;
    }
    if(![zoHukumConstant checkNullorNil:[NSString stringWithFormat:@"%@",[productBrand objectAtIndex:indexPath.row]]]){
        cell.brand.text  = [NSString stringWithFormat:@"Brand: %@",[productBrand objectAtIndex:indexPath.row]];
    }
   
    if(![zoHukumConstant checkNullorNil:[NSString stringWithFormat:@"%@",[_tableViewdataArray objectAtIndex:indexPath.row]]]){
         cell.titleNews.text= [NSString stringWithFormat:@"%@",[_tableViewdataArray objectAtIndex:indexPath.row]];
    }
    
    return cell;
}

-(void)addtoCartProductDetails:(UIButton*)sender{
    
    UIButton *Id = (UIButton *)sender;
    
    int producrID = (int)Id.tag;
    int userID = [[[NSUserDefaults standardUserDefaults]valueForKey:@"USER_ID"] intValue];

    NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]init];
    [sendtoserverrequestData setObject:@"add_to_cart" forKey:@"section"];
    [sendtoserverrequestData setObject:@"2" forKey:@"qty"];
    [sendtoserverrequestData setObject:[NSString stringWithFormat:@"%d",producrID] forKey:@"item_id"];
    [sendtoserverrequestData setObject:[NSString stringWithFormat:@"%d",userID] forKey:@"user_id"];
    [APIManager apiManager].delegate = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [[APIManager apiManager] addToCartProductfromServer:sendtoserverrequestData];
    });
  
    
}

- (void)getBuyListView:(UITapGestureRecognizer *)sender{
    UILabel *lbl = (UILabel *)sender.view;
    NSString *marketPrice = [lbl.layer valueForKey:@"marketPrice"];
    NSString *tittle = [lbl.layer valueForKey:@"tittle"];

    QueryDetailsViewController *detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"QueryDetailsViewController"];
    detailView.productlblID = [NSString stringWithFormat:@"%ld",(long)lbl.tag];
    detailView.marketPrice = marketPrice;
    detailView.tittle = tittle;
    [self.navigationController pushViewController:detailView animated:YES];
}

-(void)getResponse:(NSMutableDictionary *)response serviceIdentifier:(NSString *)serviceIdentifier {
      NSDictionary *userInfo = [NSDictionary dictionaryWithObject:[response mutableCopy]
                                forKey:@"updateCartProductDetails"];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"updateCartProduct" object:userInfo];
}

@end
