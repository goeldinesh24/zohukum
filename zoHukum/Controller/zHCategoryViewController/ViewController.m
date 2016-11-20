//
//  ViewController.m
//  ObjCPlayStand
//
//  Created by vivek on 05/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import "ViewController.h"
#import "MMContainerViewController.h"
#import "zoHukum-Swift.h"
#import "MMTableViewController.h"
#import "MBProgressHUD.h"
#import "MMCollectionViewController.h"
#import "TWMessageBarManager.h"
#import "QueryDetailsViewController.h"


@interface ViewController ()<UISearchBarDelegate>{
    NSMutableArray *arrCont;
    NSMutableDictionary *mainDesc;
    int menuCount;
}
@property (nonatomic , strong ) MMContainerViewController *containerVC;
@property (nonatomic, strong) UIBarButtonItem *searchItem;
@property (nonatomic, strong) UISearchBar *searchBar;
@property(strong,nonatomic) UINavigationBar *navigationBar;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIButton *sideMenuBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController.navigationBar setHidden:NO];
    self.title =@"ZOHUKUM";
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    int userID = [[[NSUserDefaults standardUserDefaults]valueForKey:@"USER_ID"] intValue];
    if(userID>0){
        self.sideMenuBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [self.sideMenuBtn setImage:[UIImage imageNamed:@"arrow-left"] forState:UIControlStateNormal];
        [self.sideMenuBtn addTarget:self action:@selector(backViewController) forControlEvents:UIControlEventTouchUpInside];
        
    }else{
        self.sideMenuBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [self.sideMenuBtn setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
        [self.sideMenuBtn addTarget:self action:@selector(toggleSideMenuView) forControlEvents:UIControlEventTouchUpInside];
        
    }
    UIBarButtonItem *toggleButton = [[UIBarButtonItem alloc] initWithCustomView:_sideMenuBtn];
    self.navigationItem.rightBarButtonItem = toggleButton;
    [self.navigationItem setLeftBarButtonItem:toggleButton];
    
    
    self.searchButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [self.searchButton setImage:[UIImage imageNamed:@"wh_search"] forState:UIControlStateNormal];
    [_searchButton addTarget:self action:@selector(searchButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    self.searchItem = [[UIBarButtonItem alloc] initWithCustomView:_searchButton];
    self.navigationItem.rightBarButtonItem = _searchItem;
    
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.barTintColor = [UIColor redColor];
    _searchBar.showsCancelButton = YES;
    _searchBar.delegate = self;

    menuCount = 0;
    mainDesc = [NSMutableDictionary new];
    [self getSubcategory:_categoryName];
    arrCont = [NSMutableArray new];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"updateCartProduct"
                                               object:nil];
    
}

- (void) receiveTestNotification:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    // NSDictionary *userInfo = notification.userInfo;
    NSDictionary *userInfo =   [(NSDictionary*)notification.object valueForKey:@"updateCartProductDetails"];
    NSLog(@"%@",userInfo);
    _marketPrice.text = [NSString stringWithFormat:@"Rs.%@",[userInfo valueForKey:@"Total_market_price"]];
    _productQuantity.text = [NSString stringWithFormat:@"Quantity : %@",[userInfo valueForKey:@"Total_qty"]];
    dispatch_async(dispatch_get_main_queue(), ^{
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:[userInfo valueForKey:@"message"] description:nil type:TWMessageBarMessageTypeSuccess statusBarStyle:[UIApplication sharedApplication].statusBarStyle callback:nil];
    });
    
}

-(void)backViewController{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [UIView animateWithDuration:0.2f animations:^{
        _searchBar.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.navigationItem.titleView = nil;
        self.navigationItem.rightBarButtonItem = _searchItem;
        _searchButton.alpha = 0.0;  // set this *after* adding it back
        [UIView animateWithDuration:0.2f animations:^ {
            _searchButton.alpha = 1.0;
        }];
    }];
    
}
- (void)searchButtonTapped:(id)sender {
    
    [UIView animateWithDuration:0.0 animations:^{
        _searchButton.alpha = 0.0f;
        
    } completion:^(BOOL finished) {
        
        // remove the search button
        self.navigationItem.rightBarButtonItem = nil;
        // add the search bar (which will start out hidden).
        self.navigationItem.titleView = _searchBar;
        _searchBar.alpha = 0.0;
        for (UIView *view in _searchBar.subviews)
        {
            for (id subview in view.subviews)
            {
                if ( [subview isKindOfClass:[UIButton class]] )
                {
                    UIButton* cancelBtn = (UIButton*)subview;
                    cancelBtn.frame=CGRectMake(0, 0, 30, 30);
                    [cancelBtn setTitle:@"" forState:UIControlStateNormal];
                    [cancelBtn setImage:[UIImage imageNamed:@"crossSearch"] forState:UIControlStateNormal];
                    [cancelBtn setEnabled:YES];
                    break;
                }
            }
        }
        
        UITextField *txfSearchField = [_searchBar valueForKey:@"_searchField"];
        [txfSearchField setTextColor:[UIColor whiteColor]];
        [txfSearchField setFont:[UIFont fontWithName:@"System" size:22]];
        txfSearchField.placeholder=@"Product/Category...";
        [txfSearchField setBackgroundColor:[UIColor clearColor]];
        
        [UIView animateWithDuration:0.0
                         animations:^{
                             _searchBar.alpha = 1.0;
                         } completion:^(BOOL finished) {
                             [_searchBar becomeFirstResponder];
                         }];
        
    }];
}

-(void)getSubcategory:(NSString *)type{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading..";
    if([type isEqualToString:@"Special Brands"]){
        NSMutableDictionary *sendtoServerzGetSubCategoryRequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_special_brand",@"section", nil];
        [APIManager apiManager].delegate = self;
        [[APIManager apiManager] GetSpecialBrandDetailsbyCatIDSendToServer:sendtoServerzGetSubCategoryRequestData];
        
    }else{
        NSMutableDictionary *sendtoServerzGetSubCategoryRequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_sub_category",@"section",_categoryID,@"category", nil];
        [APIManager apiManager].delegate = self;
        [[APIManager apiManager] GetSubCategoryDetailsbyCatIDSendToServer:sendtoServerzGetSubCategoryRequestData];

    }
}

-(void)getSubCategoryProduct:(NSMutableDictionary*)response{
    if([_categoryName isEqualToString:@"Special Brands"]){
        NSMutableArray *subCategoryMenu      =  [response valueForKey:@"value"];
        [[NSUserDefaults standardUserDefaults]setObject:subCategoryMenu forKey:@"subCatMenulist"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        NSMutableArray *subCategoryMenuID    =  [response valueForKey:@"id"];
        for(int subCatID =0 ; subCatID<subCategoryMenuID.count ; subCatID++){
            NSMutableDictionary *sendtoServerzGetSubCategoryProductRequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_sub_category_product",@"section",[NSString stringWithFormat:@"%@",[subCategoryMenuID objectAtIndex:subCatID]],@"sub_cat_id", nil];
            [APIManager apiManager].delegate = self;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [[APIManager apiManager] GetSubCategoryProductDetailsbySubCatIDSendToServer:sendtoServerzGetSubCategoryProductRequestData];
            });
        }

    }else{
        NSMutableArray *subCategoryMenu      =  [response valueForKey:@"sub_category"];
        [[NSUserDefaults standardUserDefaults]setObject:subCategoryMenu forKey:@"subCatMenulist"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        NSMutableArray *subCategoryMenuID    =  [response valueForKey:@"id"];
        for(int subCatID =0 ; subCatID<subCategoryMenuID.count ; subCatID++){
            NSMutableDictionary *sendtoServerzGetSubCategoryProductRequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_sub_category_product",@"section",[NSString stringWithFormat:@"%@",[subCategoryMenuID objectAtIndex:subCatID]],@"sub_cat_id", nil];
            [APIManager apiManager].delegate = self;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [[APIManager apiManager] GetSubCategoryProductDetailsbySubCatIDSendToServer:sendtoServerzGetSubCategoryProductRequestData];
            });
        }
 
    }
    

}
-(void)CreatesubcategoryMenulist:(NSMutableDictionary *)response andmenuCount:(int)Count{
    
    NSMutableArray *responseDictionary = [[NSUserDefaults standardUserDefaults]valueForKey:@"subCatMenulist"];

    MMTableViewController *vc_one;
    vc_one = [self.storyboard instantiateViewControllerWithIdentifier:@"demo"];
    vc_one.title =[responseDictionary objectAtIndex:Count];
    vc_one.tittleTxt= _categoryName;
    vc_one.logoColor = @"4caf50";
    vc_one.logoImage = @"highlights";
    vc_one.subCatMenuDetailsDesc=response;
    [arrCont addObject:vc_one];
        
    if(Count==(responseDictionary.count)-1){
         [MBProgressHUD hideHUDForView:self.view animated:YES];
        self.containerVC = [[MMContainerViewController alloc] initWithControllers:[arrCont mutableCopy] parentViewController:self];
        for (MMTableViewController*vc in arrCont) {
            if ([vc isKindOfClass: [MMTableViewController class]]){
                vc.scrolldeleagte = self.containerVC ;
            }
        }
        self.containerVC.itemViewColorArray = @[@"4caf50",@"009688",@"673ab7",@"ff9800",@"9c27b0"];
        self.containerVC.menuItemFont = [UIFont fontWithName:@"Roboto-Medium" size:15];
        self.containerVC.menuIndicatorColor = [UIColor whiteColor];
        [self.view addSubview:self.containerVC.view];
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-130, self.view.frame.size.height-130, 50, 50)];
        button.backgroundColor =[UIColor redColor];
        button.layer.cornerRadius =button.frame.size.width/2;
        button.layer.masksToBounds = YES;
        [self.view addSubview:button];
        UIButton *testbutton = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
        testbutton.backgroundColor =[UIColor redColor];
        [testbutton setImage:[UIImage imageNamed:@"filter_icon"] forState:UIControlStateNormal];
        [testbutton addTarget:self action:@selector(createPopUpView:) forControlEvents:UIControlEventTouchUpInside];
        [button addSubview:testbutton];
        [self.view addSubview:button];
    }
    
}

-(void)getResponse:(NSMutableDictionary *)response serviceIdentifier:(NSString *)serviceIdentifier {
    if([serviceIdentifier isEqualToString:kAPIkeyGetSubCategory]){
         dispatch_async(dispatch_get_main_queue(), ^{
             
             [self getSubCategoryProduct:response];
             
         });
    }else if ([serviceIdentifier isEqualToString:kAPIkeyGetSubCategoryProduct]){
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self CreatesubcategoryMenulist:response andmenuCount:menuCount];
            menuCount++;
        });
    }if([serviceIdentifier isEqualToString:kAPIkeyGetSpecialBrand]){
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self getSubCategoryProduct:response];
            
        });
    }if([serviceIdentifier isEqualToString:kAPIkeyCartDetails]){
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:[response mutableCopy]forKey:@"updateCartProductDetails"];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"updateCartProduct" object:userInfo];
            
        });
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    int userID = [[[NSUserDefaults standardUserDefaults]valueForKey:@"USER_ID"] intValue];
    
    NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]init];
    [sendtoserverrequestData setObject:@"cart_detail" forKey:@"section"];
    [sendtoserverrequestData setObject:[NSString stringWithFormat:@"%d",userID] forKey:@"user_id"];
    [APIManager apiManager].delegate = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [[APIManager apiManager] CartProductaDetailsfromServer:sendtoserverrequestData];
    });

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
