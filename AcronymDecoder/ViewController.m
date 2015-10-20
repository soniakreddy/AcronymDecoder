//
//  ViewController.m
//  AcronymDecoder
//
//  Created by Sonia Reddy Kolli.
//  Copyright (c) 2015 Sonia Reddy Kolli. All rights reserved.
//

#import "ViewController.h"
#import "AcronymViewController.h"
#import "DataObjects.h"
#import "Defines.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"


@interface ViewController () <MBProgressHUDDelegate> {
    MBProgressHUD *HUD;
    long long expectedLength;
    long long currentLength;
    SFObject *sf;
    IBOutlet UITextField *text;
}

@end

static NSString * const baseUrl = @"http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=%@&If=%@";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"backgrounder.png"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButtonPressed:(id)sender {
    
    AcronymViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"AcronymViewController"];
    
    NSString *urlString = [NSString stringWithFormat:baseUrl,text.text,text.text];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    //    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/json"];
    
    
    // 3
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (!((NSArray*)responseObject).count) {
            [HUD removeFromSuperview];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Server Error"
                                                                message:@"No Results"
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
        else{
            
            NSDictionary *resultDict = [responseObject objectAtIndex:0];
            sf = nil;
            sf = [[SFObject alloc] init];
            sf.shortForm = [resultDict objectForKey:KEY_SFORM];
            NSArray *longForms = [resultDict objectForKey:KEY_LFORMS];
            
            NSMutableArray *longFormStorageArray = [[NSMutableArray alloc] initWithCapacity:longForms.count];
            
            for (NSDictionary *longFormObjDict in longForms) {
                LFObject *lf = [[LFObject alloc] init];
                lf.longForm = [longFormObjDict objectForKey:KEY_LFORM];
                lf.frequency = [[longFormObjDict objectForKey:KEY_FREQ] intValue];
                lf.establishedYear = [[longFormObjDict objectForKey:KEY_SINCE] intValue];
                
                NSArray *lfVariants = [longFormObjDict objectForKey:KEY_VARS];
                NSMutableArray *lfVariantsArray = [[NSMutableArray alloc] initWithCapacity:lfVariants.count];
                for (NSDictionary *lfVarDict in lfVariants) {
                    
                    LFObject *lfVariant = [[LFObject alloc] init];
                    lfVariant.longForm = [lfVarDict objectForKey:KEY_LFORM];
                    lfVariant.frequency = [[lfVarDict objectForKey:KEY_FREQ] intValue];
                    lfVariant.establishedYear = [[lfVarDict objectForKey:KEY_SINCE] intValue];
                    lfVariant.longFormVariants = nil;
                    
                    [lfVariantsArray addObject:lfVariant];
                }
                lf.longFormVariants = [[NSArray alloc] initWithArray:lfVariantsArray];
                [longFormStorageArray addObject:lf];
            }
            
            sf.longForms = [[NSArray alloc] initWithArray:longFormStorageArray];
            fvc.resultObject = sf;
            [self.navigationController pushViewController:fvc animated:YES];
            [HUD removeFromSuperview];
        }
      
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        [HUD removeFromSuperview];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Server Error"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    // 5
    [operation start];

    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    
    HUD.delegate = self;
    HUD.labelText = @"Loading";
    [HUD show:YES];

//    [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}

#pragma mark - MBProgressHUDDelegate

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
    HUD = nil;
}

#pragma mark - Textfield delegate

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"textFieldDidEndEditing");
}

-(IBAction)clearText:(id)sender{
    text.text = @"";
}

@end
