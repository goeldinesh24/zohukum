//
//  AppDelegate.h
//  ObjCExample
//
//  Created by Evgeny on 09.01.15.
//  Copyright (c) 2015 Evgeny Nazarov. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <netdb.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <bolts/bolts.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <SystemConfiguration/SystemConfiguration.h>

@import GoogleSignIn;

@interface AppDelegate : UIResponder <UIApplicationDelegate,GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;

extern BOOL connectionAvalablity;
+(BOOL)connectedToNetwork;


@end

