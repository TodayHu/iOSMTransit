//
//  MTHub.m
//  MTransit
//
//  Created by Kelly Innes on 3/15/15.
//  Copyright (c) 2015 Kelly Innes. All rights reserved.
//

#import "MTHub.h"

@implementation MTHub

+ (NSMutableArray *)results:(NSString *)apiURL forDirection:(NSString *)direction toDestination:(NSString *)destination
{
    int index;
    if ([direction isEqualToString:@"Northbound"]) {
        index = 0;
    } else {
        index = 1;
    }
    
    NSMutableArray *trains = [NSMutableArray array];
    NSData *trainData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:apiURL]];
    NSError *error;
    NSMutableDictionary *trainsHash = [NSJSONSerialization JSONObjectWithData:trainData options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    } else {
        NSString *dictKey;
        for (NSString *key in trainsHash) {
            dictKey = key;
        }
        NSArray *outbound = trainsHash[dictKey];
        NSDictionary *trainDict = outbound[index];
        
        if ([outbound[index] isKindOfClass:[NSDictionary class]]) {
            trainDict = outbound[index];
        } else {
            NSString *none = @"no upcoming trains";
            [trains addObject:none];
            return trains;
        }
        
        NSArray *obTrains = trainDict[direction];
        for (int i = 0; i < [obTrains count]; i++) {
            NSDictionary *temp = obTrains[i];
            if ([temp[@"destination"] isEqualToString:destination]) {
                NSString *trainOneNumber = temp[@"train_id"];
                NSString *trainOneTime = temp[@"depart_time"];
                [trains addObject:trainOneNumber];
                [trains addObject:trainOneTime];
            }
        }
    }
    
    return trains;
}

@end
