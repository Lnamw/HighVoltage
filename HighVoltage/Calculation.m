//
//  Calculation.m
//  HighVoltage
//
//  Created by Elena Maso Willen on 22/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "Calculation.h"
#import "ElectricityClass.h"
#import "ValueTableViewController.h"

@implementation Calculation

-(ElectricityClass *)doCalculation:(ElectricityClass *)electObject {
    
    ValueTableViewController *delegateVC = [[ValueTableViewController alloc] init];
    delegateVC.delegate = self;
    
    float ohms;
    float amps;
    float volts;
    float watts;
    
    
    if (electObject.ohms && electObject.amps) {
        ohms = [electObject.ohms floatValue];
        amps = [electObject.amps floatValue];
        volts = ohms * amps;
        watts = (amps * amps) * ohms;
    } else if (electObject.ohms && electObject.volts) {
        ohms = [electObject.ohms floatValue];
        volts = [electObject.volts floatValue];
        amps = volts / ohms;
        watts = (volts * volts) * ohms;
    } else if (electObject.ohms && electObject.watts) {
        ohms = [electObject.ohms floatValue];
        watts = [electObject.watts floatValue];
        amps = sqrtf(watts / ohms);
        volts = sqrtf(watts * ohms);
    } else if (electObject.amps && electObject.volts) {
        amps = [electObject.amps floatValue];
        volts = [electObject.volts floatValue];
        ohms = volts / amps;
        watts = volts * amps;
    } else if (electObject.amps && electObject.watts) {
        amps = [electObject.amps floatValue];
        watts = [electObject.watts floatValue];
        ohms = watts / (amps * amps);
        volts = watts / amps;
    } else if (electObject.watts && electObject.volts) {
        watts = [electObject.watts floatValue];
        volts = [electObject.volts floatValue];
        ohms = (volts * volts) / watts;
        amps = watts / volts;
    }
    
        
    electObject.ohms = [NSString stringWithFormat:@"%f", ohms];
    electObject.amps = [NSString stringWithFormat:@"%f", amps];
    electObject.volts = [NSString stringWithFormat:@"%f", volts];
    electObject.watts = [NSString stringWithFormat:@"%f", watts];
    
    NSLog(@"object is %@ %@ %@ %@", electObject.ohms, electObject.amps, electObject.volts, electObject.watts);



    return electObject;
    
    
}

@end
