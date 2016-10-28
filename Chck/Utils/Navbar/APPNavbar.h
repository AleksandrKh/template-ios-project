//
//  APPNavbar.h
//  Chck
//
//  Created by Aleksandr Khorobrykh on 28.10.16.
//  Copyright © 2016 AKTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APPNavbar : NSObject

@property (strong) UIColor *tintColor;
@property (strong) NSString *title;
@property (strong) UIColor *titleColor;
@property (strong) UIImage *leftButtonIcon;
@property (strong) NSString *leftButtonTitle;
@property (readwrite) SEL leftButtonAction;
@property (strong) UIImage *rightButtonIcon;
@property (strong) NSString *rightButtonTitle;
@property (readwrite) SEL rightButtonAction;
@property (strong) UIColor *backgroundColor;

@end
