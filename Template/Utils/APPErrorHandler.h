//
//  APPErrorHandler.h
//  Template
//
//  Created by Aleksandr Khorobrykh on 28.10.16.
//  Copyright © 2016 AKTech. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, APPErrorCode) {
    
    APPErrorCodeUnknown = 0,
    APPErrorCodeNotFound,
};

@interface APPErrorHandler : NSObject

+ (NSError *)errorWithMessage:(NSString *)message;
+ (NSError *)errorWithMessage:(NSString *)message code:(NSInteger)errorCode;
+ (NSError *)errorNotFound;

@end
