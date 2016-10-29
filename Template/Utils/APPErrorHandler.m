//
//  APPErrorHandler.m
//  Template
//
//  Created by Aleksandr Khorobrykh on 28.10.16.
//  Copyright © 2016 AKTech. All rights reserved.
//

#import "APPErrorHandler.h"

@implementation APPErrorHandler

+ (NSError *)errorWithMessage:(NSString *)message code:(NSInteger)errorCode {
    
    NSError *error = [NSError errorWithDomain:[[NSBundle mainBundle] bundleIdentifier] code:errorCode userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(message, nil)}];
    return error;
}

+ (NSError *)errorWithMessage:(NSString *)message {
    return [self errorWithMessage:message code:APPErrorCodeUnknown];
}

+ (NSError *)errorNotFound {
    
    NSError *error = [NSError errorWithDomain:[[NSBundle mainBundle] bundleIdentifier] code:APPErrorCodeNotFound userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"errorNotFound", nil)}];
    
    return error;
}

@end
