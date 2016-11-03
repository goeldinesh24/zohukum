//
//  MMTableViewController.h
//  ObjCPlayStand
//
//  Created by vivek on 05/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "zoHukumConstant.h"

@interface MMTableViewController : BaseViewController
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *demoArry;
@property (strong,nonatomic) NSString *tittleTxt;
@property (strong,nonatomic) NSMutableArray *tableViewdataArray;
@property (strong,nonatomic) NSMutableDictionary *subCatMenuDetailsDesc;

@end
