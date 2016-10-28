//
//  APPUtils.m
//  Chck
//
//  Created by Aleksandr Khorobrykh on 28.10.16.
//  Copyright © 2016 AKTech. All rights reserved.
//

#import "APPUtils.h"

@implementation APPUtils

#pragma mark - Queues

void runBlockOnMainQueue(void (^block)(void)) {
    
    if ([NSThread isMainThread]) {
        block();
    }
    else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

void runBlockWithDelay(float delaySec, void (^block)(void)) {
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaySec * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}

void runBlockInBackground(void (^block)(void)) {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

void runBlockInBackgroundWithDelay(float delaySec, void (^block)(void)) {
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaySec * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

#pragma mark - Path

+ (NSString *)getDocumentsPathForFile:(NSString*)fileName {
    
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    return [[filePaths firstObject] stringByAppendingPathComponent:fileName];
}

+ (NSString *)getBundleFilePathForFile:(NSString*)fileName {
    
    return [[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension]
                                           ofType:[fileName pathExtension]
                                      inDirectory:[fileName stringByDeletingLastPathComponent]];
}

#pragma mark - Math

float randomMinus1_1() {
    return (arc4random() / (float)0x7fffffff ) - 1.0f;
}

float random0_1() {
    return arc4random() / (float)0x100000000;
}

#pragma mark - Strings

+ (CGFloat)widthOfString:(NSString *)string withFont:(UIFont *)font {
    
    return [string sizeWithAttributes:@{NSFontAttributeName:font}].width;
}

+ (NSString *)stringID {
    
    static NSInteger uniqie_id_counter = 100;
    NSTimeInterval timestamp= [[NSDate date] timeIntervalSince1970];
    return [NSString stringWithFormat:@"%ld_%ld", (long)timestamp, (long)uniqie_id_counter++];
}

@end
