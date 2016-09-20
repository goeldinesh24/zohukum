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
    
    registerationTableView.dataSource = self;
    registerationTableView.delegate   = self;
    registerationPageValue = [NSMutableDictionary new];
    registerationPagefieldStore = [[NSMutableArray alloc]initWithObjects:@"Choose type",@"Main category",@"Sub category",@"First name",@"Last name",@"Email id",@"Choose password",@"Re-enter password",@"Choose state",@"Choose city",@"Post office",@"Choose ZIP",@"Street Address",@"Land mark",@"Choose DOB",@"Gender",@"Mobile no.",@"Otp", nil];
    registerationPagefield = [[NSMutableArray alloc]initWithObjects:@"First name",@"Last name",@"Email id",@"Choose password",@"Re-enter password",@"Choose state",@"Choose city",@"Post office",@"Choose ZIP",@"Street Address",@"Land mark",@"Choose DOB",@"Gender",@"Mobile no.",@"Otp", nil];
    
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
        for(int index = 0 ; index < registerationPagefieldStore.count ; index ++){
            if(index==14){
               [registerationPageValue setValue:@"Select" forKey:[registerationPagefieldStore objectAtIndex:index]];
            }else{
                [registerationPageValue setValue:@"" forKey:[registerationPagefieldStore objectAtIndex:index]];
            }
            
        }
    }else{
        for(int index = 0 ; index < registerationPagefield.count ; index ++){
            
            if(index==11){
                [registerationPageValue setValue:@"Select" forKey:[registerationPagefield objectAtIndex:index]];
            }else{
               [registerationPageValue setValue:@"" forKey:[registerationPagefield objectAtIndex:index]];
            }

        }
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
       return 16;
    }else{
       return 13;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
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
            [cells.dobSelection setTitle:[registerationPageValue valueForKey:[registerationPagefield objectAtIndex:14]] forState:UIControlStateNormal];
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
            
            return cells;
        }

    }else{
        if (indexPath.row<5) {
            
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
        }else if(indexPath.row>=5 && indexPath.row<9){
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
            
            return cells;
        }else if(indexPath.row>=9 && indexPath.row<11){
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
        }else if(indexPath.row==11){
            static NSString *CellIdentifier = @"customCell";
            DOBandGenderCell *cells=nil;
            cells = (DOBandGenderCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
            if (cells == nil)
            {
                cells = [[DOBandGenderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cells.dobLbl.text    = [NSString stringWithFormat:@"%@:",[registerationPagefield objectAtIndex:11]];
            cells.genderLbl.text = [NSString stringWithFormat:@"%@:",[registerationPagefield objectAtIndex:12]];
            [cells.dobSelection setTitle:[registerationPageValue valueForKey:[registerationPagefield objectAtIndex:11]] forState:UIControlStateNormal];
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
            cells.mobilNo.tag=13;
            cells.mobilNo.placeholder = [registerationPagefield objectAtIndex:13];
            cells.mobilNo.text = [registerationPageValue valueForKey: [registerationPagefield objectAtIndex:13]];
            cells.Otptxt.delegate=self;
            cells.Otptxt.tag=14;
            cells.Otptxt.placeholder  = [registerationPagefield objectAtIndex:14];
            cells.Otptxt.text = [registerationPageValue valueForKey: [registerationPagefield objectAtIndex:14]];
            cells.Otptxt.floatingPlaceholderEnabled=YES;
            cells.Otptxt.floatingLabelBottomMargin=8;
            cells.Otptxt.bottomBorderEnabled=YES;
            cells.mobilNo.floatingPlaceholderEnabled=YES;
            cells.mobilNo.floatingLabelBottomMargin=8;
            cells.mobilNo.bottomBorderEnabled=YES;
            
            return cells;
        }

    }
    
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

- (void)selectAddress:(id)sender {
    selectedBtnText= (UIButton *)sender;
    NSLog(@"%ld",selectedBtnText.tag);
    NSMutableArray *arr;
    if(selectedBtnText.tag==5){
        arr = getStateArray;
    }else if(selectedBtnText.tag==6){
        arr = getCityArray;
    }else if(selectedBtnText.tag==7){
        arr = getPostOfficeArray;
    }else if(selectedBtnText.tag==8){
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

- (void) niDropDownDelegateMethod: (NIDropDown *) sender {
    
    if([self.registerationType isEqualToString:@"StoreRegisteration"]){
        
       [registerationPageValue setValue:selectedBtnText.currentTitle forKey:[registerationPagefieldStore objectAtIndex:selectedBtnText.tag]];
    }else{
        [registerationPageValue setValue:selectedBtnText.currentTitle forKey:[registerationPagefield objectAtIndex:selectedBtnText.tag]];
    }
    if(selectedBtnText.tag==5){
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
    }else if (selectedBtnText.tag==6){
        NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_post_office",@"section",selectedBtnText.currentTitle,@"city", nil];
        
        [APIManager apiManager].delegate = self;
        [[APIManager apiManager] GetPostOfficeByCityfromServer:sendtoserverrequestData];
    }else if (selectedBtnText.tag==7){
        NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_zipcode",@"section",selectedBtnText.currentTitle,@"post_office", nil];
        
        [APIManager apiManager].delegate = self;
        [[APIManager apiManager] GetZipCodeByPostOfficefromServer:sendtoserverrequestData];
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
    }else{
    
        [registerationPageValue setValue:sender.titleLabel.text forKey:[registerationPagefield objectAtIndex:12]];
    }
    
    NSLog(@"%@",[NSString stringWithFormat:@"Selected: %@", sender.titleLabel.text]);
}

-(IBAction)getalltextfieldValue:(id)sender{
  
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading..";
    [[APIManager apiManager] UserDetailsForCompanyRegisteration:registerationPageValue];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.labelText = @"Loading..";
    
    NSMutableDictionary *sendtoServerzGetStateRequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_state",@"section", nil];
    
    [APIManager apiManager].delegate = self;
    [[APIManager apiManager] GetStatefromServer:sendtoServerzGetStateRequestData];
    
    
//    NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_city",@"section",@"79",@"state", nil];
//    
//    [APIManager apiManager].delegate = self;
//    [[APIManager apiManager] GetCityByStatefromServer:sendtoserverrequestData];
//    
}

-(void)getResponse:(NSMutableDictionary *)response serviceIdentifier:(NSString *)serviceIdentifier {
    //[MBProgressHUD hideHUDForView:self.view animated:YES];
    
    if ([serviceIdentifier isEqualToString:@"GetState"]) {
        getStateArray   = [response valueForKey:@"value"];
        getStateIDArray = [response valueForKey:@"id"];
    }else if ([serviceIdentifier isEqualToString:@"GetCity"]) {
        getCityArray = [response valueForKey:@"name"];
    }else if ([serviceIdentifier isEqualToString:@"GetPostOffice"]){
        getPostOfficeArray = [response valueForKey:@"value"];
    }else if ([serviceIdentifier isEqualToString:@"GetZipCode"]){
        for(NSMutableArray *ar in response){
            [getZipCodeArray addObject:ar];
        }
    }else if ([serviceIdentifier isEqualToString:@"CompanyRegister"]){
        
    }
    
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
