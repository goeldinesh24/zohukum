//
//  zHSellerLoginView.m
//  zoHukum
//
//  Created by Vivek on 05/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import "zHSellerLoginView.h"
#import "zhRegisterationViewController.h"
#import "CustomAlertView.h"

@interface zHSellerLoginView ()
@property(weak,nonatomic)IBOutlet UITextField *userName;
@property(weak,nonatomic)IBOutlet UIView *bottomView;
@property(weak,nonatomic)IBOutlet UITextField *userPassword;
-(IBAction)forgetPasswordPopUp:(id)sender;
-(IBAction)newRegisterationWithStore:(id)sender;
@end

@implementation zHSellerLoginView

- (void)viewDidLoad {
    [super viewDidLoad];
    _userName.layer.borderColor     = [[UIColor clearColor]CGColor];
    _userPassword.layer.borderColor = [[UIColor clearColor]CGColor];
    
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)newRegisterationWithStore:(id)sender{
    zhRegisterationViewController *storeRegisteration = [self.storyboard instantiateViewControllerWithIdentifier:@"zhRegisterationViewController"];
    storeRegisteration.registerationType = @"StoreRegisteration";
    [self.navigationController pushViewController:storeRegisteration animated:YES];
    
}

-(IBAction)forgetPasswordPopUp:(id)sender{
    
    CustomAlertView *alertOverLay = [[CustomAlertView alloc]initWithNibName:@"CustomAlertView" bundle:nil];
    alertOverLay.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    alertOverLay.emailValue = _userName.text;
    alertOverLay.userType = @"seller";
    alertOverLay.modalPresentationStyle = UIModalPresentationCustom;
    alertOverLay.preferredContentSize = CGSizeMake(300, 178);
    [self presentViewController:alertOverLay animated:YES completion:nil];
}

@end
