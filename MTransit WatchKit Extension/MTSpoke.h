//
//  MTSpoke.h
//  MTransit
//
//  Created by Kelly Innes on 3/15/15.
//  Copyright (c) 2015 Kelly Innes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTSpoke : NSObject

+ (NSMutableArray *)results:(NSString *)apiURL forDirection:(NSString *)direction;

@end
