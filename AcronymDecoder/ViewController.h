//
//  ViewController.h
//  AcronymDecoder
//
//  Created by Sonia Reddy Kolli.
//  Copyright (c) 2015 Sonia Reddy Kolli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *acronymTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *optionsSegmentControl;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;

- (IBAction)searchButtonPressed:(id)sender;

@end

