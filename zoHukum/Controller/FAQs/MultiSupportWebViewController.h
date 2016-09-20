//
//  MultiSupportWebViewController.h
//  zoHukum
//
//  Created by Vivek on 13/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiSupportWebViewController : UIViewController<UIWebViewDelegate>
@property(weak,nonatomic)IBOutlet UIWebView *loadHtmlView;
@property(weak,nonatomic)IBOutlet UILabel *navigationTittlelbl;
@property(weak,nonatomic)NSString *pageUrl;
@property(weak,nonatomic)NSString *navigationTittleString;

-(IBAction)backtoCurrentViewController:(id)sender;
@end
