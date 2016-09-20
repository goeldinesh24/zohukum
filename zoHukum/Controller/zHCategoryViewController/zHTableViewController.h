//
//  zHTableViewController.h
//  zoHukum
//
//  Created by Vivek on 19/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface zHTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@end
