//
//  ZHMainViewController.m
//  ObjCExample
//
//  Created by chetu on 7/1/16.
//  Copyright © 2016 Evgeny Nazarov. All rights reserved.
//

#import "ZHMainViewController.h"
#import "zoHukum-Swift.h"
#import "zoHukumHeaderCell.h"
#import "zoHukumButtomCell.h"
#import "zoHukumCenterCell.h"
#import "RadioButton.h"
#import "zHSellerLoginView.h"
#import "zHBuyersLoginView.h"
#import "zhRegisterationViewController.h"


@interface ZHMainViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIBarButtonItem *searchItem;
@property (nonatomic, strong) UISearchBar *searchBar;
@property(nonatomic,strong)IBOutlet UIScrollView *scrollview;
@property(nonatomic,strong)IBOutlet UIScrollView *scrollVie;
@property(strong,nonatomic) UINavigationBar *navigationBar;

@end

@implementation ZHMainViewController
@synthesize scrollVie;



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate=self;
    self.tableView.delegate=self;
    [self.tableView reloadData];
    [self.navigationController.navigationBar setHidden:NO];
    self.title =@"ZOHUKUM";
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;

    
    self.sideMenuBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [self.sideMenuBtn setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [self.sideMenuBtn addTarget:self action:@selector(toggleSideMenuView) forControlEvents:UIControlEventTouchUpInside];
    
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
    
    
    
//    NSMutableArray *btnArray = [[NSMutableArray alloc]initWithObjects:@"Offer Message",@"Address",@"City",@"Zip",@"Postal Office", nil];
//    int scrollWidth = 100;
//    int xOffset = 0;
//    
//    for(int index=0; index < btnArray.count; index++)
//    {
//        if(index==0){
//            UILabel *headerlblTop = [[UILabel alloc] initWithFrame:CGRectMake(xOffset,10,300, 30)];
//            headerlblTop.text = [btnArray objectAtIndex:index];
//            headerlblTop.textAlignment=NSTextAlignmentCenter;
//            headerlblTop.textColor=[UIColor whiteColor];
//            
//            headerlblTop.backgroundColor=[UIColor brownColor];
//            [scrollVie addSubview:headerlblTop];
//            xOffset+=headerlblTop.frame.size.width;
//        }else{
//            UILabel *headerlbl = [[UILabel alloc] initWithFrame:CGRectMake(xOffset,10,160, 30)];
//            headerlbl.text = [btnArray objectAtIndex:index];
//            headerlbl.textAlignment=NSTextAlignmentCenter;
//            headerlbl.textColor=[UIColor whiteColor];
//            
//            headerlbl.backgroundColor=[UIColor brownColor];
//            [scrollVie addSubview:headerlbl];
//            xOffset+=100;
//            
//        }
//    }
//    int yIndex=40;
//    int xIndex=0;
//    for(int i=0;i<1;i++){
//        for(int index2=0; index2 < btnArray.count; index2++)
//        {
//            if(index2==0){
//                UILabel *headerlblTop2 = [[UILabel alloc] initWithFrame:CGRectMake(xIndex,yIndex,300, 30)];
//                headerlblTop2.text = [btnArray objectAtIndex:index2];
//                headerlblTop2.textAlignment=NSTextAlignmentCenter;
//                headerlblTop2.textColor=[UIColor whiteColor];
//                
//                headerlblTop2.backgroundColor=[UIColor orangeColor];
//                [scrollVie addSubview:headerlblTop2];
//                xIndex+=headerlblTop2.frame.size.width;
//            }else{
//                UILabel *headerlbl2 = [[UILabel alloc] initWithFrame:CGRectMake(xIndex,yIndex,160, 30)];
//                headerlbl2.text = [btnArray objectAtIndex:index2];
//                headerlbl2.textAlignment=NSTextAlignmentCenter;
//                headerlbl2.textColor=[UIColor whiteColor];
//                
//                headerlbl2.backgroundColor=[UIColor orangeColor];
//                [scrollVie addSubview:headerlbl2];
//                xIndex+=100;
//                
//            }
//        }
//        xIndex=0;
//         yIndex +=31;
//    }
//    [_scrollview addSubview:scrollVie];
//    scrollVie.contentSize = CGSizeMake(scrollWidth+xOffset-35,161);
//
//    _scrollview.contentSize = CGSizeMake(self.view.frame.size.width,900);
    
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



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView; {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(indexPath.row==0){
        static NSString *CellIdentifier = @"HeaderCell";
        zoHukumHeaderCell *cell=nil;
        cell = (zoHukumHeaderCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
        if (cell == nil)
        {
            cell = [[zoHukumHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
        }
        [cell.buyerbtn addTarget:self action:@selector(buyer:) forControlEvents:UIControlEventTouchUpInside];
        [cell.sellerbtn addTarget:self action:@selector(seller:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
        
    }else if (indexPath.row==1) {
        
        static NSString *CellIdentifier = @"CenterCell";
        zoHukumCenterCell *cells=nil;
        cells = (zoHukumCenterCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
        if (cells == nil)
        {
            cells = [[zoHukumCenterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
        }
        [cells.retailerbtn addTarget:self action:@selector(retailer:) forControlEvents:UIControlEventTouchUpInside];
        [cells.manufacturerbtn addTarget:self action:@selector(manufacturer:) forControlEvents:UIControlEventTouchUpInside];
        [cells.brandOwner addTarget:self action:@selector(brandOwner:) forControlEvents:UIControlEventTouchUpInside];
        [cells.distributerbtn addTarget:self action:@selector(distributor:) forControlEvents:UIControlEventTouchUpInside];
        return cells;
    }else{
        static NSString *CellIdentifier = @"ButtomCell";
        zoHukumButtomCell *cells=nil;
        cells = (zoHukumButtomCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
        if (cells == nil)
        {
            cells = [[zoHukumButtomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
        }
        [cells.loginbtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
        [cells.registerationBtn addTarget:self action:@selector(registeration:) forControlEvents:UIControlEventTouchUpInside];

        
        return cells;
    }
    
}

-(IBAction)buyer:(id)sender{
    zHBuyersLoginView *sellerlogin = [self.storyboard instantiateViewControllerWithIdentifier:@"zHBuyersLoginView"];
    [self.navigationController pushViewController:sellerlogin animated:YES];
}
-(void)seller:(id)sender{
    
    zHSellerLoginView *sellerlogin = [self.storyboard instantiateViewControllerWithIdentifier:@"zHSellerLoginView"];
    [self.navigationController pushViewController:sellerlogin animated:YES];
}
-(void)retailer:(id)sender{
    zHSellerLoginView *sellerlogin = [self.storyboard instantiateViewControllerWithIdentifier:@"zHSellerLoginView"];
    [self.navigationController pushViewController:sellerlogin animated:YES];
}
-(void)distributor:(id)sender{
    zHSellerLoginView *sellerlogin = [self.storyboard instantiateViewControllerWithIdentifier:@"zHSellerLoginView"];
    [self.navigationController pushViewController:sellerlogin animated:YES];
}
-(void)manufacturer:(id)sender{
    zHSellerLoginView *sellerlogin = [self.storyboard instantiateViewControllerWithIdentifier:@"zHSellerLoginView"];
    [self.navigationController pushViewController:sellerlogin animated:YES];
}
-(void)brandOwner:(id)sender{
    zHSellerLoginView *sellerlogin = [self.storyboard instantiateViewControllerWithIdentifier:@"zHSellerLoginView"];
    [self.navigationController pushViewController:sellerlogin animated:YES];
}


-(void)login:(id)sender{
    zHSellerLoginView *sellerlogin = [self.storyboard instantiateViewControllerWithIdentifier:@"zHSellerLoginView"];
    [self.navigationController pushViewController:sellerlogin animated:YES];
    
}
-(void)registeration:(id)sender{
    
    zhRegisterationViewController *storeRegisteration = [self.storyboard instantiateViewControllerWithIdentifier:@"zhRegisterationViewController"];
    storeRegisteration.registerationType = @"CompanyRegisteration";
    [self.navigationController pushViewController:storeRegisteration animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0){
        return 142;
    }else if (indexPath.row==1){
        return 174;
    }else{
        return 126;
    }
}




-(IBAction)onRadioBtn:(RadioButton*)sender
{
    _statusLabel.text = [NSString stringWithFormat:@"Selected: %@", sender.titleLabel.text];
    NSLog(@"%@", _statusLabel.text);
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma Mark RadioButton-


- (IBAction)retailerBtn:(id)sender {
    
    _retalerBtn =(UIButton *)sender;
    if (![_retalerBtn isSelected]) {
        [_retalerBtn setSelected:YES];
        [_retalerBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    }
    else if ([_retalerBtn isSelected]) {
        [_retalerBtn setImage:[UIImage imageNamed:@"unchecked"]
                   forState:UIControlStateNormal];
        
        [_retalerBtn setSelected:NO];
    }

}
- (IBAction)wholesaleBtn:(id)sender {
    _wholesaleBtn =(UIButton *)sender;
    if (![_wholesaleBtn isSelected]) {
        [_wholesaleBtn setSelected:YES];
        [_wholesaleBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    }
    else if ([_wholesaleBtn isSelected]) {
        [_wholesaleBtn setImage:[UIImage imageNamed:@"unchecked"]
                     forState:UIControlStateNormal];
        
        [_wholesaleBtn setSelected:NO];
    }

}
- (IBAction)agreegationBtn:(id)sender {
    
    _agreegationBtn =(UIButton *)sender;
    if (![_agreegationBtn isSelected]) {
        [_agreegationBtn setSelected:YES];
        [_agreegationBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    }
    else if ([_agreegationBtn isSelected]) {
        [_agreegationBtn setImage:[UIImage imageNamed:@"unchecked"]
                       forState:UIControlStateNormal];
        
        [_agreegationBtn setSelected:NO];
    }

}
@end
