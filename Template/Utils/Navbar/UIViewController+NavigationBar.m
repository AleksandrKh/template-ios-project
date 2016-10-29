//
//  UIViewController+NavigationBar.m
//  Template
//
//  Created by Aleksandr Khorobrykh on 28.10.16.
//  Copyright © 2016 AKTech. All rights reserved.
//

#import "UIViewController+NavigationBar.h"

static CGFloat kNavbarTitleFontSize = 24;

@implementation UIViewController (NavigationBar)

- (void)setNavbar:(APPNavbar *)navbar {
    
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.tintColor = navbar.tintColor;
    self.navigationController.navigationBar.barTintColor = navbar.backgroundColor;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [self.navigationItem setHidesBackButton:YES animated:NO];
    
    UIColor *stringsColor = navbar.titleColor ? navbar.titleColor : navbar.tintColor;
    
    // Nav title
    UILabel *navTitleLabel = [UILabel new];
    navTitleLabel.font = [UIFont systemFontOfSize:kNavbarTitleFontSize];
    navTitleLabel.textColor = stringsColor;
    navTitleLabel.text = navbar.title;
    [navTitleLabel sizeToFit];
    
    self.navigationItem.titleView = navTitleLabel;
    
    // Left button
    if (navbar.leftButtonIcon) {
        UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithImage:navbar.leftButtonIcon style:UIBarButtonItemStylePlain target:self action:navbar.leftButtonAction];
        self.navigationItem.leftBarButtonItem = leftButtonItem;
    }
    
    if (navbar.leftButtonTitle) {
        
        UIButton *leftButton = [UIButton new];
        [leftButton setTitle:navbar.leftButtonTitle forState:UIControlStateNormal];
        [leftButton setTitleColor:stringsColor forState:UIControlStateNormal];
        [leftButton setTitleColor:[stringsColor colorWithAlphaComponent:0.7] forState:UIControlStateHighlighted];
        [leftButton sizeToFit];
        [leftButton addTarget:self action:navbar.leftButtonAction forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftButtonItem;
    }
    
    // Right button
    if (navbar.rightButtonIcon) {
        UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithImage:navbar.rightButtonIcon style:UIBarButtonItemStylePlain target:self action:navbar.rightButtonAction];
        self.navigationItem.rightBarButtonItem = rightButtonItem;
    }
    
    if (navbar.rightButtonTitle) {
        
        UIButton *rightButton = [UIButton new];
        [rightButton setTitle:navbar.rightButtonTitle forState:UIControlStateNormal];
        [rightButton setTitleColor:stringsColor forState:UIControlStateNormal];
        [rightButton setTitleColor:[stringsColor colorWithAlphaComponent:0.7] forState:UIControlStateHighlighted];
        [rightButton sizeToFit];
        [rightButton addTarget:self action:navbar.rightButtonAction forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItem = rightButtonItem;
    }
}

@end
