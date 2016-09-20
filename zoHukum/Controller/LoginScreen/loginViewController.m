//
//  loginViewController.m
//  zoHukum
//
//  Created by arunkumar on 10/04/1938 Saka.
//  Copyright © 1938 Saka arunkumar. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initwithbackButton];
    // Do any additional setup after loading the view.
}

-(void)initwithbackButton{
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Back.png"]style:UIBarButtonItemStylePlain target:self action:@selector(BackBtn)];
    self.navigationItem.leftBarButtonItem = backButton;
   // self.navigationItem.hidesBackButton = YES;
    
    UIBarButtonItem *Button = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Back.png"]style:UIBarButtonItemStylePlain target:self action:@selector(BackBtn)];
    self.navigationItem.rightBarButtonItem = Button;
//self.navigationItem.hidesBackButton = YES;
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.title = @"gbjnfgjfj";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}


-(void) BackBtn {
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
