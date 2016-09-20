//
//  zHBuyersLoginView.h
//  zoHukum
//
//  Created by Vivek on 05/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "APIManager.h"
#import <bolts/bolts.h>

@import GoogleSignIn;
@interface zHBuyersLoginView : UIViewController<ZHApiManagerDelegate>
@property(weak, nonatomic) IBOutlet GIDSignInButton *signInButton;

-(IBAction)forgetPasswordPopUp:(id)sender;
// A label to display the result of the sign-in action.
@end
