//
//  MTViewController.m
//  MTransit
//
//  Created by Kelly Innes on 2/10/15.
//  Copyright (c) 2015 Kelly Innes. All rights reserved.
//

#import "MTViewController.h"
#import "MTFetchTrains.h"
#define METERS_PER_MILE 1609.344

@interface MTViewController ()

@property (weak, nonatomic) IBOutlet UILabel *norristownLabel;
@property (weak, nonatomic) IBOutlet UILabel *cHWLabel;
@property (weak, nonatomic) IBOutlet UILabel *trainOneNumber;
@property (weak, nonatomic) IBOutlet UILabel *trainOneTime;
@property (weak, nonatomic) IBOutlet UILabel *trainTwoNumber;
@property (weak, nonatomic) IBOutlet UILabel *trainTwoTime;
@property (weak, nonatomic) IBOutlet UILabel *trainThreeNumber;
@property (weak, nonatomic) IBOutlet UILabel *trainThreeTime;
@property (weak, nonatomic) IBOutlet UILabel *trainFourNumber;
@property (weak, nonatomic) IBOutlet UILabel *trainFourTime;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *inboundOutboundLabel;
@property (weak, nonatomic) IBOutlet MKMapView *insetMap;

@end

@implementation MTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self inbound];
    [self refreshMap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshTrains:(id)sender {
    if ([_inboundOutboundLabel.title isEqualToString:@"Inbound from East Falls"]) {
        [self inbound];
    } else {
        [self outbound];
    }
    [self refreshMap];
}

- (IBAction)changeStation:(id)sender {
    if ([_inboundOutboundLabel.title isEqualToString:@"Inbound from East Falls"]) {
        [self outbound];
    } else {
        [self inbound];
    }
}

- (void)inbound
{
    _inboundOutboundLabel.title = @"Inbound from East Falls";
    _norristownLabel.text = @"Norristown from East Falls";
    _cHWLabel.text = @"Chestnut Hill W from Queen Lane";
    
    NSMutableArray *trainsEF = [MTFetchTrains fetchEastFalls];
    NSMutableArray *trainsQL = [MTFetchTrains fetchQueenLane];
    [self getTrains:trainsEF alongWith:trainsQL];
    trainsEF = nil;
    trainsQL = nil;
}

- (void)outbound
{
    _inboundOutboundLabel.title = @"Outbound from 30th Street";
    _norristownLabel.text = @"Norristown to East Falls";
    _cHWLabel.text = @"Chestnut Hill W to Queen Lane";
    
    NSMutableArray *trainsEF = [MTFetchTrains fetchThirtiethToEF];
    NSMutableArray *trainsQL = [MTFetchTrains fetchThirtiethToQL];
    [self getTrains:trainsEF alongWith:trainsQL];
    trainsEF = nil;
    trainsQL = nil;
}

- (void)getTrains:(NSMutableArray *)trainsEF alongWith:(NSMutableArray *)trainsQL
{
    if ([trainsEF count] >= 4) {
        
        NSString *efTrainNumberOne = @"Train ";
        efTrainNumberOne = [efTrainNumberOne stringByAppendingString:trainsEF[0]];
        NSString *efTrainTimeOne = [trainsEF[1] substringWithRange:(NSMakeRange(12, 5))];
        if ([efTrainTimeOne hasPrefix:@"0"] && [efTrainTimeOne length] > 1) {
            efTrainTimeOne = [efTrainTimeOne substringFromIndex:1];
        }
        NSString *efAMPMOne = [[trainsEF[1] substringWithRange:(NSMakeRange(24, 2))] lowercaseString];
        efTrainTimeOne = [efTrainTimeOne stringByAppendingString:@" "];
        efTrainTimeOne = [efTrainTimeOne stringByAppendingString:efAMPMOne];
        
        _trainOneNumber.text = efTrainNumberOne;
        _trainOneTime.text = efTrainTimeOne;
        
        NSString *efTrainNumberTwo = @"Train ";
        efTrainNumberTwo = [efTrainNumberTwo stringByAppendingString:trainsEF[2]];
        NSString *efTrainTimeTwo = [trainsEF[3] substringWithRange:(NSMakeRange(12, 5))];
        if ([efTrainTimeTwo hasPrefix:@"0"] && [efTrainTimeTwo length] > 1) {
            efTrainTimeTwo = [efTrainTimeTwo substringFromIndex:1];
        }
        NSString *efAMPMTwo = [[trainsEF[3] substringWithRange:(NSMakeRange(24, 2))] lowercaseString];
        efTrainTimeTwo = [efTrainTimeTwo stringByAppendingString:@" "];
        efTrainTimeTwo = [efTrainTimeTwo stringByAppendingString:efAMPMTwo];
        
        _trainTwoNumber.text = efTrainNumberTwo;
        _trainTwoTime.text = efTrainTimeTwo;
        
    } else if ([trainsEF count] >= 2) {
        
        NSString *efTrainNumberOne = @"Train ";
        efTrainNumberOne = [efTrainNumberOne stringByAppendingString:trainsEF[0]];
        NSString *efTrainTimeOne = [trainsEF[1] substringWithRange:(NSMakeRange(12, 5))];
        if ([efTrainTimeOne hasPrefix:@"0"] && [efTrainTimeOne length] > 1) {
            efTrainTimeOne = [efTrainTimeOne substringFromIndex:1];
        }
        NSString *efAMPMOne = [[trainsEF[1] substringWithRange:(NSMakeRange(24, 2))] lowercaseString];
        efTrainTimeOne = [efTrainTimeOne stringByAppendingString:@" "];
        efTrainTimeOne = [efTrainTimeOne stringByAppendingString:efAMPMOne];
        
        _trainOneNumber.text = efTrainNumberOne;
        _trainOneTime.text = efTrainTimeOne;
        _trainTwoNumber.text = @"";
        _trainTwoTime.text = @"";
        
    } else {
        
        _trainOneNumber.text = @"no upcoming trains";
        _trainOneTime.text = @"";
        _trainTwoNumber.text = @"";
        _trainTwoTime.text = @"";
        
    }
    
    if ([trainsQL count] >= 4) {
        
        NSString *qlTrainNumberOne = @"Train ";
        qlTrainNumberOne = [qlTrainNumberOne stringByAppendingString:trainsQL[0]];
        NSString *qlTrainTimeOne = [trainsQL[1] substringWithRange:(NSMakeRange(12, 5))];
        if ([qlTrainTimeOne hasPrefix:@"0"] && [qlTrainTimeOne length] > 1) {
            qlTrainTimeOne = [qlTrainTimeOne substringFromIndex:1];
        }
        NSString *qlAMPMOne = [[trainsQL[1] substringWithRange:(NSMakeRange(24, 2))] lowercaseString];
        qlTrainTimeOne = [qlTrainTimeOne stringByAppendingString:@" "];
        qlTrainTimeOne = [qlTrainTimeOne stringByAppendingString:qlAMPMOne];
        
        _trainThreeNumber.text = qlTrainNumberOne;
        _trainThreeTime.text = qlTrainTimeOne;
        
        NSString *qlTrainNumberTwo = @"Train ";
        qlTrainNumberTwo = [qlTrainNumberTwo stringByAppendingString:trainsQL[2]];
        NSString *qlTrainTimeTwo = [trainsQL[3] substringWithRange:(NSMakeRange(12, 5))];
        if ([qlTrainTimeTwo hasPrefix:@"0"] && [qlTrainTimeTwo length] > 1) {
            qlTrainTimeTwo = [qlTrainTimeTwo substringFromIndex:1];
        }
        NSString *qlAMPMTwo = [[trainsQL[3] substringWithRange:(NSMakeRange(24, 2))] lowercaseString];
        qlTrainTimeTwo = [qlTrainTimeTwo stringByAppendingString:@" "];
        qlTrainTimeTwo = [qlTrainTimeTwo stringByAppendingString:qlAMPMTwo];
        
        _trainFourNumber.text = qlTrainNumberTwo;
        _trainFourTime.text = qlTrainTimeTwo;
        
    } else if ([trainsQL count] >= 2) {
        
        NSString *qlTrainNumberOne = @"Train ";
        qlTrainNumberOne = [qlTrainNumberOne stringByAppendingString:trainsQL[0]];
        NSString *qlTrainTimeOne = [trainsQL[1] substringWithRange:(NSMakeRange(12, 5))];
        if ([qlTrainTimeOne hasPrefix:@"0"] && [qlTrainTimeOne length] > 1) {
            qlTrainTimeOne = [qlTrainTimeOne substringFromIndex:1];
        }
        NSString *qlAMPMOne = [[trainsQL[1] substringWithRange:(NSMakeRange(24, 2))] lowercaseString];
        qlTrainTimeOne = [qlTrainTimeOne stringByAppendingString:@" "];
        qlTrainTimeOne = [qlTrainTimeOne stringByAppendingString:qlAMPMOne];
        
        _trainThreeNumber.text = qlTrainNumberOne;
        _trainThreeTime.text = qlTrainTimeOne;
        _trainFourNumber.text = @"";
        _trainFourTime.text = @"";
        
    } else {
        
        _trainThreeNumber.text = @"no upcoming trains";
        _trainThreeTime.text = @"";
        _trainFourNumber.text = @"";
        _trainFourTime.text = @"";
    }
}

- (void)refreshMap
{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 39.964948;
    zoomLocation.longitude = -75.180161;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 5.5*METERS_PER_MILE, 5.5*METERS_PER_MILE);
    [_insetMap setRegion:viewRegion animated:YES];
}

@end
