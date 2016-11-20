//
//  zHBuyersLoginView.m
//  zoHukum
//
//  Created by Vivek on 05/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import "zHBuyersLoginView.h"
#import <GoogleSignIn/GoogleSignIn.h>
#import "zhRegisterationViewController.h"
#import "AppDelegate.h"
#import "CustomAlertView.h"
#import "TWMessageBarManager.h"
#import "MBProgressHUD.h"
#import "LeftViewController.h"
#import "ExSlideMenuController.h"
#import "UIColor+SlideMenuControllerOC.h"

typedef void(^AlertViewActionBlock)(void);
@interface zHBuyersLoginView ()<GIDSignInUIDelegate,GIDSignInDelegate>{
    NSMutableArray *fbDetailsArray;
    NSString       *loginType;
    NSMutableDictionary *userGoogleDetails;
}
@property (nonatomic, copy) void (^confirmActionBlock)(void);
@property (nonatomic, copy) void (^cancelActionBlock)(void);

@property(weak,nonatomic)IBOutlet UITextField *userName;
@property(weak,nonatomic)IBOutlet UITextField *userPassword;

-(IBAction)signInwithGoogle:(id)sender;
-(IBAction)signInwithfacebook:(id)sender;
-(IBAction)signInwithUserNameAndEmailID:(id)sender;
-(IBAction)newRegisterationWithStore:(id)sender;

@end

static NSString *const kPlaceholderUserName = @"<Name>";
static NSString *const kPlaceholderEmailAddress = @"<Email>";
static NSString *const kPlaceholderAvatarImageName = @"PlaceholderAvatar.png";

// Labels for the cells that have in-cell control elements.
static NSString *const kGetUserProfileCellLabel = @"Get user Basic Profile";
static NSString *const kButtonWidthCellLabel = @"Width";

// Labels for the cells that drill down to data pickers.
static NSString *const kColorSchemeCellLabel = @"Color scheme";
static NSString *const kStyleCellLabel = @"Style";

// Strings for Alert Views.
static NSString *const kSignInViewTitle = @"Sign in View";
static NSString *const kSignOutAlertViewTitle = @"Warning";
static NSString *const kSignOutAlertCancelTitle = @"Cancel";
static NSString *const kSignOutAlertConfirmTitle = @"Continue";

// Accessibility Identifiers.
static NSString *const kCredentialsButtonAccessibilityIdentifier = @"Credentials";

@implementation zHBuyersLoginView

- (void)viewDidLoad {
    [super viewDidLoad];    
    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    signIn.shouldFetchBasicProfile = YES;
    signIn.scopes = @[ @"https://www.googleapis.com/auth/userinfo.profile",@"https://www.googleapis.com/auth/userinfo.email",@"https://www.googleapis.com/auth/plus.login" ];
    signIn.delegate = self;
    signIn.uiDelegate = self;
    _userName.layer.borderColor     = [[UIColor clearColor]CGColor];
    _userPassword.layer.borderColor = [[UIColor clearColor]CGColor];

    // Do any additional setup after loading the view.
}

-(IBAction)signInwithGoogle:(id)sender{
    MBProgressHUD *loginwait = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    loginwait.labelText = @"Please Wait...";
    loginType = @"Google";
    [[GIDSignIn sharedInstance] signIn];
}

-(IBAction)signInwithfacebook:(id)sender{
    loginType = @"Facebook";
    MBProgressHUD *loginwait = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    loginwait.labelText = @"Please Wait...";
    
    dispatch_async(dispatch_get_main_queue(), ^{
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login logInWithReadPermissions:@[@"email"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
            if (error)
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[TWMessageBarManager sharedInstance] showMessageWithTitle:error.description description:nil type:TWMessageBarMessageTypeError statusBarStyle:[UIApplication sharedApplication].statusBarStyle callback:nil];
                });
            }
            else if (result.isCancelled)
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                [[TWMessageBarManager sharedInstance] showMessageWithTitle:kInternalInconsistencyErrorMessage description:nil type:TWMessageBarMessageTypeError statusBarStyle:[UIApplication sharedApplication].statusBarStyle callback:nil];
                });

            }
            else
            {
                if ([result.grantedPermissions containsObject:@"email"])
                {
                    // Do work
                    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
                    [parameters setValue:@"id,name,email,picture,gender,birthday,last_name,first_name" forKey:@"fields"];
                    if ([FBSDKAccessToken currentAccessToken]) {
                        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
                         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                             if (!error) {
                                 NSLog(@"fetched user:%@", result);
                                 [self callRegisterationdetailsBySocial:result];
                                 
                             }
                         }];
                    }
                }
            }
        }];

    });
}

-(IBAction)signInwithUserNameAndEmailID:(id)sender{
    if([_userName.text isEqualToString:@""] && [_userPassword.text isEqualToString:@""]){
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:@"Plese enter Valid Registered UserName & Password" description:nil type:TWMessageBarMessageTypeSuccess statusBarStyle:[UIApplication sharedApplication].statusBarStyle callback:nil];
    }else if ([_userName.text isEqualToString:@""]){
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:@"Plese enter Valid Registered UserName" description:nil type:TWMessageBarMessageTypeSuccess statusBarStyle:[UIApplication sharedApplication].statusBarStyle callback:nil];
    }else if([_userPassword.text isEqualToString:@""]){
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:@"Plese enter Valid Password" description:nil type:TWMessageBarMessageTypeSuccess statusBarStyle:[UIApplication sharedApplication].statusBarStyle callback:nil];
    }else{
        MBProgressHUD *loginwait = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        loginwait.labelText = @"Please Wait...";
        NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"check_email_pass_user",@"section",_userName.text,@"email",_userPassword.text,@"password",@"buyer",@"user_type", nil];
        
        [APIManager apiManager].delegate = self;
        [[APIManager apiManager] loginWithDetailsfromServer:sendtoserverrequestData];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }
   
}

-(void)callRegisterationdetailsBySocial:(NSMutableDictionary *)result{
   
    if([loginType isEqualToString:@"Google"]){
        NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"login_via_google",@"section",[result valueForKey:@"email"],@"email",[result valueForKey:@"userId"],@"user_id",[result valueForKey:@"fname"],@"fname",[result valueForKey:@"lname"],@"lname",[result valueForKey:@"gender"],@"gender",[result valueForKey:@"fullName"],@"user_name",@"20/12/1988",@"birthday",[result valueForKey:@"url"],@"profile_image_url", nil];
        
        [APIManager apiManager].delegate = self;
        [[APIManager apiManager] GoogleloginWithDetailsfromServer:sendtoserverrequestData];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }else if([loginType isEqualToString:@"Facebook"]){
        NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"login_via_facebook",@"section",[result valueForKey:@"email"],@"email",[result valueForKey:@"id"],@"user_id",[result valueForKey:@"first_name"],@"fname",[result valueForKey:@"last_name"],@"lname",[result valueForKey:@"gender"],@"gender",[result valueForKey:@"name"],@"user_name",@"20/12/1988",@"birthday", nil];
        
        [APIManager apiManager].delegate = self;
        [[APIManager apiManager] fbloginWithDetailsfromServer:sendtoserverrequestData];
        [MBProgressHUD hideHUDForView:self.view animated:YES];

    }
    
}
-(void)getResponse:(NSMutableDictionary *)response serviceIdentifier:(NSString *)serviceIdentifier {
   dispatch_async(dispatch_get_main_queue(), ^{
       [MBProgressHUD hideHUDForView:self.view animated:YES];
        if([loginType isEqualToString:@"Facebook"]){
            [[TWMessageBarManager sharedInstance] showMessageWithTitle:[response valueForKey:@"message"] description:nil type:TWMessageBarMessageTypeSuccess statusBarStyle:[UIApplication sharedApplication].statusBarStyle callback:nil];
            if([[NSString stringWithFormat:@"%@",[response valueForKey:@"message"]]isEqualToString:@"Success"]){
                [[NSUserDefaults standardUserDefaults]setValue:[response valueForKey:@"USER_ID"] forKey:@"USER_ID"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                [self updateUserProfile:userGoogleDetails];
            }
        }else if([loginType isEqualToString:@"Facebook"]){
            [[TWMessageBarManager sharedInstance] showMessageWithTitle:[response valueForKey:@"message"] description:nil type:TWMessageBarMessageTypeSuccess statusBarStyle:[UIApplication sharedApplication].statusBarStyle callback:nil];
            if([[NSString stringWithFormat:@"%@",[response valueForKey:@"message"]]isEqualToString:@"Success"]){
                [[NSUserDefaults standardUserDefaults]setValue:[response valueForKey:@"USER_ID"] forKey:@"USER_ID"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                [self updateUserProfile:userGoogleDetails];
            }
        }else{
            [[TWMessageBarManager sharedInstance] showMessageWithTitle:[response valueForKey:@"message"] description:nil type:TWMessageBarMessageTypeSuccess statusBarStyle:[UIApplication sharedApplication].statusBarStyle callback:nil];
            if([[NSString stringWithFormat:@"%@",[response valueForKey:@"message"]]isEqualToString:@"Success"]){
                [[NSUserDefaults standardUserDefaults]setValue:[response valueForKey:@"USER_ID"] forKey:@"USER_ID"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
                [appDel createMenuView];
            }
        }
       
       
   });
    NSLog(@"response%@",response);
}

-(void)updateUserProfile:(NSMutableDictionary *)responsedesc{
     NSData *dataSave = [NSKeyedArchiver archivedDataWithRootObject:responsedesc];
    [[NSUserDefaults standardUserDefaults]setObject:dataSave forKey:@"responsedesc"];
    [[NSUserDefaults standardUserDefaults]synchronize];

    [[NSUserDefaults standardUserDefaults]setObject:@"UpdateProfile" forKey:@"registerationType"];
    [[NSUserDefaults standardUserDefaults]synchronize];
       AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDel createProfileView];
}

- (void)getFailResponse:(NSError *)errObj serviceIdentifier:(NSString *)serviceIdentifier {
    dispatch_async(dispatch_get_main_queue(), ^{
        //[MBProgressHUD hideHUDForView:self.view animated:YES];
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

#pragma mark - Google SignIn Delegate

//- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {
//    
//}
// Present a view that prompts the user to sign in with Google

- (void)signIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController
{
    [self presentViewController:viewController animated:YES completion:nil];
}
// Dismiss the "Sign in with Google" view

- (void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
//completed sign In


- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    NSString *userId = user.userID;                  // For client-side use only!
    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    NSString *fullName = user.profile.name;
    NSString *givenName = user.profile.givenName;
    NSString *familyName = user.profile.familyName;
    NSString *email = user.profile.email;
    NSURL *url = [user.profile imageURLWithDimension:100];
    userGoogleDetails = [[NSMutableDictionary alloc]initWithObjectsAndKeys:userId,@"userId",fullName,@"fullName",email,@"email",idToken,@"idToken",givenName,@"fname",url,@"url",familyName,@"lname",nil];
    [self callRegisterationdetailsBySocial:userGoogleDetails];
    
}


-(void)Login:(NSString *)token{
    
    if ([AppDelegate connectedToNetwork]) {
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.googleapis.com/oauth2/v2/userinfo"]];
        
        NSMutableURLRequest *request =
        [NSMutableURLRequest requestWithURL:url
                                cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                            timeoutInterval:10
         ];
        
        [request setHTTPMethod: @"GET"];
        
        
        
        [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable _data, NSURLResponse * _Nullable _response, NSError * _Nullable _error) {
           // NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) _response;
            NSMutableDictionary *response = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingAllowFragments error:&_error];
            NSLog(@"response ===>>> %@%@",response,_response);
            NSLog(@"%@",_response);
        }] resume];

       
        
    }
}

-(IBAction)newRegisterationWithStore:(id)sender{
    zhRegisterationViewController *storeRegisteration = [self.storyboard instantiateViewControllerWithIdentifier:@"zhRegisterationViewController"];
    storeRegisteration.registerationType = @"BuyerRegisteration";
    [self.navigationController pushViewController:storeRegisteration animated:YES];
    
}
-(IBAction)forgetPasswordPopUp:(id)sender{
    
    CustomAlertView *alertOverLay = [[CustomAlertView alloc]initWithNibName:@"CustomAlertView" bundle:nil];
    alertOverLay.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    alertOverLay.emailValue = _userName.text;
    alertOverLay.userType = @"buyer";
    alertOverLay.modalPresentationStyle = UIModalPresentationCustom;
    alertOverLay.preferredContentSize = CGSizeMake(300, 178);
    [self presentViewController:alertOverLay animated:YES completion:nil];
}


@end

