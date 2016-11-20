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
#import "UITableView+SlideMenuControllerOC.h"
#import "UIViewController+SlideMenuControllerOC.h"
#import "APIManager.h"
#import "ViewController.h"
#import "MAKDropDownMenu.h"

@interface MultiSupportWebViewController ()

@end

@implementation MultiSupportWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.navigationController.navigationBar setHidden:YES];
    _loadHtmlView.delegate    = self;
    _navigationTittlelbl.text = _navigationTittleString;
    NSURL *websiteUrl         = [NSURL URLWithString:_pageUrl];
    NSURLRequest *urlRequest  = [NSURLRequest requestWithURL:websiteUrl];
    [_loadHtmlView loadRequest:urlRequest];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    int userID = [[[NSUserDefaults standardUserDefaults]valueForKey:@"USER_ID"] intValue];
    if(userID>0 && ![_social isEqualToString:@"social"]){
        self.navigationController.navigationBar.hidden = NO;
        self.view.backgroundColor = [UIColor whiteColor];
        [_headerNavView setHidden:YES];
        [self setNavigationBarItem];

    }else{
        self.view.backgroundColor = [UIColor darkGrayColor];
        self.navigationController.navigationBar.hidden = YES;
        [_headerNavView setHidden:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)backtoCurrentViewController:(id)sender{
    if([_social isEqualToString:@"social"]){
        self.navigationController.navigationBar.hidden = NO;
        [self.navigationController popViewControllerAnimated:YES];
    }else{
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
    
}

#pragma Web View Delegate Methods



- (void)webViewDidStartLoad:(UIWebView *)webView {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.loadHtmlView animated:YES];
    hud.labelText = @"Loading..";
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideHUDForView:self.loadHtmlView animated:YES];
    [MBProgressHUD hideAllHUDsForView:self.loadHtmlView animated:YES];
    
}

@end
