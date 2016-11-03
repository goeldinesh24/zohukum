//
//  zhRegisterationViewController.m
//  zoHukum
//
//  Created by Vivek on 06/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import "zhRegisterationViewController.h"
#import "CustomContactCell.h"
#import "CustomTextFieldCell.h"
#import "DropDownTableViewCell.h"
#import "NIDropDown.h"
#import "QuartzCore/QuartzCore.h"
#import "zoHukum-Swift.h"
#import "DOBandGenderCell.h"
#import "RegisterationBottomCell.h"
#import "APIManager.h"
#import "MBProgressHUD.h"

@interface zhRegisterationViewController ()<WWCalendarTimeSelectorProtocol>
{
    NSMutableArray      *registerationPagefield;
    NSMutableDictionary *registerationPageValue;
    NSMutableArray      *registerationPagefieldStore;
    NSMutableArray      *getCityArray;
    NSMutableArray      *getStateArray;
    NSMutableArray      *getStateIDArray;
    NSMutableArray      *getPostOfficeArray;
    NSMutableArray      *getZipCodeArray;
    NSMutableArray      *getMainCatArray;
    NSMutableArray      *getMainCatIDArray;
    NSMutableArray      *getSubCatProductArray;
    NSMutableArray      *getBuyerCategoryArray;
    NSMutableArray      *getBuyerCategoryIDArray;
    NSMutableArray      *getSubCatIDArray;
    NSMutableArray      *subCategoryMenu;
    BOOL                isFirstTime;
    UIButton *selectedBtnText;

}
@property(strong,nonatomic) WWCalendarTimeSelector *popUpCalender;
@end

@implementation zhRegisterationViewController
@synthesize registerationTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    getStateArray         = [NSMutableArray new];
    getStateIDArray       = [NSMutableArray new];
    getCityArray          = [NSMutableArray new];
    getPostOfficeArray    = [NSMutableArray new];
    getZipCodeArray       = [NSMutableArray new];
    isFirstTime           = true;
    registerationTableView.dataSource = self;
    registerationTableView.delegate   = self;
    registerationPageValue = [NSMutableDictionary new];
   
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
        registerationPagefieldStore = [[NSMutableArray alloc]initWithObjects:@"Choose type",@"Main category",@"Sub category",@"First name",@"Last name",@"Email id",@"Choose password",@"Re-enter password",@"Choose state",@"Choose city",@"Post office",@"Choose ZIP",@"Street Address",@"Land mark",@"Choose DOB",@"Gender",@"Mobile no.",@"Otp", nil];
    }else if ([self.registerationType isEqualToString:@"CompanyRegisteration"]){
        registerationPagefield = [[NSMutableArray alloc]initWithObjects:@"First name",@"Last name",@"Email id",@"Choose password",@"Re-enter password",@"Company registeration",@"Choose state",@"Choose city",@"Post office",@"Choose ZIP",@"Street Address",@"Land mark",@"Choose DOB",@"Gender",@"Mobile no.",@"Otp", nil];
    }else{
        registerationPagefield = [[NSMutableArray alloc]initWithObjects:@"Choose Type",@"First name",@"Last name",@"Email id",@"Choose password",@"Re-enter password",@"Choose state",@"Choose city",@"Post office",@"Choose ZIP",@"Street Address",@"Land mark",@"Choose DOB",@"Gender",@"Mobile no.",@"Otp", nil];
    }
    
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
        for(int index = 0 ; index < registerationPagefieldStore.count ; index ++){
            if(index==14 || index==0||index==1 ||index==2 ||index==8 || index==9 || index==10 || index==11){
                if(index == 14){
                    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    NSDateComponents *offset = [[NSDateComponents alloc] init];
                    [offset setYear:-19];
                    NSDate *offsetedDate = [calendar dateByAddingComponents:offset toDate:[NSDate date] options:0];
                    NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
                    dateformatter.dateFormat = @"dd-MM-yyyy";
                    NSString *seklectedDate = [dateformatter stringFromDate:offsetedDate];
                    [registerationPageValue setValue:seklectedDate forKey:[registerationPagefieldStore objectAtIndex:index]];
                }else{
                    [registerationPageValue setValue:@"Select" forKey:[registerationPagefieldStore objectAtIndex:index]];
                }
               
            }else{
                [registerationPageValue setValue:@"" forKey:[registerationPagefieldStore objectAtIndex:index]];
            }
            
        }
    }else if ([self.registerationType isEqualToString:@"CompanyRegisteration"]){
    
        for(int index = 0 ; index < registerationPagefield.count ; index ++){
            
            if(index == 12 || index == 9 ||index == 6 ||index == 7 ||index == 8){
                if(index == 12 ){
                    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    NSDateComponents *offset = [[NSDateComponents alloc] init];
                    [offset setYear:-19];
                    NSDate *offsetedDate = [calendar dateByAddingComponents:offset toDate:[NSDate date] options:0];
                    NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
                    dateformatter.dateFormat = @"dd-MM-yyyy";
                    NSString *seklectedDate = [dateformatter stringFromDate:offsetedDate];
                    [registerationPageValue setValue:seklectedDate forKey:[registerationPagefield objectAtIndex:index]];
                }else{
                    [registerationPageValue setValue:@"Select" forKey:[registerationPagefield objectAtIndex:index]];
                }
            }else{
                [registerationPageValue setValue:@"" forKey:[registerationPagefield objectAtIndex:index]];
            }
            
        }

    
    }else if ([self.registerationType isEqualToString:@"BuyerRegisteration"]){
        
        for(int index = 0 ; index < registerationPagefield.count ; index ++){
            
            if(index == 12 || index == 9 ||index == 6 ||index == 7 ||index == 8 || index == 0){
                if(index == 12){
                    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    NSDateComponents *offset = [[NSDateComponents alloc] init];
                    [offset setYear:-19];
                    NSDate *offsetedDate = [calendar dateByAddingComponents:offset toDate:[NSDate date] options:0];
                    NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
                    dateformatter.dateFormat = @"dd-MM-yyyy";
                    NSString *seklectedDate = [dateformatter stringFromDate:offsetedDate];
                    [registerationPageValue setValue:seklectedDate forKey:[registerationPagefield objectAtIndex:index]];
                }else{
                    [registerationPageValue setValue:@"Select" forKey:[registerationPagefield objectAtIndex:index]];
                }
            }else{
                [registerationPageValue setValue:@"" forKey:[registerationPagefield objectAtIndex:index]];
            }
            
        }
    }else{
        for(int index = 0 ; index < registerationPagefield.count ; index ++){
            
            if(index == 11 || index == 5 ||index == 6 ||index == 7 ||index == 8){
                if(index == 11){
                    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    NSDateComponents *offset = [[NSDateComponents alloc] init];
                    [offset setYear:-19];
                    NSDate *offsetedDate = [calendar dateByAddingComponents:offset toDate:[NSDate date] options:0];
                    NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
                    dateformatter.dateFormat = @"dd-MM-yyyy";
                    NSString *seklectedDate = [dateformatter stringFromDate:offsetedDate];
                    [registerationPageValue setValue:seklectedDate forKey:[registerationPagefield objectAtIndex:index]];
                }else{
                    [registerationPageValue setValue:@"Select" forKey:[registerationPagefield objectAtIndex:index]];
                }
            }else{
               [registerationPageValue setValue:@"" forKey:[registerationPagefield objectAtIndex:index]];
            }
        }
    }
    
    
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
        [registerationPageValue setValue:@"Male" forKey:[registerationPagefieldStore objectAtIndex:15]];
        
    }else if ([self.registerationType isEqualToString:@"CompanyRegisteration"] || [self.registerationType isEqualToString:@"BuyerRegisteration"]){
        [registerationPageValue setValue:@"Male" forKey:[registerationPagefield objectAtIndex:13]];
    }else{
        [registerationPageValue setValue:@"Male" forKey:[registerationPagefield objectAtIndex:12]];
    }
    
    [registerationPageValue setValue:[_userInfoFromResponse valueForKey:@""] forKey:@""];
    [registerationPageValue setValue:[_userInfoFromResponse valueForKey:@""] forKey:@""];
    [registerationPageValue setValue:[_userInfoFromResponse valueForKey:@""] forKey:@""];
    [registerationPageValue setValue:[_userInfoFromResponse valueForKey:@""] forKey:@""];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
       return 16;
    }else if([self.registerationType isEqualToString:@"CompanyRegisteration"]){
        return 14;
    }else if([self.registerationType isEqualToString:@"BuyerRegisteration"]){
        return 14;
    }else{
       return 13;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        if([self.registerationType isEqualToString:@"StoreRegisteration"]){
        if(indexPath.row<3){
            static NSString *CellIdentifier = @"cells";
            DropDownTableViewCell *cells=nil;
            cells = (DropDownTableViewCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
            if (cells == nil)
            {
                cells = [[DropDownTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cells.addressValue.tag=indexPath.row;
            [cells.addressValue addTarget:self action:@selector(selectAddress:) forControlEvents:UIControlEventTouchUpInside];
            cells.fullAddress.text=[NSString stringWithFormat:@"%@:",[registerationPagefieldStore objectAtIndex:indexPath.row]];
            [cells.addressValue setTitle:[registerationPageValue valueForKey:[registerationPagefieldStore objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
            return cells;

        }else if (indexPath.row>=3 && indexPath.row<8) {
            
            static NSString *CellIdentifier = @"cell";
            CustomTextFieldCell *cells=nil;
            cells = (CustomTextFieldCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
            if (cells == nil)
            {
                cells = [[CustomTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cells.userDetailsTxt.delegate=self;
            cells.userDetailsTxt.layer.borderColor=[[UIColor clearColor]CGColor];
            cells.userDetailsTxt.placeholder=[registerationPagefieldStore objectAtIndex:indexPath.row];
            cells.userDetailsTxt.text =[registerationPageValue valueForKey:[registerationPagefieldStore objectAtIndex:indexPath.row]];
            cells.userDetailsTxt.floatingPlaceholderEnabled=YES;
            cells.userDetailsTxt.floatingLabelBottomMargin=8;
            cells.userDetailsTxt.bottomBorderEnabled=YES;
            cells.userDetailsTxt.tag=indexPath.row;
            return cells;
        }else if(indexPath.row>=8 && indexPath.row<12){
            static NSString *CellIdentifier = @"cells";
            DropDownTableViewCell *cells=nil;
            cells = (DropDownTableViewCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
            if (cells == nil)
            {
                cells = [[DropDownTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cells.addressValue.tag=indexPath.row;
            [cells.addressValue addTarget:self action:@selector(selectAddress:) forControlEvents:UIControlEventTouchUpInside];
            cells.fullAddress.text=[NSString stringWithFormat:@"%@:",[registerationPagefieldStore objectAtIndex:indexPath.row]];
            [cells.addressValue setTitle:[registerationPageValue valueForKey:[registerationPagefieldStore objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
            return cells;
            
        }else if(indexPath.row>=12 && indexPath.row<14){
            static NSString *CellIdentifier = @"cell";
            CustomTextFieldCell *cells=nil;
            cells = (CustomTextFieldCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
            if (cells == nil)
            {
                cells = [[CustomTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cells.userDetailsTxt.delegate=self;
            cells.userDetailsTxt.tag=indexPath.row;
            cells.userDetailsTxt.layer.borderColor=[[UIColor clearColor]CGColor];
            cells.userDetailsTxt.placeholder=[registerationPagefieldStore objectAtIndex:indexPath.row];
            cells.userDetailsTxt.text =[registerationPageValue valueForKey:[registerationPagefieldStore objectAtIndex:indexPath.row]];
            cells.userDetailsTxt.floatingPlaceholderEnabled=YES;
            cells.userDetailsTxt.floatingLabelFont=[UIFont fontWithName:@"System" size:4.0];
            cells.userDetailsTxt.floatingLabelBottomMargin=8;
            cells.userDetailsTxt.bottomBorderEnabled=YES;
            return cells;
        }else if(indexPath.row==14){
            static NSString *CellIdentifier = @"customCell";
            DOBandGenderCell *cells=nil;
            cells = (DOBandGenderCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
            if (cells == nil)
            {
                cells = [[DOBandGenderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cells.dobLbl.text    = [NSString stringWithFormat:@"%@:",[registerationPagefieldStore objectAtIndex:14]];
            cells.genderLbl.text = [NSString stringWithFormat:@"%@:",[registerationPagefieldStore objectAtIndex:15]];
            [cells.dobSelection setTitle:[registerationPageValue valueForKey:[registerationPagefieldStore objectAtIndex:14]] forState:UIControlStateNormal];
            [cells.genderSelectionM addTarget:self action:@selector(genderSelection:) forControlEvents:UIControlEventTouchUpInside];
            [cells.genderSelectionF addTarget:self action:@selector(genderSelection:) forControlEvents:UIControlEventTouchUpInside];
            [cells.dobSelection addTarget:self action:@selector(selectDOBfromCalender:) forControlEvents:UIControlEventTouchUpInside];
            return cells;
        }else{
            static NSString *CellIdentifier = @"customCells";
            RegisterationBottomCell *cells=nil;
            cells = (RegisterationBottomCell*) [registerationTableView dequeueReusableCellWithIdentifier:CellIdentifier];;
            if (cells == nil)
            {
                cells = [[RegisterationBottomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cells.mobilNo.delegate=self;
            cells.mobilNo.tag=indexPath.row;
            cells.mobilNo.placeholder = [registerationPagefieldStore objectAtIndex:16];
            cells.mobilNo.text =[registerationPageValue valueForKey:[registerationPagefieldStore objectAtIndex:16]];
            cells.Otptxt.delegate=self;
            cells.mobilNo.tag=indexPath.row;
            cells.Otptxt.placeholder  = [registerationPagefieldStore objectAtIndex:17];
            cells.Otptxt.text =[registerationPageValue valueForKey:[registerationPagefieldStore objectAtIndex:17]];
            cells.Otptxt.floatingPlaceholderEnabled=YES;
            cells.Otptxt.floatingLabelBottomMargin=8;
            cells.Otptxt.bottomBorderEnabled=YES;
            cells.mobilNo.floatingPlaceholderEnabled=YES;
            cells.mobilNo.floatingLabelBottomMargin=8;
            cells.mobilNo.bottomBorderEnabled=YES;
            [cells.otpSender addTarget:self action:@selector(generateOtp) forControlEvents:UIControlEventTouchUpInside];
            
            return cells;
        }

        }else if([self.registerationType isEqualToString:@"CompanyRegisteration"]){
            if (indexPath.row<6) {
                
                static NSString *CellIdentifier = @"cell";
                CustomTextFieldCell *cells=nil;
                cells = (CustomTextFieldCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
                if (cells == nil)
                {
                    cells = [[CustomTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
                cells.userDetailsTxt.delegate=self;
                cells.userDetailsTxt.layer.borderColor=[[UIColor clearColor]CGColor];
                cells.userDetailsTxt.placeholder=[registerationPagefield objectAtIndex:indexPath.row];
                cells.userDetailsTxt.text = [registerationPageValue valueForKey: [registerationPagefield objectAtIndex:indexPath.row]];
                cells.userDetailsTxt.floatingPlaceholderEnabled=YES;
                cells.userDetailsTxt.floatingLabelBottomMargin=8;
                cells.userDetailsTxt.bottomBorderEnabled=YES;
                cells.userDetailsTxt.tag=indexPath.row;
                return cells;
            }else if(indexPath.row>=6 && indexPath.row<10){
                static NSString *CellIdentifier = @"cells";
                DropDownTableViewCell *cells=nil;
                cells = (DropDownTableViewCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
                if (cells == nil)
                {
                    cells = [[DropDownTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
                cells.addressValue.tag=indexPath.row;
                [cells.addressValue addTarget:self action:@selector(selectAddress:) forControlEvents:UIControlEventTouchUpInside];
                cells.fullAddress.text=[NSString stringWithFormat:@"%@:",[registerationPagefield objectAtIndex:indexPath.row]];
                [cells.addressValue setTitle:[registerationPageValue valueForKey:[registerationPagefield objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
                return cells;
            }else if(indexPath.row>=10 && indexPath.row<12){
                static NSString *CellIdentifier = @"cell";
                CustomTextFieldCell *cells=nil;
                cells = (CustomTextFieldCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
                if (cells == nil)
                {
                    cells = [[CustomTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
                cells.userDetailsTxt.delegate=self;
                cells.userDetailsTxt.tag=indexPath.row;
                cells.userDetailsTxt.layer.borderColor=[[UIColor clearColor]CGColor];
                cells.userDetailsTxt.placeholder=[registerationPagefield objectAtIndex:indexPath.row];
                cells.userDetailsTxt.text = [registerationPageValue valueForKey: [registerationPagefield objectAtIndex:indexPath.row]];
                cells.userDetailsTxt.floatingPlaceholderEnabled=YES;
                cells.userDetailsTxt.floatingLabelFont=[UIFont fontWithName:@"System" size:4.0];
                cells.userDetailsTxt.floatingLabelBottomMargin=8;
                cells.userDetailsTxt.bottomBorderEnabled=YES;
                return cells;
            }else if(indexPath.row==12){
                static NSString *CellIdentifier = @"customCell";
                DOBandGenderCell *cells=nil;
                cells = (DOBandGenderCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
                if (cells == nil)
                {
                    cells = [[DOBandGenderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
                cells.dobLbl.text    = [NSString stringWithFormat:@"%@:",[registerationPagefield objectAtIndex:12]];
                cells.genderLbl.text = [NSString stringWithFormat:@"%@:",[registerationPagefield objectAtIndex:13]];
                [cells.dobSelection setTitle:[registerationPageValue valueForKey:[registerationPagefield objectAtIndex:12]] forState:UIControlStateNormal];
                [cells.genderSelectionM addTarget:self action:@selector(genderSelection:) forControlEvents:UIControlEventTouchUpInside];
                [cells.genderSelectionF addTarget:self action:@selector(genderSelection:) forControlEvents:UIControlEventTouchUpInside];
                [cells.dobSelection addTarget:self action:@selector(selectDOBfromCalender:) forControlEvents:UIControlEventTouchUpInside];
                return cells;
            }else{
                static NSString *CellIdentifier = @"customCells";
                RegisterationBottomCell *cells=nil;
                cells = (RegisterationBottomCell*) [registerationTableView dequeueReusableCellWithIdentifier:CellIdentifier];;
                if (cells == nil)
                {
                    cells = [[RegisterationBottomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
                cells.mobilNo.delegate=self;
                cells.mobilNo.tag=14;
                cells.mobilNo.placeholder = [registerationPagefield objectAtIndex:14];
                cells.mobilNo.text = [registerationPageValue valueForKey: [registerationPagefield objectAtIndex:14]];
                cells.Otptxt.delegate=self;
                cells.Otptxt.tag=15;
                cells.Otptxt.placeholder  = [registerationPagefield objectAtIndex:15];
                cells.Otptxt.text = [registerationPageValue valueForKey: [registerationPagefield objectAtIndex:15]];
                cells.Otptxt.floatingPlaceholderEnabled=YES;
                cells.Otptxt.floatingLabelBottomMargin=8;
                cells.Otptxt.bottomBorderEnabled=YES;
                cells.mobilNo.floatingPlaceholderEnabled=YES;
                cells.mobilNo.floatingLabelBottomMargin=8;
                cells.mobilNo.bottomBorderEnabled=YES;
                [cells.otpSender addTarget:self action:@selector(generateOtp) forControlEvents:UIControlEventTouchUpInside];
                return cells;
            }
            
        }else{
            
            if(indexPath.row == 0){
            static NSString *CellIdentifier = @"cells";
            DropDownTableViewCell *cells=nil;
            cells = (DropDownTableViewCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
            if (cells == nil)
            {
                cells = [[DropDownTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cells.addressValue.tag=indexPath.row;
            [cells.addressValue addTarget:self action:@selector(selectAddress:) forControlEvents:UIControlEventTouchUpInside];
            cells.fullAddress.text=[NSString stringWithFormat:@"%@:",[registerationPagefield objectAtIndex:indexPath.row]];
            [cells.addressValue setTitle:[registerationPageValue valueForKey:[registerationPagefield objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
            return cells;
            
            }else if (indexPath.row>0 && indexPath.row<6) {
                
                static NSString *CellIdentifier = @"cell";
                CustomTextFieldCell *cells=nil;
                cells = (CustomTextFieldCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
                if (cells == nil)
                {
                    cells = [[CustomTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
                cells.userDetailsTxt.delegate=self;
                cells.userDetailsTxt.layer.borderColor=[[UIColor clearColor]CGColor];
                cells.userDetailsTxt.placeholder=[registerationPagefield objectAtIndex:indexPath.row];
                cells.userDetailsTxt.text = [registerationPageValue valueForKey: [registerationPagefield objectAtIndex:indexPath.row]];
                cells.userDetailsTxt.floatingPlaceholderEnabled=YES;
                cells.userDetailsTxt.floatingLabelBottomMargin=8;
                cells.userDetailsTxt.bottomBorderEnabled=YES;
                cells.userDetailsTxt.tag=indexPath.row;
                return cells;
            }else if(indexPath.row>=6 && indexPath.row<10){
                static NSString *CellIdentifier = @"cells";
                DropDownTableViewCell *cells=nil;
                cells = (DropDownTableViewCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
                if (cells == nil)
                {
                    cells = [[DropDownTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
                cells.addressValue.tag=indexPath.row;
                [cells.addressValue addTarget:self action:@selector(selectAddress:) forControlEvents:UIControlEventTouchUpInside];
                cells.fullAddress.text=[NSString stringWithFormat:@"%@:",[registerationPagefield objectAtIndex:indexPath.row]];
                [cells.addressValue setTitle:[registerationPageValue valueForKey:[registerationPagefield objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
                return cells;
            }else if(indexPath.row>=10 && indexPath.row<12){
                static NSString *CellIdentifier = @"cell";
                CustomTextFieldCell *cells=nil;
                cells = (CustomTextFieldCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
                if (cells == nil)
                {
                    cells = [[CustomTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
                cells.userDetailsTxt.delegate=self;
                cells.userDetailsTxt.tag=indexPath.row;
                cells.userDetailsTxt.layer.borderColor=[[UIColor clearColor]CGColor];
                cells.userDetailsTxt.placeholder=[registerationPagefield objectAtIndex:indexPath.row];
                cells.userDetailsTxt.text = [registerationPageValue valueForKey: [registerationPagefield objectAtIndex:indexPath.row]];
                cells.userDetailsTxt.floatingPlaceholderEnabled=YES;
                cells.userDetailsTxt.floatingLabelFont=[UIFont fontWithName:@"System" size:4.0];
                cells.userDetailsTxt.floatingLabelBottomMargin=8;
                cells.userDetailsTxt.bottomBorderEnabled=YES;
                return cells;
            }else if(indexPath.row==12){
                static NSString *CellIdentifier = @"customCell";
                DOBandGenderCell *cells=nil;
                cells = (DOBandGenderCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
                if (cells == nil)
                {
                    cells = [[DOBandGenderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
                cells.dobLbl.text    = [NSString stringWithFormat:@"%@:",[registerationPagefield objectAtIndex:12]];
                cells.genderLbl.text = [NSString stringWithFormat:@"%@:",[registerationPagefield objectAtIndex:13]];
                [cells.dobSelection setTitle:[registerationPageValue valueForKey:[registerationPagefield objectAtIndex:12]] forState:UIControlStateNormal];
                [cells.genderSelectionM addTarget:self action:@selector(genderSelection:) forControlEvents:UIControlEventTouchUpInside];
                [cells.genderSelectionF addTarget:self action:@selector(genderSelection:) forControlEvents:UIControlEventTouchUpInside];
                [cells.dobSelection addTarget:self action:@selector(selectDOBfromCalender:) forControlEvents:UIControlEventTouchUpInside];
                return cells;
            }else{
                static NSString *CellIdentifier = @"customCells";
                RegisterationBottomCell *cells=nil;
                cells = (RegisterationBottomCell*) [registerationTableView dequeueReusableCellWithIdentifier:CellIdentifier];;
                if (cells == nil)
                {
                    cells = [[RegisterationBottomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                }
                cells.mobilNo.delegate=self;
                cells.mobilNo.tag=14;
                cells.mobilNo.placeholder = [registerationPagefield objectAtIndex:14];
                cells.mobilNo.text = [registerationPageValue valueForKey: [registerationPagefield objectAtIndex:14]];
                cells.Otptxt.delegate=self;
                cells.Otptxt.tag=15;
                cells.Otptxt.placeholder  = [registerationPagefield objectAtIndex:15];
                cells.Otptxt.text = [registerationPageValue valueForKey: [registerationPagefield objectAtIndex:15]];
                cells.Otptxt.floatingPlaceholderEnabled=YES;
                cells.Otptxt.floatingLabelBottomMargin=8;
                cells.Otptxt.bottomBorderEnabled=YES;
                cells.mobilNo.floatingPlaceholderEnabled=YES;
                cells.mobilNo.floatingLabelBottomMargin=8;
                cells.mobilNo.bottomBorderEnabled=YES;
                [cells.otpSender addTarget:self action:@selector(generateOtp) forControlEvents:UIControlEventTouchUpInside];
                return cells;
            }
            
        }
    
}

-(void)generateOtp{
    NSMutableDictionary *sendtoServerzGetOtpRequestData;
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
      sendtoServerzGetOtpRequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"gen_otp",@"section",[registerationPagefieldStore valueForKey: [registerationPagefield objectAtIndex:16]],@"mobile_no", nil];
    }else if ([self.registerationType isEqualToString:@"CompanyRegisteration"]|| [self.registerationType isEqualToString:@"BuyerRegisteration"]){
        sendtoServerzGetOtpRequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"gen_otp",@"section",[registerationPageValue valueForKey: [registerationPagefield objectAtIndex:14]],@"mobile_no", nil];
    }else{
        sendtoServerzGetOtpRequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"gen_otp",@"section",[registerationPageValue valueForKey: [registerationPagefield objectAtIndex:13]],@"mobile_no", nil];
    }
  
    [APIManager apiManager].delegate = self;
    [[APIManager apiManager] SendOtpToMobileNumberFromServer:sendtoServerzGetOtpRequestData];
    
}

- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"new%d",(int)indexPath.row);
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
        if(indexPath.row<3){
            return 40;
        }else if (indexPath.row>=3 && indexPath.row<8) {
            return 67;
            
        }else if(indexPath.row>=8 && indexPath.row<12){
            return 40;
            
        }else if(indexPath.row>=12 && indexPath.row<14){
            return 67;
            
        }else if(indexPath.row==14){
            return 80;
            
        }else{
            return 205;
            
        }

    }else if([self.registerationType isEqualToString:@"CompanyRegisteration"]){
        if (indexPath.row<6) {
            return 67;
            
        }else if(indexPath.row>=6 && indexPath.row<10){
            return 40;
            
        }else if(indexPath.row>=10 && indexPath.row<12){
            return 67;
            
        }else if(indexPath.row==12){
            return 80;
            
        }else{
            return 205;
            
        }
    }else if([self.registerationType isEqualToString:@"BuyerRegisteration"]){
        if(indexPath.row==0){
            return 40;
        }else if (indexPath.row>=1 && indexPath.row<6) {
            return 67;
            
        }else if(indexPath.row>=6 && indexPath.row<10){
            return 40;
            
        }else if(indexPath.row>=10 && indexPath.row<12){
            return 67;
            
        }else if(indexPath.row==12){
            return 80;
            
        }else{
            return 205;
            
        }
    }else{
        if (indexPath.row<5) {
            return 67;
            
        }else if(indexPath.row>=5 && indexPath.row<9){
            return 40;
            
        }else if(indexPath.row>=9 && indexPath.row<11){
            return 67;
            
        }else if(indexPath.row==11){
            return 80;
            
        }else{
            return 205;
            
        }
        
    }
    
}
- (void)viewDidUnload {
    [super viewDidUnload];
}

-(void)selectDOBfromCalender:(id)sender{
    _popUpCalender =[WWCalendarTimeSelector instantiate];
    _popUpCalender.delegate=self;
    _popUpCalender.optionCurrentDate=[NSDate date];
    [self presentViewController:_popUpCalender animated:YES completion:nil];
}

- (void)selectMainCatAndCatAndSubcat:(id)sender {
    selectedBtnText= (UIButton *)sender;
    NSLog(@"%ld",selectedBtnText.tag);
    NSMutableArray *arr;
    if(selectedBtnText.tag==5 || selectedBtnText.tag==8){
        arr = getStateArray;
    }else if(selectedBtnText.tag==6 || selectedBtnText.tag==9){
        arr = getCityArray;
    }else if(selectedBtnText.tag==7 || selectedBtnText.tag==10){
        arr = getPostOfficeArray;
    }else if(selectedBtnText.tag==8 || selectedBtnText.tag==11){
        arr = getZipCodeArray;
    }
    NSArray * arrImage = [[NSArray alloc] init];
    
    if(dropDown == nil) {
        CGFloat f = 200;
        dropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr :arrImage :@"down"];
        dropDown.delegate = self;
    }
    else {
        [dropDown hideDropDown:sender];
        [self rel];
    }
}


- (void)selectAddress:(id)sender {
    selectedBtnText= (UIButton *)sender;
    NSLog(@"%ld",selectedBtnText.tag);
    NSMutableArray *arr;
    
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
        if(selectedBtnText.tag==5 || selectedBtnText.tag==8){
            arr = getStateArray;
        }else if(selectedBtnText.tag==6 || selectedBtnText.tag==9){
            arr = getCityArray;
        }else if(selectedBtnText.tag==7 || selectedBtnText.tag==10){
            arr = getPostOfficeArray;
        }else if(selectedBtnText.tag==8 || selectedBtnText.tag==11){
            arr = getZipCodeArray;
        }else if(selectedBtnText.tag==0){
            arr = getMainCatArray;
        }else if(selectedBtnText.tag==1){
            arr = subCategoryMenu;
        }else if(selectedBtnText.tag==2){
            arr = getSubCatProductArray;
        }

    }else if([self.registerationType isEqualToString:@"BuyerRegisteration"]){
        if(selectedBtnText.tag==6) {
            arr = getStateArray;
        }else if(selectedBtnText.tag==7){
            arr = getCityArray;
        }else if(selectedBtnText.tag==8){
            arr = getPostOfficeArray;
        }else if(selectedBtnText.tag==9){
            arr = getZipCodeArray;
        }else if(selectedBtnText.tag==0){
            arr = getBuyerCategoryArray;
        }
    }else if([self.registerationType isEqualToString:@"CompanyRegisteration"]){
        if(selectedBtnText.tag==6) {
            arr = getStateArray;
        }else if(selectedBtnText.tag==7){
            arr = getCityArray;
        }else if(selectedBtnText.tag==8){
            arr = getPostOfficeArray;
        }else if(selectedBtnText.tag==9){
            arr = getZipCodeArray;
        }
    }
    
    NSArray * arrImage = [[NSArray alloc] init];

    if(dropDown == nil) {
        CGFloat f = 200;
        dropDown = [[NIDropDown alloc]showDropDown:sender :&f :arr :arrImage :@"down"];
        dropDown.delegate = self;
    }
    else {
        [dropDown hideDropDown:sender];
        [self rel];
    }
}

- (void) niDropDownDelegateMethod: (NIDropDown *) sender {
    
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
        
       [registerationPageValue setValue:selectedBtnText.currentTitle forKey:[registerationPagefieldStore objectAtIndex:selectedBtnText.tag]];
    }else{
        [registerationPageValue setValue:selectedBtnText.currentTitle forKey:[registerationPagefield objectAtIndex:selectedBtnText.tag]];
    }
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
     
        if(selectedBtnText.tag==5 || selectedBtnText.tag==8){
            NSString *state;
            for(int stateId = 0 ; stateId<getStateIDArray.count;stateId++){
                if(selectedBtnText.currentTitle == [getStateArray objectAtIndex:stateId]){
                    state = [NSString stringWithFormat:@"%@",[getStateIDArray objectAtIndex:stateId]];
                    break;
                }
            }
            NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_city",@"section",state,@"state", nil];
            
            [APIManager apiManager].delegate = self;
            [[APIManager apiManager] GetCityByStatefromServer:sendtoserverrequestData];
        }else if (selectedBtnText.tag==6 || selectedBtnText.tag==9){
            NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_post_office",@"section",selectedBtnText.currentTitle,@"city", nil];
            
            [APIManager apiManager].delegate = self;
            [[APIManager apiManager] GetPostOfficeByCityfromServer:sendtoserverrequestData];
        }else if (selectedBtnText.tag==7 || selectedBtnText.tag==10){
            NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_zipcode",@"section",selectedBtnText.currentTitle,@"post_office", nil];
            
            [APIManager apiManager].delegate = self;
            [[APIManager apiManager] GetZipCodeByPostOfficefromServer:sendtoserverrequestData];
        }else if (selectedBtnText.tag==0){
            NSString *mainCatId;
            for(int stateId = 0 ; stateId<getMainCatArray.count;stateId++){
                if(selectedBtnText.currentTitle == [getMainCatArray objectAtIndex:stateId]){
                    mainCatId = [NSString stringWithFormat:@"%@",[getMainCatIDArray objectAtIndex:stateId]];
                    break;
                }
            }
            NSMutableDictionary *sendtoServerzGetSubCategoryRequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_sub_category",@"section",mainCatId,@"category", nil];
            [APIManager apiManager].delegate = self;
            [[APIManager apiManager] GetSubCategoryDetailsbyCatIDSendToServer:sendtoServerzGetSubCategoryRequestData];
            
        }else if (selectedBtnText.tag==1){
            NSString *subCatId;
            for(int subCatID =0 ; subCatID<subCategoryMenu.count ; subCatID++){
                
                if(selectedBtnText.currentTitle == [subCategoryMenu objectAtIndex:subCatID]){
                    subCatId = [NSString stringWithFormat:@"%@",[getSubCatIDArray objectAtIndex:subCatID]];
                    break;
                }
            }
            NSMutableDictionary *sendtoServerzGetSubCategoryProductRequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_sub_category_product",@"section",subCatId,@"sub_cat_id", nil];
            
            [APIManager apiManager].delegate = self;
            [[APIManager apiManager] GetSubCategoryProductDetailsbySubCatIDSendToServer:sendtoServerzGetSubCategoryProductRequestData];
        }
        

     
    }else if([self.registerationType isEqualToString:@"BuyerRegisteration"]){
    
        if(selectedBtnText.tag==6){
            NSString *state;
            for(int stateId = 0 ; stateId<getStateIDArray.count;stateId++){
                if(selectedBtnText.currentTitle == [getStateArray objectAtIndex:stateId]){
                    state = [NSString stringWithFormat:@"%@",[getStateIDArray objectAtIndex:stateId]];
                    break;
                }
            }
            NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_city",@"section",state,@"state", nil];
            
            [APIManager apiManager].delegate = self;
            [[APIManager apiManager] GetCityByStatefromServer:sendtoserverrequestData];
        }else if (selectedBtnText.tag==7){
            NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_post_office",@"section",selectedBtnText.currentTitle,@"city", nil];
            
            [APIManager apiManager].delegate = self;
            [[APIManager apiManager] GetPostOfficeByCityfromServer:sendtoserverrequestData];
        }else if (selectedBtnText.tag==8){
            NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_zipcode",@"section",selectedBtnText.currentTitle,@"post_office", nil];
            
            [APIManager apiManager].delegate = self;
            [[APIManager apiManager] GetZipCodeByPostOfficefromServer:sendtoserverrequestData];
        }

    }else{
    
        if(selectedBtnText.tag==6){
            NSString *state;
            for(int stateId = 0 ; stateId<getStateIDArray.count;stateId++){
                if(selectedBtnText.currentTitle == [getStateArray objectAtIndex:stateId]){
                    state = [NSString stringWithFormat:@"%@",[getStateIDArray objectAtIndex:stateId]];
                    break;
                }
            }
            NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_city",@"section",state,@"state", nil];
            
            [APIManager apiManager].delegate = self;
            [[APIManager apiManager] GetCityByStatefromServer:sendtoserverrequestData];
        }else if (selectedBtnText.tag==7){
            NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_post_office",@"section",selectedBtnText.currentTitle,@"city", nil];
            
            [APIManager apiManager].delegate = self;
            [[APIManager apiManager] GetPostOfficeByCityfromServer:sendtoserverrequestData];
        }else if (selectedBtnText.tag==8){
            NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_zipcode",@"section",selectedBtnText.currentTitle,@"post_office", nil];
            
            [APIManager apiManager].delegate = self;
            [[APIManager apiManager] GetZipCodeByPostOfficefromServer:sendtoserverrequestData];
        }
    }
    [self rel];
}

-(void)rel{
    dropDown = nil;
}

-(void)textFieldDidEndEditing:(MKTextField *)textField{
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
        
        [registerationPageValue setValue:textField.text forKey:[registerationPagefieldStore objectAtIndex:textField.tag]];
    }else{
        [registerationPageValue setValue:textField.text forKey:[registerationPagefield objectAtIndex:textField.tag]];
    }
    NSLog(@"%@%ld",textField.text,(long)textField.tag);
}

- (void)WWCalendarTimeSelectorDone:(WWCalendarTimeSelector * _Nonnull)selector date:(NSDate * _Nonnull)date{
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
    dateformatter.dateFormat = @"dd-MM-yyyy";
    NSString *seklectedDate = [dateformatter stringFromDate:date];
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
        
        [registerationPageValue setValue:seklectedDate forKey:[registerationPagefieldStore objectAtIndex:14]];
    }else if([self.registerationType isEqualToString:@"CompanyRegisteration"] || [self.registerationType isEqualToString:@"BuyerRegisteration"]){
        
        [registerationPageValue setValue:seklectedDate forKey:[registerationPagefield objectAtIndex:12]];
    }else{
        [registerationPageValue setValue:seklectedDate forKey:[registerationPagefield objectAtIndex:11]];
        
    }
    [registerationTableView reloadData];
    NSLog(@"seklectedDate%@",seklectedDate);
}
// All of other buttons in the group become deselected.
-(IBAction)genderSelection:(RadioButton*)sender
{
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
   
        [registerationPageValue setValue:sender.titleLabel.text forKey:[registerationPagefieldStore objectAtIndex:15]];
    }else if([self.registerationType isEqualToString:@"CompanyRegisteration"] || [self.registerationType isEqualToString:@"BuyerRegisteration"]){
        
        [registerationPageValue setValue:sender.titleLabel.text forKey:[registerationPagefield objectAtIndex:13]];
    }else{
    
        [registerationPageValue setValue:sender.titleLabel.text forKey:[registerationPagefield objectAtIndex:12]];
    }
    
    NSLog(@"%@",[NSString stringWithFormat:@"Selected: %@", sender.titleLabel.text]);
}

-(IBAction)getalltextfieldValue:(id)sender{
  
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading..";
    NSLog(@"%@",[registerationPageValue valueForKey:@"Choose ZIP"]);
    NSString *zipCode = [registerationPageValue valueForKey:@"Choose ZIP"];
    NSString *fName = [registerationPageValue valueForKey:@"First name"];
    NSString *lName = [registerationPageValue valueForKey:@"Last name"];
   // NSString *idCountry = [registerationPageValue valueForKey:@"Choose ZIP"];
    NSString *idCity = [registerationPageValue valueForKey:@"Choose city"];
    NSString *idState = [registerationPageValue valueForKey:@"Choose state"];
    NSString *postOffice = [registerationPageValue valueForKey:@"Post office"];
    NSString *Gender = [registerationPageValue valueForKey:@"Gender"];
    NSString *companyName = [registerationPageValue valueForKey:@"Company registeration"];
    NSString *address1 = [registerationPageValue valueForKey:@"Street Address"];
    NSString *land_mark = [registerationPageValue valueForKey:@"Land mark"];
    NSString *email = [registerationPageValue valueForKey:@"Email id"];
    NSString *pass = [registerationPageValue valueForKey:@"Choose password"];
    NSString *mobileNo = [registerationPageValue valueForKey:@"Mobile no."];
    NSString *otp = [registerationPageValue valueForKey:@"Otp"];
    NSString *DOB = [registerationPageValue valueForKey:@"Choose DOB"];
    NSString *choose_Type = [registerationPageValue valueForKey:@"Choose Type"];
    NSString *main_Cat = [registerationPageValue valueForKey:@"Main category"];
    NSString *choose_type = [registerationPageValue valueForKey:@"Choose type"];
    NSString *sub_Cat = [registerationPageValue valueForKey:@"Sub category"];
     NSString *selectedBuyerCat;
    for(int buyerCatIndex = 0; buyerCatIndex<getBuyerCategoryArray.count ; buyerCatIndex++){
        if([choose_Type isEqualToString:[NSString stringWithFormat:@"%@",[getBuyerCategoryIDArray objectAtIndex:buyerCatIndex]]]){
            selectedBuyerCat = [NSString stringWithFormat:@"%@",[getBuyerCategoryIDArray objectAtIndex:buyerCatIndex]];
            break;
        }
    }

    
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"company_register",@"section",email,@"login",email,@"email",postOffice,@"post_office",otp,@"otp_code",fName,@"fname",lName,@"lname",Gender,@"gender",pass,@"pass",idCity,@"city_id",@"india",@"id_country",address1,@"address1",land_mark,@"land_mark",mobileNo,@"mobile",DOB,@"Dob",zipCode,@"zipcode",companyName,@"store_name",idState,@"id_state",main_Cat,@"",choose_type,@"seller_category",sub_Cat,@"", nil];
            NSLog(@"%@",sendtoserverrequestData);
            [[APIManager apiManager] UserDetailsForCompanyRegisteration:sendtoserverrequestData];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            

        });
    }else if ([self.registerationType isEqualToString:@"CompanyRegisteration"]){
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"company_register",@"section",email,@"login",email,@"email",postOffice,@"post_office",otp,@"otp_code",fName,@"fname",lName,@"lname",Gender,@"gender",pass,@"pass",idCity,@"city_id",@"india",@"id_country",address1,@"address1",land_mark,@"land_mark",mobileNo,@"mobile",DOB,@"Dob",zipCode,@"zipcode",companyName,@"store_name",idState,@"id_state", nil];
            NSLog(@"%@",sendtoserverrequestData);
            [[APIManager apiManager] UserDetailsForCompanyRegisteration:sendtoserverrequestData];
           
//            zhRegisterationViewController *storeRegisteration = [self.storyboard instantiateViewControllerWithIdentifier:@"zhRegisterationViewController"];
//            storeRegisteration.registerationType = @"CompanyRegisteration";
//            [self.navigationController pushViewController:storeRegisteration animated:YES];
//            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    }else if ([self.registerationType isEqualToString:@"BuyerRegisteration"]){
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"register",@"section",email,@"login",email,@"email",postOffice,@"post_office",otp,@"otp_code",fName,@"fname",lName,@"lname",Gender,@"gender",pass,@"pass1",idCity,@"city_id",@"india",@"id_country",address1,@"address1",land_mark,@"land_mark",mobileNo,@"mobile",DOB,@"Dob",zipCode,@"zipcode",selectedBuyerCat,@"buyer_category",idState,@"id_state", nil];
            NSLog(@"%@",sendtoserverrequestData);
            [[APIManager apiManager] UserDetailsForBuyerRegisteration:sendtoserverrequestData];
            
        });
    }else{
        
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading..";
    
     dispatch_async(dispatch_get_main_queue(), ^{
         NSMutableDictionary *sendtoServerzGetStateRequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_state",@"section", nil];
         
         [APIManager apiManager].delegate = self;
         [[APIManager apiManager] GetStatefromServer:sendtoServerzGetStateRequestData];
         
         if([self.registerationType isEqualToString:@"StoreRegisteration"]){
             NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_main_category",@"section", nil];
             
             [APIManager apiManager].delegate = self;
             [[APIManager apiManager] GetMainCategoryfromServer:sendtoserverrequestData];
             
         }else if([self.registerationType isEqualToString:@"BuyerRegisteration"]){
             NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_buyer_category",@"section", nil];
             
             [APIManager apiManager].delegate = self;
             [[APIManager apiManager] GetBuyerCatFromServer:sendtoserverrequestData];
             

         }

     });
   }

-(void)subCategoryMenulist{
    NSMutableDictionary *sendtoServerzGetSubCategoryRequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_sub_category",@"section",[getMainCatIDArray objectAtIndex:0],@"category", nil];
    [APIManager apiManager].delegate = self;
    [[APIManager apiManager] GetSubCategoryDetailsbyCatIDSendToServer:sendtoServerzGetSubCategoryRequestData];
}

-(void)subCatProductlist{
    NSMutableDictionary *sendtoServerzGetSubCategoryProductRequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_sub_category_product",@"section",[getSubCatIDArray objectAtIndex:0],@"sub_cat_id", nil];
    
    [APIManager apiManager].delegate = self;
    [[APIManager apiManager] GetSubCategoryProductDetailsbySubCatIDSendToServer:sendtoServerzGetSubCategoryProductRequestData];
}

-(void)getCity{
    NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_city",@"section",[getStateIDArray objectAtIndex:0],@"state", nil];
    
    [APIManager apiManager].delegate = self;
    [[APIManager apiManager] GetCityByStatefromServer:sendtoserverrequestData];

}
-(void)getPostOffice{
    NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_post_office",@"section",[getCityArray objectAtIndex:0],@"city", nil];
    
    [APIManager apiManager].delegate = self;
    [[APIManager apiManager] GetPostOfficeByCityfromServer:sendtoserverrequestData];
}
-(void)getZipCode{
    NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_zipcode",@"section",[getPostOfficeArray objectAtIndex:0],@"post_office", nil];
    
    [APIManager apiManager].delegate = self;
    [[APIManager apiManager] GetZipCodeByPostOfficefromServer:sendtoserverrequestData];
}
-(void)getResponse:(NSMutableDictionary *)response serviceIdentifier:(NSString *)serviceIdentifier {
    
    if ([serviceIdentifier isEqualToString:@"GetState"]) {
        getStateArray   = [response valueForKey:@"value"];
        getStateIDArray = [response valueForKey:@"id"];
        if(isFirstTime){
            if([_registerationType isEqualToString:@"StoreRegisteration"]){
               [registerationPageValue setValue:[getStateArray objectAtIndex:0] forKey:[registerationPagefieldStore objectAtIndex:8]];
            }else if ([self.registerationType isEqualToString:@"CompanyRegisteration"] || [self.registerationType isEqualToString:@"BuyerRegisteration"]){
                [registerationPageValue setValue:[getStateArray objectAtIndex:0] forKey:[registerationPagefield objectAtIndex:6]];

            }else{
                [registerationPageValue setValue:[getStateArray objectAtIndex:0] forKey:[registerationPagefield objectAtIndex:5]];
            }
            
            [self getCity];
        }
        
    }else if ([serviceIdentifier isEqualToString:@"GetCity"]) {
        getCityArray = [response valueForKey:@"name"];
        if(isFirstTime){
            if([_registerationType isEqualToString:@"StoreRegisteration"]){
                [registerationPageValue setValue:[getCityArray objectAtIndex:0] forKey:[registerationPagefieldStore objectAtIndex:9]];
            }else if ([self.registerationType isEqualToString:@"CompanyRegisteration"]|| [self.registerationType isEqualToString:@"BuyerRegisteration"]){
                [registerationPageValue setValue:[getCityArray objectAtIndex:0] forKey:[registerationPagefield objectAtIndex:7]];

            }else{
                [registerationPageValue setValue:[getCityArray objectAtIndex:0] forKey:[registerationPagefield objectAtIndex:6]];
            }
            
            [self getPostOffice];
        }
        
    }else if ([serviceIdentifier isEqualToString:@"GetPostOffice"]){
        getPostOfficeArray = [response valueForKey:@"value"];
        if(isFirstTime){
            if([_registerationType isEqualToString:@"StoreRegisteration"]){
                [registerationPageValue setValue:[getPostOfficeArray objectAtIndex:0] forKey:[registerationPagefieldStore objectAtIndex:10]];
            }else if ([self.registerationType isEqualToString:@"CompanyRegisteration"]|| [self.registerationType isEqualToString:@"BuyerRegisteration"]){
                [registerationPageValue setValue:[getPostOfficeArray objectAtIndex:0] forKey:[registerationPagefield objectAtIndex:8]];

            }else{
                [registerationPageValue setValue:[getPostOfficeArray objectAtIndex:0] forKey:[registerationPagefield objectAtIndex:7]];
            }
            
            [self getZipCode];
        }
        
    }else if ([serviceIdentifier isEqualToString:@"GetZipCode"]){
        for(NSMutableArray *ar in response){
            [getZipCodeArray addObject:ar];
        }
        if([_registerationType isEqualToString:@"StoreRegisteration"]){
            [registerationPageValue setValue:[getZipCodeArray objectAtIndex:0] forKey:[registerationPagefieldStore objectAtIndex:11]];
        }else if ([self.registerationType isEqualToString:@"CompanyRegisteration"]|| [self.registerationType isEqualToString:@"BuyerRegisteration"]){
             [registerationPageValue setValue:[getZipCodeArray objectAtIndex:0] forKey:[registerationPagefield objectAtIndex:9]];
          if([self.registerationType isEqualToString:@"CompanyRegisteration"])
          {
              isFirstTime = false;
              [registerationTableView reloadData];
              [MBProgressHUD hideHUDForView:self.view animated:YES];
          }
        }else{
            [registerationPageValue setValue:[getZipCodeArray objectAtIndex:0] forKey:[registerationPagefield objectAtIndex:8]];
        }
     
        
    }else if ([serviceIdentifier isEqualToString:kAPIkeyCompanyRegistration]){
        
        //[self updateUserProfile:response];
        
    }else if ([serviceIdentifier isEqualToString:kAPIkeyStoreRegistration]){
       
        //[self updateUserProfile:response];
    
    }else if ([serviceIdentifier isEqualToString:kAPIkeyRegistration]){
        
        //[self updateUserProfile:response];
        
    }else if ([serviceIdentifier isEqualToString:kAPIkeyGenerateOtp]){
        
    }else if ([serviceIdentifier isEqualToString:kAPIkeyGetMainCategory]){
        getMainCatArray = [response valueForKey:@"category"];
        getMainCatIDArray = [response valueForKey:@"id"];
        if(isFirstTime){
            [registerationPageValue setValue:[getMainCatArray objectAtIndex:0] forKey:[registerationPagefieldStore objectAtIndex:0]];
            [self subCategoryMenulist];
        }
       
    }else if ([serviceIdentifier isEqualToString:kAPIkeyGetSubCategory]){
       subCategoryMenu = [response valueForKey:@"sub_category"];
        getSubCatIDArray = [response valueForKey:@"id"];
        if(isFirstTime){
            [registerationPageValue setValue:[subCategoryMenu objectAtIndex:0] forKey:[registerationPagefieldStore objectAtIndex:1]];
            [self subCatProductlist];
        }
        
    }else if ([serviceIdentifier isEqualToString:kAPIkeyGetSubCategoryProduct]){
        getSubCatProductArray = [response valueForKey:@"title"];
        if(isFirstTime){
            [registerationPageValue setValue:[getSubCatProductArray objectAtIndex:0] forKey:[registerationPagefieldStore objectAtIndex:2]];
            [registerationTableView reloadData];
            isFirstTime = false;
            [MBProgressHUD hideHUDForView:self.view animated:YES];

        }
    }else if ([serviceIdentifier isEqualToString:kAPIkeyGetBuyerCategory]){
         
            getBuyerCategoryArray   = [response valueForKey:@"value"];
            getBuyerCategoryIDArray = [response valueForKey:@"id"];
            if(isFirstTime){
                [registerationPageValue setValue:[getBuyerCategoryArray objectAtIndex:0] forKey:[registerationPagefield objectAtIndex:0]];
                [registerationTableView reloadData];
                isFirstTime = false;
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                
            }
            
        }
  
}

-(void)updateUserProfile:(NSMutableDictionary *)responsedesc{
    zhRegisterationViewController *storeRegisteration = [self.storyboard instantiateViewControllerWithIdentifier:@"zhRegisterationViewController"];
    storeRegisteration.registerationType = @"CompanyRegisteration";
    storeRegisteration.userInfoFromResponse = responsedesc;
    [self.navigationController pushViewController:storeRegisteration animated:YES];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)getFailResponse:(NSError *)errObj serviceIdentifier:(NSString *)serviceIdentifier {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
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


@end
