//
//  PeplistViewController.m
//  HendaSplitVCPrufa
//
//  Created by Hannes Sverrisson on 13.10.2021.
//

#import "PrimaryViewController.h"
#import "SceneDelegate.h"

@interface PrimaryViewController ()

@end

@implementation PrimaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor: [UIColor colorWithRed:0.5 green:0.5 blue:0 alpha:0.8]];
    self.title = @"PrimaryViewController";
    [self showSecondaryButton];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showHideSecondaryMenuButton:) name:kNotificationHideShowButton object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    SceneDelegate *sceneDelegate = (SceneDelegate *)self.splitViewController.delegate;
    NSLog(@"sceneDelegate: %@", sceneDelegate);
    if (sceneDelegate.isShowingSecondary) {
        [self hideSecondaryButton];
    }
}

- (void)showSecondaryButton {
    UIImage *image = [UIImage systemImageNamed:@"sidebar.right"];
    UIBarButtonItem *item =[[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(showSecondaryViewController)];
    [self.navigationItem setRightBarButtonItem:item animated:YES];
}

- (void)hideSecondaryButton {
    UIBarButtonItem *rightBarButtonItem = [self.navigationItem rightBarButtonItem];
    if (rightBarButtonItem) {
        [self.navigationItem setRightBarButtonItem:nil animated:YES];
    }
}

- (void)showHideSecondaryMenuButton:(NSNotification *)notification {
    NSString *message = notification.userInfo[@"message"];
    if ([message isEqualToString:@"show"]) {
        NSLog(@"Show button");
        [self showSecondaryButton];
    } else {
        // Hide the button
        NSLog(@"Hide the button");
        [self hideSecondaryButton];
    }
}

- (void)showSecondaryViewController {
    NSLog(@"showSecondaryViewController");
    if (self.secondary) {
        [self.splitViewController showViewController:self.secondary sender:self];
    }
}

@end
