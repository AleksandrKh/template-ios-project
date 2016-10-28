//
//  APPFont.h
//  Chck
//
//  Created by Aleksandr Khorobrykh on 28.10.16.
//  Copyright © 2016 AKTech. All rights reserved.
//

#import "FAKIcon.h"

@interface APPFont : FAKIcon

+ (UIFont *)iconFAFontWithSize:(CGFloat)size;
+ (instancetype)iconwithcode:(NSString *)code size:(CGFloat)size;

@end
