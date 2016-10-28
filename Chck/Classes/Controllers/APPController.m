//
//  APPController.m
//  Chck
//
//  Created by Aleksandr Khorobrykh on 28.10.16.
//  Copyright © 2016 AKTech. All rights reserved.
//

#import "APPController.h"
#import "Reachability.h"

static NSString * const kReachabilityURL = @"google.com";

@interface APPController ()

@property (strong) NSString *prevReachabilityState;

@end

@implementation APPController

+ (instancetype)instance {
    
    static APPController *shared = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        shared = [APPController new];
    });
    return shared;
}

- (instancetype)init {
    
    if ((self = [super init])) {
        
    }
    
    return self;
}

#pragma mark - Checkins

- (void)startReachabilityChecker {
    
    Reachability *reach = [Reachability reachabilityWithHostname:kReachabilityURL];
    
    reach.reachableBlock = ^(Reachability *reach) {
        
        if (!self.prevReachabilityState)
            self.prevReachabilityState = reach.currentReachabilityString;
        
        if (![self.prevReachabilityState isEqualToString:reach.currentReachabilityString]) {
            
            self.prevReachabilityState = reach.currentReachabilityString;
            [self changedReachabilityState:reach.currentReachabilityString];
        }
    };
    
    [reach startNotifier];
}

- (void)changedReachabilityState:(NSString *)state {
    
    Log(@"Changed reachability to %@", state);
}

@end
