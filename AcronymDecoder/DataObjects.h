//
//  SFObject.h
//  AFNetworkingTryout
//
//  Created by Sonia Reddy Kolli.
//  Copyright (c) 2015 Sonia Reddy Kolli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFObject : NSObject

@property(nonatomic,strong) NSString *shortForm;
@property(nonatomic,strong) NSArray *longForms;

@end



@interface LFObject : NSObject

@property(nonatomic,strong) NSString *longForm;
@property(nonatomic) int frequency;
@property(nonatomic) int establishedYear;
@property(nonatomic,strong) NSArray *longFormVariants;

@end
