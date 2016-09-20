//
//  CustomAlertView.h
//  zoHukum
//
//  Created by Vivek on 18/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiManager.h"

@interface CustomAlertView : UIViewController<ZHApiManagerDelegate>
@property(nonatomic,strong)IBOutlet UITextField *emailTxtfield;
@property(nonatomic,strong)IBOutlet UIButton *cancelButton;
@property(nonatomic,strong)IBOutlet UIButton *sendButton;
@property(nonatomic,strong)NSString *emailValue;
@property(nonatomic,strong)NSString *userType;
-(IBAction)dismissPopupAlert:(id)sender;
-(IBAction)callForgetpasswordService:(id)sender;
@end
