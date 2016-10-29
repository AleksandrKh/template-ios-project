//
//  UIViewController+Alert.h
//  Template
//
//  Created by Aleksandr Khorobrykh on 28.10.16.
//  Copyright © 2016 AKTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Alert)

- (void)alertWithTitle:(NSString *)title andText:(NSString *)text;
- (void)alertWithTitle:(NSString *)title andText:(NSString *)text okActionCompletion:(void(^)(void))okCompletion;
- (void)alertWithTitle:(NSString *)title andText:(NSString *)text okActionCompletion:(void(^)(void))okCompletion noActionCompletion:(void(^)(void))noCompletion;
- (void)alertWithTitle:(NSString *)title andText:(NSString *)text okTitle:(NSString *)okTitle cancelTitle:(NSString *)cancelTitle okActionCompletion:(void(^)(void))okCompletion noActionCompletion:(void(^)(void))noCompletion;

- (void)showWarningWithMessage:(NSString*)message;
- (void)showErrorWithMessage:(NSString*)message;
- (void)showErrorWithMessage:(NSString *)message okActionCompletion:(void(^)(void))okCompletion;
- (void)showWarningWithMessage:(NSString*)message okActionCompletion:(void(^)(void))okCompletion;

@end
