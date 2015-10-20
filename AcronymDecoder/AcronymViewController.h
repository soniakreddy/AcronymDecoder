//
//  AcronymViewController.h
//  AcronymDecoder
//
//  Created by Sonia Reddy Kolli.
//  Copyright (c) 2015 Sonia Reddy Kolli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataObjects.h"

@interface AcronymViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong) IBOutlet UITableView *tblWithSections;

@property(nonatomic,strong) SFObject *resultObject;

@end
