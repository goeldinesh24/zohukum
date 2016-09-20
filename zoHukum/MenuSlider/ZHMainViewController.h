//
//  ZHMainViewController.h
//  ObjCExample
//
//  Created by chetu on 7/1/16.
//  Copyright © 2016 Evgeny Nazarov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RadioButton;

@interface ZHMainViewController : UIViewController<UISearchBarDelegate,UISearchDisplayDelegate,UISearchControllerDelegate,UISearchResultsUpdating,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) IBOutlet RadioButton* radioButton;
@property(strong,nonatomic)IBOutlet UIButton *sideMenuBtn;
@property (nonatomic, strong) IBOutlet UILabel* statusLabel;
-(IBAction)onRadioBtn:(id)sender;
@property(strong,nonatomic)IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *retalerBtn;
- (IBAction)retailerBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *wholesaleBtn;
- (IBAction)wholesaleBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *agreegationBtn;
- (IBAction)agreegationBtn:(id)sender;

@end
