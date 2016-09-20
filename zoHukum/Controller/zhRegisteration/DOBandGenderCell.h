//
//  DOBandGenderCell.h
//  zoHukum
//
//  Created by Vivek on 09/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButton.h"
@class RadioButton;
@interface DOBandGenderCell : UITableViewCell
@property(strong,nonatomic)IBOutlet UILabel *dobLbl;
@property(strong,nonatomic)IBOutlet UILabel *genderLbl;
@property(strong,nonatomic)IBOutlet UIButton *dobSelection;
@property(strong,nonatomic)IBOutlet RadioButton *genderSelectionM;
@property(strong,nonatomic)IBOutlet RadioButton *genderSelectionF;
@end
