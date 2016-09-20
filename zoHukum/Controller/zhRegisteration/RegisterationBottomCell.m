//
//  RegisterationBottomCell.m
//  zoHukum
//
//  Created by Vivek on 09/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import "RegisterationBottomCell.h"

@implementation RegisterationBottomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _mobilNo.layer.borderColor   = [[UIColor clearColor]CGColor];
    _Otptxt.layer.borderColor = [[UIColor clearColor]CGColor];
    _mobilNo.placeholder=@"Mobile no";
    _Otptxt.placeholder=@"Otp";
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
