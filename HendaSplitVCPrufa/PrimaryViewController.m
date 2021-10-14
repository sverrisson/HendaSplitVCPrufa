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
    if ([message isEqualToString:@"show"]) {
        UIImage *image = [UIImage systemImageNamed:@"sidebar.right"];
        UIBarButtonItem *item =[[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(showSecondaryViewController)];
        [self.navigationItem setRightBarButtonItem:item animated:YES];
    } else {
        // Hide the button
        UIBarButtonItem *rightBarButtonItem = [self.navigationItem rightBarButtonItem];
        if (rightBarButtonItem) {
            [self.navigationItem setRightBarButtonItem:nil animated:YES];
        }
    }
}

- (void)showSecondaryViewController {
    NSLog(@"showSecondaryViewController");
    if (self.secondary) {
        [self.splitViewController showViewController:self.secondary sender:self];
    }
}

@end
