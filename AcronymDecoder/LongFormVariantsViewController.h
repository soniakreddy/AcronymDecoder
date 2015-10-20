//
//  LongFormVariantsViewController.h
//  AcronymDecoder
//
//  Created by Sonia Reddy Kolli.
//  Copyright (c) 2015 Sonia Reddy Kolli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LongFormVariantsViewController : UIViewController

@property(nonatomic,strong) IBOutlet UITableView *longFormView;
@property(nonatomic,strong) NSArray *longFormVariants;
@end
