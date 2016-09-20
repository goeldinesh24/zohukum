//
//  zhContactUsViewController.h
//  zoHukum
//
//  Created by Vivek on 07/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface zhContactUsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property(strong,nonatomic)IBOutlet UITableView *contactTblView;
-(IBAction)backtoCurrentViewController:(id)sender;
@end
