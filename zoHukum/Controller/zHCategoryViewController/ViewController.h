//
//  ViewController.h
//  ObjCPlayStand
//
//  Created by vivek on 05/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIManager.h"

@interface ViewController : UIViewController<ZHApiManagerDelegate>

@property(strong,nonatomic)NSString *categoryID;
@property(strong,nonatomic)NSString *categoryName;
@property(strong,nonatomic)IBOutlet UILabel *marketPrice;
@property(strong,nonatomic)IBOutlet UILabel *productQuantity;
@end

