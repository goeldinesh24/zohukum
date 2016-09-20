//
//  CustomContactCell.h
//  zoHukum
//
//  Created by Vivek on 07/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomContactCell : UITableViewCell

@property(strong,nonatomic)IBOutlet UIImageView *contactusLogo;

@property(strong,nonatomic)IBOutlet UIButton *phonelogo;
@property(strong,nonatomic)IBOutlet UIButton *emailLogo;
@property(strong,nonatomic)IBOutlet UIButton *homeicon;

@property(strong,nonatomic)IBOutlet UILabel *addressLocal;
@property(strong,nonatomic)IBOutlet UILabel *updatedAddress;
@property(strong,nonatomic)IBOutlet UILabel *phonelbl;
@property(strong,nonatomic)IBOutlet UILabel *emaillbl;

@property(strong,nonatomic)IBOutlet UIButton *mobileNo;
@property(strong,nonatomic)IBOutlet UIButton *emailAddress;

@end
