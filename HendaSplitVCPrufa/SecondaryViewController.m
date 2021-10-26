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
    
    // StorageTest
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *tempURL = [fileManager URLForDirectory:NSApplicationSupportDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:&error];
    if (error) {
        NSLog(@"Villa: %@", error.localizedDescription);
        error = nil;
    }
    if (tempURL) {
        NSString *string = @"Test";
        NSURL *fileURL = [[tempURL URLByAppendingPathComponent:@"skrá"] URLByAppendingPathExtension:@"txt"];
        [string writeToURL:fileURL atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (error) {
            NSLog(@"Villa skrá: %@", error.localizedDescription);
            error = nil;
        }
        NSLog(@"Written to: %@", tempURL.path);
    } else {
        NSAssert(NO, @"No tempURL");
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
