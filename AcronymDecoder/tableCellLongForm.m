//
//  tableCell.m
//  AcronymDecoder
//
//  Created by Sonia Reddy Kolli.
//  Copyright (c) 2015 Sonia Reddy Kolli. All rights reserved.
//

#import "tableCellLongForm.h"

@implementation tableCellLongForm

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

+ (NSString *)identifier
{
    return @"tableCellLongForm";
}

+ (tableCellLongForm *)cell
{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"tableCellLongForm" owner:self options:nil];
    for (id currentObject in nibContents) {
        if ([currentObject isKindOfClass:[tableCellLongForm class]]) {
            return currentObject;
        }
    }
    return nil;
}

@end
