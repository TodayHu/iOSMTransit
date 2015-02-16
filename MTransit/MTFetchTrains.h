//
//  FetchTrains.h
//  MTransit
//
//  Created by Kelly Innes on 2/12/15.
//  Copyright (c) 2015 Kelly Innes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTSpoke.h"
#import "MTHub.h"

@interface MTFetchTrains : NSObject

+ (NSMutableArray *)fetchEastFalls;
+ (NSMutableArray *)fetchQueenLane;
+ (NSMutableArray *)fetchThirtiethToEF;
+ (NSMutableArray *)fetchThirtiethToQL;

@end
