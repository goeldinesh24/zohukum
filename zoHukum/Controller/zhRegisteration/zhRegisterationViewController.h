//
//  zhRegisterationViewController.h
//  zoHukum
//
//  Created by Vivek on 06/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"
#import "APIManager.h"
@interface zhRegisterationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NIDropDownDelegate,UITextFieldDelegate,ZHApiManagerDelegate>{
     NIDropDown *dropDown;
   
}
@property(strong,nonatomic)IBOutlet UITableView *registerationTableView;
@property(strong,nonatomic)IBOutlet NSMutableDictionary *userInfoFromResponse;
@property(strong,nonatomic)IBOutlet UITextField *mobileNo;
@property(strong,nonatomic)IBOutlet UITextField *otp;
@property(strong,nonatomic)IBOutlet UIButton *getOTP;
@property(strong,nonatomic)IBOutlet UIButton *selectDOB;
@property(strong,nonatomic)NSString *registerationType;
@property(strong,nonatomic)IBOutlet UIButton *submitUserDetails;
@end
