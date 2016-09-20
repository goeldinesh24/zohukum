//
//  DropDownTableViewCell.h
//  zoHukum
//
//  Created by Vivek on 08/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropDownTableViewCell : UITableViewCell
@property(strong,nonatomic)IBOutlet UILabel *fullAddress;
@property(strong,nonatomic)IBOutlet UIButton *addressValue;

@property(strong,nonatomic)IBOutlet UILabel *catType;
@property(strong,nonatomic)IBOutlet UIButton *catTypesValue;

@end
