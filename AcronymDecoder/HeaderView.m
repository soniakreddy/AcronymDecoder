//
//  HeaderView.m
//  AcronymDecoder
//
//  Created by Sonia Reddy Kolli.
//  Copyright (c) 2015 Sonia Reddy Kolli. All rights reserved.
//


#import "headerView.h"


@implementation MyHeaderView



@synthesize bgTopColor;
@synthesize bgBottomColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

- (void)drawRect:(CGRect)rect {
    
    CGRect topRect = CGRectMake(0, 0, rect.size.width, rect.size.height - 4.0);
    if (!self.bgTopColor) {
        self.bgTopColor = [UIColor colorWithRed:180/255.0 green:100/255.0 blue:231/255.0 alpha:1.0];
    }
    [self.bgTopColor setFill];
    UIRectFill( topRect );
    
    CGRect bottomRect = CGRectMake(0, rect.size.height - 4.0, rect.size.width, 4.0);
    if (!self.bgBottomColor) {
        self.bgTopColor = [UIColor colorWithRed:180/255.0 green:100/255.0 blue:231/255.0 alpha:1.0];
    }
    [self.bgBottomColor setFill];
    UIRectFill( bottomRect );
}

- (void) setHeaderBackgroundColor:(UIColor*) headerColor{
    headerViewColor = headerColor;
}

- (void) setTextColor:(UIColor*) textColor{
    headerTextColor = textColor;
}


- (void) setUpHeaderViewWithText:(NSString*)text andTag:(int)tag{
    self.tag                        = tag;
    UILabel *headerString           = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width-self.frame.size.height - (2*10), self.frame.size.height)];
    headerString.backgroundColor    = [UIColor clearColor];
    headerString.text               = text;
    headerString.textAlignment      = NSTextAlignmentLeft;
    headerString.font               = [UIFont systemFontOfSize:16];
    
    if (headerTextColor) {
        headerString.textColor      = headerTextColor;
    } else {
        headerString.textColor      = [UIColor blackColor];
    }
    
    [self addSubview:headerString];
}

- (void) setUpHeaderImageWithName:(NSString*)imageName andFrame:(CGRect)frame{
    UIImageView *imgExpandCollapse        = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    imgExpandCollapse.autoresizingMask    = UIViewAutoresizingFlexibleLeftMargin;
    imgExpandCollapse.frame               = frame;
    [self addSubview:imgExpandCollapse];
}

@end

