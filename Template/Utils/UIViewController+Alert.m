//
//  UIViewController+Alert.m
//  Template
//
//  Created by Aleksandr Khorobrykh on 28.10.16.
//  Copyright © 2016 AKTech. All rights reserved.
//

#import "UIViewController+Alert.h"

@implementation UIViewController (Alert)

- (void)alertWithTitle:(NSString *)title andText:(NSString *)text {
    
    [self alertWithTitle:title andText:text okActionCompletion:nil noActionCompletion:nil];
}

- (void)alertWithTitle:(NSString *)title andText:(NSString *)text okActionCompletion:(void(^)(void))okCompletion {
    
    [self alertWithTitle:title andText:text okActionCompletion:okCompletion noActionCompletion:nil];
}

- (void)alertWithTitle:(NSString *)title andText:(NSString *)text okActionCompletion:(void(^)(void))okCompletion noActionCompletion:(void(^)(void))noCompletion {
    
    [self alertWithTitle:title andText:text okTitle:NSLocalizedString(@"alertOkTitle", nil) cancelTitle:NSLocalizedString(@"alertCancelTitle", nil) okActionCompletion:okCompletion noActionCompletion:noCompletion];
}

- (void)alertWithTitle:(NSString *)title andText:(NSString *)text okTitle:(NSString *)okTitle cancelTitle:(NSString *)cancelTitle okActionCompletion:(void(^)(void))okCompletion noActionCompletion:(void(^)(void))noCompletion {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:text preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (okCompletion) okCompletion();
    }]];
    
    if (noCompletion) {
        
        [alertController addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            noCompletion();
        }]];
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showErrorWithMessage:(NSString*)message {
    
    [self alertWithTitle:NSLocalizedString(@"alertErrorTitle", nil) andText:message];
}

- (void)showErrorWithMessage:(NSString *)message okActionCompletion:(void(^)(void))okCompletion {
    
    [self alertWithTitle:NSLocalizedString(@"alertErrorTitle", nil) andText:message okActionCompletion:okCompletion];
}

- (void)showWarningWithMessage:(NSString*)message {
    
    [self alertWithTitle:NSLocalizedString(@"alertWarningTitle", nil) andText:message];
}

- (void)showWarningWithMessage:(NSString*)message okActionCompletion:(void(^)(void))okCompletion {
    
    [self alertWithTitle:NSLocalizedString(@"alertWarningTitle", nil) andText:message okActionCompletion:okCompletion];
}

@end
