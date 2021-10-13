//
//  PeplistViewController.m
//  HendaSplitVCPrufa
//
//  Created by Hannes Sverrisson on 13.10.2021.
//

#import "PrimaryViewController.h"

@interface PrimaryViewController ()

@end

@implementation PrimaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor: [UIColor systemYellowColor]];
    self.title = @"PrimaryViewController";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showHideSecondaryMenuButton:) name:kNotificationHideShowButton object:nil];
}

- (void)showHideSecondaryMenuButton:(NSNotification *)notification {
    NSString *message = notification.userInfo[@"message"];
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    if ([message isEqualToString:@"show"]) {
        UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"Show"];
        [navigationBar pushNavigationItem:item animated:YES];
    } else {
        // Hide the button
        NSArray<UINavigationItem *> *items = [self.navigationController.navigationBar items];
        if ([items.lastObject.title isEqualToString:@"Show"]) {
            [navigationBar popNavigationItemAnimated:YES];
        }
    }
}

@end
