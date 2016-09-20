//
//  MenuItemsTVC.h
//  ObjCExample
//
//  Created by Evgeny on 09.01.15.
//  Copyright (c) 2015 Evgeny Nazarov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEWebservice.h"
#import "APIManager.h"

@interface MenuItemsTVC : UITableViewController<ZHApiManagerDelegate>
@property(nonatomic,strong)NSMutableArray *listofMenuItems;
@property(nonatomic,strong)NSMutableArray *listofMenuItemsiD;
@property(nonatomic,strong)NSMutableArray *topListofMenuItems;
@property(nonatomic,strong)NSMutableArray *topListofMenuItemsID;
@end
