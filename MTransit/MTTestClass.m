//
//  MTTestClass.m
//  MTransit
//
//  Created by Kelly Innes on 2/23/15.
//  Copyright (c) 2015 Kelly Innes. All rights reserved.
//

#import "MTTestClass.h"

@implementation MTTestClass

+ (NSString *)fetchEFTrains
{
    NSString *train = @"Train 123 / 12:30pm";
    return train;
}
+ (NSString *)fetchQLTrains
{
    NSString *train = @"Train 456 / 3:45am";
    return train;
}

@end
