//
//  ViewController.m
//  ObjCPlayStand
//
//  Created by Mukesh on 05/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import "ViewController.h"
#import "MMContainerViewController.h"
#import "MMTableViewController.h"
#import "MMCollectionViewController.h"
@interface ViewController (){
    NSMutableArray *arrCont;
    NSMutableDictionary *mainDesc;
}
@property (nonatomic , strong ) MMContainerViewController *containerVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mainDesc = [NSMutableDictionary new];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_sub_category",@"section",@"57",@"category", nil];
    
    [self callXMLTrans2CgiWithPayload:@"get_sub_category" andDataArray:dic completion:^(NSMutableDictionary *responseDictionary){
        NSMutableDictionary *loopValue = [NSMutableDictionary new];
        arrCont = [NSMutableArray new];
        NSMutableArray *arraID= [responseDictionary valueForKey:@"id"];
        NSMutableArray *arratitle= [responseDictionary valueForKey:@"title"];
        for (int i=0; i<arraID.count; i++) {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_sub_category_product",@"section",[NSString stringWithFormat:@"%@",[arraID objectAtIndex:i]],@"sub_cat_id", nil];
            [self callXMLTrans2CgiWithPayload:@"get_sub_category_product" andDataArray:dic completion:^(NSMutableDictionary *responseDictionary){
                // [loopValue setObject:responseDictionary forKey:[arraID objectAtIndex:i]];
                NSLog(@"%@",loopValue);
                //dispatch_async(dispatch_get_main_queue(), ^{
                // Update the UI
                
                MMTableViewController *vc_one;
                
                NSMutableArray * loopValue2 = [responseDictionary valueForKey:@"title"];
                NSLog(@"%@",loopValue2);
                //for (int i=0; i<loopValue2.count-6; i++) {
                vc_one = [self.storyboard instantiateViewControllerWithIdentifier:@"demo"];
                vc_one.title =[arratitle objectAtIndex:i];
                vc_one.logoColor = @"4caf50";
                vc_one.logoImage = @"highlights";
                vc_one.tableViewdataArray=loopValue2;
                [arrCont addObject:vc_one];
                //  }
                //});
            }];
            
        }
        self.containerVC = [[MMContainerViewController alloc] initWithControllers:[arrCont mutableCopy] parentViewController:self];
        for (MMTableViewController*vc in arrCont) {
            if ([vc isKindOfClass: [MMTableViewController class]]){
                vc.scrolldeleagte = self.containerVC ;
            }
        }
        // self.containerVC.itemViewColorArray = @[@"4caf50",@"009688",@"673ab7",@"ff9800",@"9c27b0"];
        self.containerVC.menuItemFont = [UIFont fontWithName:@"Roboto-Medium" size:15];
        self.containerVC.menuIndicatorColor = [UIColor whiteColor];
        [self.view addSubview:self.containerVC.view];
        
    }];
}


- (void)callXMLTrans2CgiWithPayload:(NSString *)serviceIdenifier andDataArray:(NSMutableDictionary *)dic completion:(void (^)(NSMutableDictionary * finised))completion {
    NSString * post;
    //    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"get_main_category",@"section", nil];
    int count =0;
    NSMutableString *str2= [NSMutableString new];
    for(NSString *dataValue in [dic allKeys]){
        post =[dataValue stringByAppendingString:[NSString stringWithFormat:@"=%@",[dic valueForKey:dataValue]]];
        if(count>0){
            
            [str2 appendString:[NSString stringWithFormat:@"&%@",post]];
        }else{
            [str2 appendString:post];
        }
        
        count++;
    }
    
    NSData *postdata= [str2 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength=[NSString stringWithFormat:@"%lu",(unsigned long)[postdata length]];
    NSMutableURLRequest *request= [[NSMutableURLRequest alloc]init];
    
    NSString *str=@"https://www.zohukum.com/apps/";
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@.php",str,serviceIdenifier]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"Basic em9odWt1bTp6b2h1a3VtMTIz" forHTTPHeaderField:@"Authorization"];
    [request setHTTPBody:postdata];
    __block NSMutableDictionary * innerJson = [NSMutableDictionary new];
    //  [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable _data, NSURLResponse * _Nullable _response, NSError * _Nullable _error) {
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    innerJson = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    mainDesc = innerJson;
    completion([mainDesc copy]);
    NSLog(@"%@",mainDesc);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
