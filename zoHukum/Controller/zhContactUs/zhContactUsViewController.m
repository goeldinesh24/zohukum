//
//  zhContactUsViewController.m
//  zoHukum
//
//  Created by Vivek on 07/07/16.
//  Copyright © 2016 arunkumar. All rights reserved.
//

#import "zhContactUsViewController.h"
#import "CustomContactCell.h"
#import "CustomTextFieldCell.h"
#import "ZHMainViewController.h"

@interface zhContactUsViewController ()
{
    NSMutableArray      *textfieldPlaceholdertxt;
    NSMutableDictionary *textfieldValue;

}
@end

@implementation zhContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    textfieldValue          = [NSMutableDictionary new];
    textfieldPlaceholdertxt = [[NSMutableArray alloc]initWithObjects:@"",@"Name",@"Email id",@"Subject",@"Message", nil];
    
    for(int index=0; index<textfieldPlaceholdertxt.count; index++){
        [textfieldValue setValue:@"" forKey:[textfieldPlaceholdertxt objectAtIndex:index]];
    }
    
}

-(IBAction)backtoCurrentViewController:(id)sender{
    ZHMainViewController  *homeView = [self.storyboard instantiateViewControllerWithIdentifier:@"ZHMainViewController"];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    transition.type = kCATransitionFromLeft;
    [transition setType:kCATransitionPush];
    transition.subtype = kCATransitionFromLeft;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:homeView animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return textfieldPlaceholdertxt.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0){
        return 240;
    }else{
        return 67;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    if (indexPath.row==0) {
        
        static NSString *CellIdentifier = @"cell";
        CustomContactCell *cell = nil;
        cell = (CustomContactCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            cell = [[CustomContactCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        return cell;
    }else{
        static NSString *CellIdentifier = @"cells";
        CustomTextFieldCell *cells=nil;
        cells = (CustomTextFieldCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];;
        if (cells == nil)
        {
            cells = [[CustomTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        if([[NSString stringWithFormat:@"%@",[textfieldValue valueForKey:[textfieldPlaceholdertxt objectAtIndex:indexPath.row]]]isEqualToString:@""]){
            cells.contactusTxt.placeholder=[textfieldPlaceholdertxt objectAtIndex:indexPath.row];
        }else{
            cells.contactusTxt.text=[textfieldValue valueForKey:[textfieldPlaceholdertxt objectAtIndex:indexPath.row]];
        }
        
        cells.contactusTxt.layer.borderColor = [[UIColor clearColor]CGColor];
        cells.contactusTxt.tag=indexPath.row;
        cells.contactusTxt.delegate=self;
        return cells;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"new%d",(int)indexPath.row);
    
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [textfieldValue setValue:textField.text forKey:[textfieldPlaceholdertxt objectAtIndex:textField.tag]];
}


-(IBAction)getalltextfieldValue:(id)sender{
    // NSLog(@"%@",regFormValue);
}

@end
