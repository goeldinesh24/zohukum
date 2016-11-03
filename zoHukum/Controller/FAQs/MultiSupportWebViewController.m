//
//  MultiSupportWebViewController.m
//  zoHukum
//
//  Created by Vivek on 13/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import "MultiSupportWebViewController.h"
#import "ZHMainViewController.h"
#import "MBProgressHUD.h"
#import "BuyerSliderMenu.h"

@interface MultiSupportWebViewController ()

@end

@implementation MultiSupportWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    _loadHtmlView.delegate    = self;
    _navigationTittlelbl.text = _navigationTittleString;
    NSURL *websiteUrl         = [NSURL URLWithString:_pageUrl];
    NSURLRequest *urlRequest  = [NSURLRequest requestWithURL:websiteUrl];
    [_loadHtmlView loadRequest:urlRequest];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backtoCurrentViewController:(id)sender{
    ZHMainViewController  *homeView = [self.storyboard instantiateViewControllerWithIdentifier:@"ZHMainViewController"];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    transition.type = kCATransitionFromLeft;
    [transition setType:kCATransitionPush];
    transition.subtype = kCATransitionFromLeft;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:homeView animated:NO];
}

#pragma Web View Delegate Methods



- (void)webViewDidStartLoad:(UIWebView *)webView {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.loadHtmlView animated:YES];
    hud.labelText = @"Loading..";
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideHUDForView:self.loadHtmlView animated:YES];
}

@end
