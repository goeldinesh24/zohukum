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

typedef void(^AlertViewActionBlock)(void);
@interface zHBuyersLoginView ()<GIDSignInUIDelegate,GIDSignInDelegate>{
    NSMutableArray *fbDetailsArray;
    NSString       *loginType;
}
@property (nonatomic, copy) void (^confirmActionBlock)(void);
@property (nonatomic, copy) void (^cancelActionBlock)(void);

@property(weak,nonatomic)IBOutlet UITextField *userName;
@property(weak,nonatomic)IBOutlet UITextField *userPassword;

-(IBAction)signInwithGoogle:(id)sender;
-(IBAction)signInwithfacebook:(id)sender;
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
    loginType = @"Google";
    [[GIDSignIn sharedInstance] signIn];
}

-(IBAction)signInwithfacebook:(id)sender{
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


-(void)callRegisterationdetailsBySocial:(NSMutableDictionary *)result{
    if([loginType isEqualToString:@"Google"]){
        NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"login_via_google",@"section",[result valueForKey:@"email"],@"email",[result valueForKey:@"id"],@"user_id",[result valueForKey:@"first_name"],@"fname",[result valueForKey:@"last_name"],@"lname",[result valueForKey:@"gender"],@"gender",[result valueForKey:@"name"],@"user_name",@"20/12/1988",@"birthday",@"",@"profile_image_url", nil];
        
        [APIManager apiManager].delegate = self;
        [[APIManager apiManager] fbloginWithDetailsfromServer:sendtoserverrequestData];

    }else{
        NSMutableDictionary *sendtoserverrequestData = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"login_via_facebook",@"section",[result valueForKey:@"email"],@"email",[result valueForKey:@"id"],@"user_id",[result valueForKey:@"first_name"],@"fname",[result valueForKey:@"last_name"],@"lname",[result valueForKey:@"gender"],@"gender",[result valueForKey:@"name"],@"user_name",@"20/12/1988",@"birthday", nil];
        
        [APIManager apiManager].delegate = self;
        [[APIManager apiManager] fbloginWithDetailsfromServer:sendtoserverrequestData];

    }
    
}
-(void)getResponse:(NSMutableDictionary *)response serviceIdentifier:(NSString *)serviceIdentifier {
   dispatch_async(dispatch_get_main_queue(), ^{
    [[TWMessageBarManager sharedInstance] showMessageWithTitle:[response valueForKey:@"message"] description:nil type:TWMessageBarMessageTypeSuccess statusBarStyle:[UIApplication sharedApplication].statusBarStyle callback:nil];
   });
    NSLog(@"response%@",response);
    
    
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
//    NSString *userId = user.userID;                  // For client-side use only!
//    NSString *idToken = user.authentication.idToken; // Safe to send to the server
//    NSString *fullName = user.profile.name;
//    NSString *givenName = user.profile.givenName;
//    NSString *familyName = user.profile.familyName;
//    NSString *email = user.profile.email;
//    NSURL *url = [user.profile imageURLWithDimension:100];
    NSMutableDictionary *userGoogleDetails = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"",@"userId",@"",@"fullName",@"",@"email",@"",@"idToken",@"",@"",@"",@"url",nil];
    [self Login:user.authentication.idToken];
    //[self callRegisterationdetailsBySocial:userGoogleDetails];
    
}


-(void)Login:(NSString *)token{
    
    if ([AppDelegate connectedToNetwork]) {
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.googleapis.com/oauth2/v3/userinfo?access_token=%@",token]];
        
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
    storeRegisteration.registerationType = @"StoreRegisteration";
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

