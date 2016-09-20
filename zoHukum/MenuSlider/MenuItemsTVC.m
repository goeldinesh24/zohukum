//
//  MenuItemsTVC.m
//  ObjCExample
//
//  Created by Evgeny on 09.01.15.
//  Copyright (c) 2015 Evgeny Nazarov. All rights reserved.
//

#import "MenuItemsTVC.h"
#import "zoHukum-Swift.h"
#import "APIManager.h"
#import "zhContactUsViewController.h"
#import "MultiSupportWebViewController.h"
#import "ViewController.h"


@implementation MenuItemsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setContentInset:UIEdgeInsetsMake(64.f, 0, 0, 0)];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    _listofMenuItems = [[NSMutableArray alloc]initWithObjects:@"Special Brands",@"Refer Store",@"Advert Request",@"Tell Friend",@"Contact Us",@"Customer Support",@"News",@"How it works",@"Shipping and Returns",@"Privacy Policy",@"Terms & Condition",@"FAQ",@"Exit", nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_main_category",@"section", nil];

    [APIManager apiManager].delegate = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [[APIManager apiManager] GetMainCategoryfromServer:sendtoserverrequestData];
    });
    
}

-(void)getResponse:(NSMutableDictionary *)response serviceIdentifier:(NSString *)serviceIdentifier {
    _listofMenuItems = nil;
    _listofMenuItems = [NSMutableArray new];
    _listofMenuItemsiD= [NSMutableArray new];
    _topListofMenuItems = [response valueForKey:@"category"];
    _topListofMenuItemsID = [response valueForKey:@"id"];
    [_listofMenuItems addObjectsFromArray:_topListofMenuItems];
    [_listofMenuItemsiD addObjectsFromArray:_topListofMenuItemsID];
    [_listofMenuItems addObject:@"Special Brands"];
    [_listofMenuItems addObject:@"Refer Store"];
    [_listofMenuItems addObject:@"Advert Request"];
    [_listofMenuItems addObject:@"Tell Friend"];
    [_listofMenuItems addObject:@"Contact Us"];
    [_listofMenuItems addObject:@"News"];
    [_listofMenuItems addObject:@"How it works"];
    [_listofMenuItems addObject:@"Shipping and Returns"];
    [_listofMenuItems addObject:@"Privacy Policy"];
    [_listofMenuItems addObject:@"Terms & Condition"];
    [_listofMenuItems addObject:@"FAQ"];
    [_listofMenuItems addObject:@"Exit"];
    
    dispatch_async(dispatch_get_main_queue(),^{
       [self.tableView reloadData];
    });
}

- (void)getFailResponse:(NSError *)errObj serviceIdentifier:(NSString *)serviceIdentifier {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"ERROR !!!"
                                     message:kInternalInconsistencyErrorMessage
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* noButton = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                       
                                   }];
        [alert addAction:noButton];
        
        [self presentViewController:alert animated:YES completion:nil];
    });

}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _listofMenuItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
        cell.backgroundColor = [UIColor whiteColor];
        cell.layer.borderWidth = .5;
        cell.layer.borderColor = [[UIColor lightGrayColor]CGColor];
        UIView *selectionView = [[UIView alloc] initWithFrame:cell.bounds];
        selectionView.backgroundColor = [UIColor lightGrayColor];
        [cell setSelectedBackgroundView:selectionView];
    }
    
    UIButton   * checkBox=[UIButton buttonWithType:UIButtonTypeCustom];
    checkBox.tag=1;
    checkBox.frame=CGRectMake(10,15, 25, 25);
    if([[NSString stringWithFormat:@"%@",[_listofMenuItems objectAtIndex:indexPath.row]]isEqualToString:@"Exit"]){
        [checkBox setImage:[UIImage imageNamed:@"ic_exit"] forState:UIControlStateNormal];
        
    }else if([[NSString stringWithFormat:@"%@",[_listofMenuItems objectAtIndex:indexPath.row]]isEqualToString:@"FAQ"]){
        [checkBox setImage:[UIImage imageNamed:@"ic_faq"] forState:UIControlStateNormal];
    }
    else if([[NSString stringWithFormat:@"%@",[_listofMenuItems objectAtIndex:indexPath.row]]isEqualToString:@"Terms & Condition"]){
        [checkBox setImage:[UIImage imageNamed:@"ic_terms_conditions"] forState:UIControlStateNormal];
    }
    else if([[NSString stringWithFormat:@"%@",[_listofMenuItems objectAtIndex:indexPath.row]]isEqualToString:@"Privacy Policy"]){
        [checkBox setImage:[UIImage imageNamed:@"ic_privacy_policy"] forState:UIControlStateNormal];
    }
    else if([[NSString stringWithFormat:@"%@",[_listofMenuItems objectAtIndex:indexPath.row]]isEqualToString:@"Shipping and Returns"]){
        [checkBox setImage:[UIImage imageNamed:@"ic_shipping_returns"] forState:UIControlStateNormal];
    }else if([[NSString stringWithFormat:@"%@",[_listofMenuItems objectAtIndex:indexPath.row]]isEqualToString:@"News"]){
        [checkBox setImage:[UIImage imageNamed:@"ic_news"] forState:UIControlStateNormal];
    }
    else if([[NSString stringWithFormat:@"%@",[_listofMenuItems objectAtIndex:indexPath.row]]isEqualToString:@"Customer Support"]){
        [checkBox setImage:[UIImage imageNamed:@"ic_support"] forState:UIControlStateNormal];
    }
    else if([[NSString stringWithFormat:@"%@",[_listofMenuItems objectAtIndex:indexPath.row]]isEqualToString:@"Refer Store"]){
        [checkBox setImage:[UIImage imageNamed:@"ic_refer"] forState:UIControlStateNormal];
    }
    else if([[NSString stringWithFormat:@"%@",[_listofMenuItems objectAtIndex:indexPath.row]]isEqualToString:@"Advert Request"]){
        [checkBox setImage:[UIImage imageNamed:@"ic_advert"] forState:UIControlStateNormal];
    }
    else if([[NSString stringWithFormat:@"%@",[_listofMenuItems objectAtIndex:indexPath.row]]isEqualToString:@"How it works"]){
        [checkBox setImage:[UIImage imageNamed:@"how_it_works"] forState:UIControlStateNormal];
        
    }else if([[NSString stringWithFormat:@"%@",[_listofMenuItems objectAtIndex:indexPath.row]]isEqualToString:@"Tell Friend"]){
        [checkBox setImage:[UIImage imageNamed:@"ic_tell_friend"] forState:UIControlStateNormal];
    }
    else if([[NSString stringWithFormat:@"%@",[_listofMenuItems objectAtIndex:indexPath.row]]isEqualToString:@"Contact Us"]){
        [checkBox setImage:[UIImage imageNamed:@"ic_contact_us"] forState:UIControlStateNormal];
    }else{
      [checkBox setImage:[UIImage imageNamed:@"ic_cat"] forState:UIControlStateNormal];
    }
    
    UILabel   * menuList=[UILabel new];
    menuList.tag=2;
    menuList.backgroundColor=[UIColor whiteColor];
    menuList.frame=CGRectMake(38,15, 300, 20);
    
    menuList.text= [NSString stringWithFormat:@"%@",[_listofMenuItems objectAtIndex:indexPath.row]];
    
    if ([cell.contentView viewWithTag:1] || [cell.contentView viewWithTag:2])
    {
        [[cell.contentView viewWithTag:1]removeFromSuperview];
        [[cell.contentView viewWithTag:2]removeFromSuperview];
    }
    [cell.contentView addSubview:menuList];
    [cell.contentView addSubview:checkBox];
    return cell;
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *destTVC = nil;
    MultiSupportWebViewController *multisupportView=nil;
    ViewController *MenuDetailsViewController=nil;
    switch (indexPath.row) {
        case 0:
            MenuDetailsViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
            MenuDetailsViewController.categoryID = [_topListofMenuItemsID objectAtIndex:indexPath.row];
            [self.sideMenuController setContentViewController:MenuDetailsViewController];
            break;
        case 1:
            MenuDetailsViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
            MenuDetailsViewController.categoryID = [_topListofMenuItemsID objectAtIndex:indexPath.row];
            [self.sideMenuController setContentViewController:MenuDetailsViewController];
            break;
        case 2:
            MenuDetailsViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
            MenuDetailsViewController.categoryID = [_topListofMenuItemsID objectAtIndex:indexPath.row];
            [self.sideMenuController setContentViewController:MenuDetailsViewController];
            break;
        case 3:
            MenuDetailsViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
            MenuDetailsViewController.categoryID = [_topListofMenuItemsID objectAtIndex:indexPath.row];
            [self.sideMenuController setContentViewController:MenuDetailsViewController];
            break;
        case 4:
            MenuDetailsViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
            MenuDetailsViewController.categoryID = [_topListofMenuItemsID objectAtIndex:indexPath.row];
            [self.sideMenuController setContentViewController:MenuDetailsViewController];
            break;
        case 5:
            MenuDetailsViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
            MenuDetailsViewController.categoryID = [_topListofMenuItemsID objectAtIndex:indexPath.row];
            [self.sideMenuController setContentViewController:MenuDetailsViewController];
            break;
        case 6:
            destTVC = [storyboard instantiateViewControllerWithIdentifier:@"zhContactUsViewController"];[self.sideMenuController setContentViewController:destTVC];
            break;
        case 7:
            destTVC = [storyboard instantiateViewControllerWithIdentifier:@"zhContactUsViewController"];
            [self.sideMenuController setContentViewController:destTVC];
            break;
        case 8:
            destTVC = [storyboard instantiateViewControllerWithIdentifier:@"zhContactUsViewController"];
            break;
        case 9:
            destTVC = [storyboard instantiateViewControllerWithIdentifier:@"zhContactUsViewController"];
            [self.sideMenuController setContentViewController:destTVC];
            break;
        case 10:
            destTVC = [storyboard instantiateViewControllerWithIdentifier:@"zhContactUsViewController"];
            [self.sideMenuController setContentViewController:destTVC];
            break;
        case 11:
            multisupportView = [storyboard instantiateViewControllerWithIdentifier:@"MultiSupportWebViewController"];
            multisupportView.pageUrl                = @"https://www.zohukum.com/mobile-latest-news.html";
            multisupportView.navigationTittleString = @"latest-news";
            [self.sideMenuController setContentViewController:multisupportView];
            break;
        case 12:
            multisupportView = [storyboard instantiateViewControllerWithIdentifier:@"MultiSupportWebViewController"];
            multisupportView.pageUrl                = @"https://www.zohukum.com/mobile-how-it-works.html";
            multisupportView.navigationTittleString = @"How it works";
            [self.sideMenuController setContentViewController:multisupportView];
            break;
        case 13:
            multisupportView = [storyboard instantiateViewControllerWithIdentifier:@"MultiSupportWebViewController"];
            multisupportView.pageUrl                = @"https://www.zohukum.com/mobile-shipping-return.html";
            multisupportView.navigationTittleString = @"Shipping and returns";
            [self.sideMenuController setContentViewController:multisupportView];
            break;
        case 14:
            multisupportView = [storyboard instantiateViewControllerWithIdentifier:@"MultiSupportWebViewController"];
            multisupportView.pageUrl                = @"https://www.zohukum.com/mobile-Privacy-Policy-7.html";
            multisupportView.navigationTittleString = @"Privacy Policy";
            [self.sideMenuController setContentViewController:multisupportView];
            break;
        case 15:
            multisupportView = [storyboard instantiateViewControllerWithIdentifier:@"MultiSupportWebViewController"];
            multisupportView.pageUrl                = @"https://www.zohukum.com/mobile-Terms-and-Conditions-5.html";
            multisupportView.navigationTittleString = @"Terms & Condition";
            [self.sideMenuController setContentViewController:multisupportView];
            break;
        case 16:
            multisupportView = [storyboard instantiateViewControllerWithIdentifier:@"MultiSupportWebViewController"];
            multisupportView.pageUrl                = @"https://www.zohukum.com/mobile-faq.html";
            multisupportView.navigationTittleString = @"Frequently asked question";
            [self.sideMenuController setContentViewController:multisupportView];
            break;
        case 17:
            exit(0);
            break;
        default:
            destTVC = [storyboard instantiateViewControllerWithIdentifier:@"ViewController2"];
            [self.sideMenuController setContentViewController:destTVC];
            break;
    }
    //[self.sideMenuController setContentViewController:multisupportView];

    //
}

@end
