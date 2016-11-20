//
//  PlayListTableViewCell.h
//  ObjCPlayStand
//
//  Created by Mukesh on 06/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *titleNews;
@property (weak, nonatomic) IBOutlet UILabel *descNews;
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UILabel *weight;
@property (weak, nonatomic) IBOutlet UIButton *price;
@property (weak, nonatomic) IBOutlet UIButton *minus;
@property (weak, nonatomic) IBOutlet UIButton *plus;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *brand;
@property (weak, nonatomic) IBOutlet UIButton *addtoCartProduct;
@property (weak, nonatomic) IBOutlet UIButton *buyListProduct;
@property (weak, nonatomic) IBOutlet UIView *plusMinusView;
@property (weak, nonatomic) IBOutlet UITextField *quantityOfSelectediTem;
-(IBAction)increaseQuantityOfSelectedProduct:(id)sender;
-(IBAction)decreaseQuantityOfSelectedProduct:(id)sender;

@end
