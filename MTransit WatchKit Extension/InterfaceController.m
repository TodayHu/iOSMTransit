//
//  InterfaceController.m
//  MTransit WatchKit Extension
//
//  Created by Kelly Innes on 2/23/15.
//  Copyright (c) 2015 Kelly Innes. All rights reserved.
//

#import "InterfaceController.h"
@class MTTestClass;


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
    [_norristownLabel setText:@"East Falls to 30th"];
    [self setEF];
    [self setQL];
    [_queenLaneLabel setText:@"Queen Ln to 30th"];
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
        //[_norristownLabel setText:@"30th to East Falls"];
        //[_norristownLabel setText:@"30th to Queen Ln"];
        //[_buttonText setTitle:@"Outbound"];
        _inboundOutboundFlag = 1;
        NSLog(@"1");
    } else {
        //[_norristownLabel setText:@"East Falls to 30th"];
        //[_queenLaneLabel setText:@"Queen Ln to 30th"];
        //[_buttonText setTitle:@"Inbound"];
        NSLog(@"0");
        _inboundOutboundFlag = 0;
    }
}

- (void)setEF {
    NSString *train = @"Train 123 / 12:30pm";
    [_trainOneLabel setText:train];
}

- (void)setQL {
    NSString *train = @"Train 456 / 3:45am";
    [_trainTwoLabel setText:train];
}

@end



