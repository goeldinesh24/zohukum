//
//  MultiSupportWebViewController.h
//  zoHukum
//
//  Created by Vivek on 13/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideMenuController.h"

@interface MultiSupportWebViewController : UIViewController<UIWebViewDelegate , UISplitViewControllerDelegate>
@property(weak,nonatomic)IBOutlet UIWebView *loadHtmlView;
@property(weak,nonatomic)IBOutlet UILabel *navigationTittlelbl;
@property(strong,nonatomic)NSString *pageUrl;
@property(weak,nonatomic)NSString *social;
@property(weak,nonatomic)NSString *navigationTittleString;
@property(strong,nonatomic)IBOutlet UIView *headerNavView;
-(IBAction)backtoCurrentViewController:(id)sender;
@end
