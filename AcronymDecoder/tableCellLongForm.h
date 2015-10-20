//
//  tableCell.h
//  AcronymDecoder
//
//  Created by Sonia Reddy Kolli.
//  Copyright (c) 2015 Sonia Reddy Kolli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableCellLongForm : UITableViewCell

@property(nonatomic,strong) IBOutlet UILabel *frequency;
@property(nonatomic,strong) IBOutlet UILabel *year;
@property(nonatomic,strong) IBOutlet UILabel *lf;


+ (tableCellLongForm *)cell;

@end
