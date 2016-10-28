//
//  APPUtils.h
//  Chck
//
//  Created by Aleksandr Khorobrykh on 28.10.16.
//  Copyright © 2016 AKTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define DEGREES_TO_RADIANS(degrees) ((M_PI * degrees)/180.0f)
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0f / M_PI))

@interface APPUtils : NSObject

#pragma mark - Queues

void runBlockOnMainQueue(void (^block)(void));
void runBlockWithDelay(float delaySec, void (^block)(void));
void runBlockInBackground(void (^block)(void));
void runBlockInBackgroundWithDelay(float delaySec, void (^block)(void));

#pragma mark - Path

+ (NSString *)getDocumentsPathForFile:(NSString *)fileName;
+ (NSString *)getBundleFilePathForFile:(NSString *)fileName;

#pragma mark - Math

float randomMinus1_1();
float random0_1();

#pragma mark - Strings

+ (CGFloat)widthOfString:(NSString *)string withFont:(UIFont *)font;
+ (NSString *)stringID;

@end
