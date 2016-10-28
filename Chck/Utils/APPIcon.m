//
//  APPIcon.m
//  Chck
//
//  Created by Aleksandr Khorobrykh on 28.10.16.
//  Copyright © 2016 AKTech. All rights reserved.
//

#import "APPIcon.h"
#import "FontAwesomeKit.h"
#import "FAKIcon.h"

@implementation APPIcon

+ (UIImage *)getImageFromFAFontIconWithName:(NSString *)name size:(CGFloat)size color:(UIColor *)color backgroundColor:(UIColor *)backgroundColor {
    
    NSError *error;
    FAKFontAwesome *icon = [FAKFontAwesome iconWithIdentifier:name size:size error:&error];
    
    if (error) {
        LogError(@"%@", error);
        return nil;
    }
    else {
        return [self getImageFromIcon:icon color:color backgroundColor:backgroundColor];
    }
}

+ (UIImage *)getImageFromIcon:(FAKIcon *)icon color:(UIColor *)color backgroundColor:(UIColor *)backgroundColor {
    
    if (backgroundColor)
        icon.drawingBackgroundColor = backgroundColor;
    
    if (color)
        [icon addAttribute:NSForegroundColorAttributeName value:color];
    
    return [icon imageWithSize:CGSizeMake(icon.iconFontSize, icon.iconFontSize)];
}

+ (NSAttributedString *)iconSymbolWithName:(NSString *)name size:(CGFloat)size {
    
    NSError *error;
    FAKFontAwesome *icon = [FAKFontAwesome iconWithIdentifier:name size:size error:&error];
    
    if (error) {
        LogError(@"%@", error);
        return nil;
    }
    else {
        return [icon attributedString];
    }
}

#pragma mark - Icon shortcuts

//+ (UIImage *)facebookIconWithSize:(CGFloat)size color:(UIColor *)color backgroundColor:(UIColor *)backgroundColor {
//    return [self getImageFromFAFontIconWithName:@"fa-facebook" size:size color:color backgroundColor:backgroundColor];
//}

@end
