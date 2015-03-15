//
//  MTSpoke.m
//  MTransit
//
//  Created by Kelly Innes on 3/15/15.
//  Copyright (c) 2015 Kelly Innes. All rights reserved.
//

#import "MTSpoke.h"

@implementation MTSpoke

+ (NSMutableArray *)results:(NSString *)apiURL forDirection:(NSString *)direction
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
    NSMutableDictionary *trainsHash = trainsHash = [NSJSONSerialization JSONObjectWithData:trainData options:NSJSONReadingMutableContainers error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    } else {
        
        NSString *dictKey;
        for (NSString *key in trainsHash) {
            dictKey = key;
        }
        NSArray *inbound = trainsHash[dictKey];
        NSDictionary *inboundTrains;
        if ([inbound[index] isKindOfClass:[NSDictionary class]]) {
            inboundTrains = inbound[index];
        } else {
            NSString *none = @"no upcoming trains";
            [trains addObject:none];
            return trains;
        }
        
        inbound = inboundTrains[direction];
        
        if ([inbound count] >= 2) {
            NSDictionary *trainOne = inbound[0];
            NSDictionary *trainTwo = inbound[1];
            NSString *trainOneNumber = trainOne[@"train_id"];
            NSString *trainTwoNumber = trainTwo[@"train_id"];
            NSString *trainOneTime = trainOne[@"depart_time"];
            NSString *trainTwoTime = trainTwo[@"depart_time"];
            
            [trains addObject:trainOneNumber];
            [trains addObject:trainOneTime];
            [trains addObject:trainTwoNumber];
            [trains addObject:trainTwoTime];
        } else if ([inbound count] == 1) {
            NSDictionary *trainOne = inbound[0];
            NSString *trainOneNumber = trainOne[@"train_id"];
            NSString *trainOneTime = trainOne[@"depart_time"];
            
            [trains addObject:trainOneNumber];
            [trains addObject:trainOneTime];
        } else {
            NSString *none = @"no upcoming trains";
            [trains addObject:none];
        }
    }
    
    return trains;
}

@end
