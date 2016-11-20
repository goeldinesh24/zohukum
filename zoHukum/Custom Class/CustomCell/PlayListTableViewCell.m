//
//  PlayListTableViewCell.m
//  ObjCPlayStand
//
//  Created by Mukesh on 06/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import "PlayListTableViewCell.h"
#import "UIColor+HexRepresentation.h"
@implementation PlayListTableViewCell

- (void)awakeFromNib {
    
    _titleNews.font=[UIFont fontWithName:@"Roboto-Medium" size:18];
    _descNews.font=[UIFont fontWithName:@"Roboto-Medium" size:14];
    _descNews.textColor=[UIColor lightGrayColor];
    _headerImage.clipsToBounds=true;
    _headerImage.contentMode=UIViewContentModeScaleAspectFill;

    _middleView.layer.shadowColor=[UIColor blackColor].CGColor;
    _middleView.layer.shadowRadius = 8.0;
    _middleView.layer.shadowOpacity  = 1.0;
    _middleView.layer.masksToBounds=true;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(IBAction)increaseQuantityOfSelectedProduct:(id)sender{
    int incrementedValue;
    if([_quantityOfSelectediTem.text intValue]>=0){
        incrementedValue =[_quantityOfSelectediTem.text intValue]+1;
        _quantityOfSelectediTem.text = [NSString stringWithFormat:@"%d",incrementedValue];
       }
}
-(IBAction)decreaseQuantityOfSelectedProduct:(id)sender{
    int decrementedValue;
    if([_quantityOfSelectediTem.text intValue]>0){
        decrementedValue =[_quantityOfSelectediTem.text intValue]-1;
        _quantityOfSelectediTem.text = [NSString stringWithFormat:@"%d",decrementedValue];
        
    }
}

@end
