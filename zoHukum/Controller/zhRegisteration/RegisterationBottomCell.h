//
//  RegisterationBottomCell.h
//  zoHukum
//
//  Created by Vivek on 09/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "zoHukum-Swift.h"

@interface RegisterationBottomCell : UITableViewCell
@property(strong,nonatomic)IBOutlet MKTextField *mobilNo;
@property(strong,nonatomic)IBOutlet MKTextField *Otptxt;
@property(strong,nonatomic)IBOutlet UIButton *otpSender;
@property(strong,nonatomic)IBOutlet UIButton *checkBox;
@property(strong,nonatomic)IBOutlet UILabel *decsText;

@end
