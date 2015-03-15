//
//  InterfaceController.m
//  MTransit WatchKit Extension
//
//  Created by Kelly Innes on 2/23/15.
//  Copyright (c) 2015 Kelly Innes. All rights reserved.
//

#import "InterfaceController.h"
#import "MTFetchTrains.h"

@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *norristownLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *trainOneLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *queenLaneLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *trainTwoLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *buttonText;
@property int inboundOutboundFlag;

@end


@implementation InterfaceController



- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    [_norristownLabel setText:@" East Falls to 30th"];
    [_queenLaneLabel setText:@" Queen Ln to 30th"];
    [_trainOneLabel setText:@" "];
    [_trainTwoLabel setText:@" "];
    [self inbound];
    [_buttonText setTitle:@"Inbound"];
    [_buttonText setEnabled:YES];
    _inboundOutboundFlag = 0;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)buttonPressed {
    if (_inboundOutboundFlag == 0) {
        [_norristownLabel setText:@" 30th to East Falls"];
        [_queenLaneLabel setText:@" 30th to Queen Ln"];
        [_trainOneLabel setText:@" "];
        [_trainTwoLabel setText:@" "];
        [_buttonText setTitle:@"Outbound"];
        [_buttonText setEnabled:YES];
        
        [self outbound];
        _inboundOutboundFlag = 1;
    } else {
        [_norristownLabel setText:@" East Falls to 30th"];
        [_queenLaneLabel setText:@" Queen Ln to 30th"];
        [_trainOneLabel setText:@" "];
        [_trainTwoLabel setText:@" "];
        [_buttonText setTitle:@"Inbound"];
        [_buttonText setEnabled:YES];
        
        [self inbound];
        _inboundOutboundFlag = 0;
    }
}

- (void)inbound
{
    NSMutableArray *trainsEF = [MTFetchTrains fetchEastFalls];
    NSMutableArray *trainsQL = [MTFetchTrains fetchQueenLane];
    [self getTrains:trainsEF alongWith:trainsQL];
    trainsEF = nil;
    trainsQL = nil;
}

- (void)outbound
{
    NSMutableArray *trainsEF = [MTFetchTrains fetchThirtiethToEF];
    NSMutableArray *trainsQL = [MTFetchTrains fetchThirtiethToQL];
    [self getTrains:trainsEF alongWith:trainsQL];
    trainsEF = nil;
    trainsQL = nil;
}

- (void)getTrains:(NSMutableArray *)trainsEF alongWith:(NSMutableArray *)trainsQL
{
    if ([trainsEF count] >= 2) {
        
        NSString *efTrainNumberOne = trainsEF[0];
        NSString *efTrainTimeOne = [trainsEF[1] substringWithRange:(NSMakeRange(12, 5))];
        if ([efTrainTimeOne hasPrefix:@"0"] && [efTrainTimeOne length] > 1) {
            efTrainTimeOne = [efTrainTimeOne substringFromIndex:1];
        }
        NSString *efAMPMOne = [[trainsEF[1] substringWithRange:(NSMakeRange(24, 2))] lowercaseString];
        efTrainTimeOne = [efTrainTimeOne stringByAppendingString:@" "];
        efTrainTimeOne = [efTrainTimeOne stringByAppendingString:efAMPMOne];
        efTrainNumberOne = [efTrainNumberOne stringByAppendingString:@" at "];
        
        efTrainNumberOne = [efTrainNumberOne stringByAppendingString:efTrainTimeOne];
        efTrainNumberOne = [efTrainNumberOne stringByAppendingString:@"  "];
        
        [_trainOneLabel setText:efTrainNumberOne];
        
    } else {
        
        [_trainOneLabel setText:@"none upcoming  "];
        
    }
    
    if ([trainsQL count] >= 2) {
        
        NSString *qlTrainNumberOne = trainsQL[0];
        NSString *qlTrainTimeOne = [trainsQL[1] substringWithRange:(NSMakeRange(12, 5))];
        if ([qlTrainTimeOne hasPrefix:@"0"] && [qlTrainTimeOne length] > 1) {
            qlTrainTimeOne = [qlTrainTimeOne substringFromIndex:1];
        }
        NSString *qlAMPMOne = [[trainsQL[1] substringWithRange:(NSMakeRange(24, 2))] lowercaseString];
        qlTrainTimeOne = [qlTrainTimeOne stringByAppendingString:@" "];
        qlTrainTimeOne = [qlTrainTimeOne stringByAppendingString:qlAMPMOne];
        qlTrainNumberOne = [qlTrainNumberOne stringByAppendingString:@" at "];
        
        qlTrainNumberOne = [qlTrainNumberOne stringByAppendingString:qlTrainNumberOne];
        qlTrainNumberOne = [qlTrainNumberOne stringByAppendingString:@"  "];
        
        [_trainTwoLabel setText:qlTrainNumberOne];
        
    } else {
        
        [_trainTwoLabel setText:@"none upcoming  "];
    }
}

@end



