//
//  HeaderView.h
//  AcronymDecoder
//
//  Created by Sonia Reddy Kolli.
//  Copyright (c) 2015 Sonia Reddy Kolli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyHeaderView : UIView{
    
    UIColor *headerViewColor;
    UIColor *headerTextColor;
}

@property (nonatomic, strong) UIColor *bgTopColor;
@property (nonatomic, strong) UIColor *bgBottomColor;

- (void) setTextColor:(UIColor*) textColor;

- (void) setUpHeaderImageWithName:(NSString*)imageName andFrame:(CGRect)frame;
- (void) setUpHeaderViewWithText:(NSString*)text andTag:(int)tag;

@end