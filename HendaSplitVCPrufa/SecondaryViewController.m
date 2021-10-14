//
//  PepDetailViewController.m
//  HendaSplitVCPrufa
//
//  Created by Hannes Sverrisson on 13.10.2021.
//

#import "SecondaryViewController.h"
#import "PrimaryViewController.h"

@interface SecondaryViewController ()

@end

@implementation SecondaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor: [UIColor colorWithRed:0 green:0.3 blue:0.5 alpha:0.8]];
    self.title = @"SecondaryViewController";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"WillAppear");
    NSDictionary *message = @{@"message": @"hide"};
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationHideShowButton object:self userInfo:message];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"Disappear");
    NSDictionary *message = @{@"message": @"show"};
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationHideShowButton object:self userInfo:message];
}

@end
