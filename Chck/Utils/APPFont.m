//
//  APPFont.m
//  Chck
//
//  Created by Aleksandr Khorobrykh on 28.10.16.
//  Copyright © 2016 AKTech. All rights reserved.
//

#import "APPFont.h"

@implementation APPFont

// Example

/*
NSString *string = [@"\uf041 " stringByAppendingString:@"Some location"];
NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
[attributedString addAttribute:NSFontAttributeName value:[JNFont iconFAFontWithSize:kLocationLabelFontSize] range:NSMakeRange(0, 1)];
[attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:kFontRegular size:kLocationLabelFontSize] range:NSMakeRange(1, attributedString.length - 1)];
 */

+ (UIFont *)iconFAFontWithSize:(CGFloat)size {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self registerIconFontWithURL:[[NSBundle mainBundle] URLForResource:@"FontAwesome" withExtension:@"otf"]];
    });
    
    UIFont *font = [UIFont fontWithName:@"FontAwesome" size:size];
    
    NSAssert(font, @"UIFont object should not be nil, check if the font file is added to the application bundle and you're using the correct font name.");
    return font;
}

+ (instancetype)iconwithcode:(NSString *)code size:(CGFloat)size {
    
    return [[self class] iconWithCode:code size:size];
}

@end
