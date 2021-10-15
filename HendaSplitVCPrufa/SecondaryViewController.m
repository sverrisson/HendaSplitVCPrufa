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

    // SceneStorage
    NSDictionary<NSString *,id> *userInfo = self.session.userInfo;
    NSDate *userInfoTime = userInfo[@"time"];
    if (userInfoTime != nil) {
        self.title = [NSString stringWithFormat:@"%@", userInfoTime.description];
    } else {
        NSDate *time = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
        self.title = [NSString stringWithFormat:@"%@", time.description];
        NSDictionary<NSString *,id> *storeTime = [NSDictionary dictionaryWithObject:time forKey:@"time"];
        [self.session setUserInfo:storeTime];
    }
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
