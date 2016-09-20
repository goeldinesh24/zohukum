//
//  CustomAlertView.m
//  zoHukum
//
//  Created by Vivek on 18/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import "CustomAlertView.h"
#import "APIManager.h"
#import "TWMessageBarManager.h"
#import "MBProgressHUD.h"
@interface CustomAlertView ()<ZHApiManagerDelegate>

@end

@implementation CustomAlertView

- (void)viewDidLoad {
    [super viewDidLoad];
    _emailTxtfield.layer.borderColor = [[UIColor clearColor]CGColor];
    _emailTxtfield.text = _emailValue;
    [APIManager apiManager].delegate = self;
        
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)dismissPopupAlert:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)callForgetpasswordService:(id)sender{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading..";
    NSMutableDictionary *sendForgrtDetailstoServer = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"forget_password",@"section",_emailTxtfield.text,@"email",_userType,@"user_type_forget", nil];
    [self dismissViewControllerAnimated:YES completion:^{
        [APIManager apiManager].delegate = self;
        [[APIManager apiManager] FrogetPasswordDetailsSendToServer:sendForgrtDetailstoServer];
    }];


}
-(void)getResponse:(NSMutableDictionary *)response serviceIdentifier:(NSString *)serviceIdentifier {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:[response valueForKey:@"message"] description:nil type:TWMessageBarMessageTypeSuccess statusBarStyle:[UIApplication sharedApplication].statusBarStyle callback:nil];
    });
    
    
}

- (void)getFailResponse:(NSError *)errObj serviceIdentifier:(NSString *)serviceIdentifier {
    dispatch_async(dispatch_get_main_queue(), ^{
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
