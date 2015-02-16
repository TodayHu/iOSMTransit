//
//  FetchTrains.m
//  MTransit
//
//  Created by Kelly Innes on 2/12/15.
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

/*
 
 Preset methods for adding new stations and routes.
 
 - Add method interface to "MTFetchTrains.h"
 - Choose implementation based on whether the station's a hub or a spoke
 
 For stations which are "hubs," defined as those which service
 more than one Regional Rail line (like 30th Street Station):
 
 + (NSMutableArray *)fetchStationName
 {
    // set apiURL to the station's hackathon URL, with # of trains to return
    NSString *apiURL = @"http://www3.septa.org/hackathon/Arrivals/30th%20Street%20Station/50";
    // set direction to the direction of the train as defined by SEPTA
    NSString *direction = @"Northbound";
    // note: sometimes the SEPTA-defined direction's the opposite of
    // what you'd think!
 
    // set destination to the train's end destination
    NSString *destination = @"Norristown";
 
    NSMutableArray *trains = [NSMutableArray array];
    trains = [MTHub results:apiURL forDirection:direction toDestination:destination];
    return trains;
 }
 
 For stations which are "spokes," defined as those which service
 just one Regional Rail line (like Queen Lane Station):
 
 + (NSMutableArray *)fetchStationName
 {
    // set apiURL to the station's hackathon URL, with # of trains to return
    NSString *apiURL = @"http://www3.septa.org/hackathon/Arrivals/East%20Falls/20";
 
    // set direction to the direction of the train as defined by SEPTA
    NSString *direction = @"Southbound";
    // or "Northbound" for trains to Norristown
 
    NSMutableArray *trains = [NSMutableArray array];
    trains = [MTSpoke results:apiURL forDirection:direction];
    return trains;
 }
 
*/

@end
