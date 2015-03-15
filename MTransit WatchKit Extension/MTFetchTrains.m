//
//  MTFetchTrains.m
//  MTransit
//
//  Created by Kelly Innes on 3/15/15.
//  Copyright (c) 2015 Kelly Innes. All rights reserved.
//

#import "MTFetchTrains.h"

@implementation MTFetchTrains

+ (NSMutableArray *)fetchThirtiethToEF
{
    NSString *apiURL = @"http://www3.septa.org/hackathon/Arrivals/30th%20Street%20Station/50";
    NSString *direction = @"Northbound";
    NSString *destination = @"Norristown";
    NSMutableArray *trains = [NSMutableArray array];
    trains = [MTHub results:apiURL forDirection:direction toDestination:destination];
    return trains;
}

+ (NSMutableArray *)fetchThirtiethToQL
{
    NSString *apiURL = @"http://www3.septa.org/hackathon/Arrivals/30th%20Street%20Station/50";
    NSString *direction = @"Southbound";
    NSString *destination = @"Chestnut H West";
    NSMutableArray *trains = [NSMutableArray array];
    trains = [MTHub results:apiURL forDirection:direction toDestination:destination];
    return trains;
}

+ (NSMutableArray *)fetchEastFalls
{
    NSString *apiURL = @"http://www3.septa.org/hackathon/Arrivals/East%20Falls/20";
    NSString *direction = @"Southbound";
    NSMutableArray *trains = [NSMutableArray array];
    trains = [MTSpoke results:apiURL forDirection:direction];
    return trains;
}

+ (NSMutableArray *)fetchQueenLane
{
    NSString *apiURL = @"http://www3.septa.org/hackathon/Arrivals/Queen%20Lane/20";
    NSString *direction = @"Northbound";
    NSMutableArray *trains = [NSMutableArray array];
    trains = [MTSpoke results:apiURL forDirection:direction];
    return trains;
}

@end
