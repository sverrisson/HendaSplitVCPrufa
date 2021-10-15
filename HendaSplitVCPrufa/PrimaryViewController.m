//
//  PeplistViewController.m
//  HendaSplitVCPrufa
//
//  Created by Hannes Sverrisson on 13.10.2021.
//

#import "PrimaryViewController.h"

@interface PrimaryViewController ()
- (NSString *)columnName:(UISplitViewControllerColumn)column;

@end

@implementation PrimaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor: [UIColor colorWithRed:0.8 green:0.2 blue:0 alpha:0.8]];
    self.title = @"PrimaryViewController";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showHideSecondaryMenuButton:) name:kNotificationHideShowButton object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)showSecondaryViewController {
    NSLog(@"showSecondaryViewController");
    if (self.secondary) {
        [self.splitViewController showViewController:self.secondary sender:self];
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

//MARK: - SplitViewControllerDelegate

- (void)splitViewController:(UISplitViewController *)svc willHideColumn:(UISplitViewControllerColumn)column {
    NSLog(@"willHideColumn: %@", [self columnName:column]);
    if (column == UISplitViewControllerColumnSecondary) {
//        NSDictionary *message = @{@"message": @"hide"};
//        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationHideShowButton object:self userInfo:message];
    }
}

- (void)splitViewController:(UISplitViewController *)svc willShowColumn:(UISplitViewControllerColumn)column {
    NSLog(@"willShowColumn: %@", [self columnName:column]);
    if (column == UISplitViewControllerColumnSecondary) {
//        NSDictionary *message = @{@"message": @"hide"};
//        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationHideShowButton object:self userInfo:message];
    }
}

- (void)collapseSecondaryViewController:(UIViewController *)secondaryViewController forSplitViewController:(UISplitViewController *)splitViewController {
    NSLog(@"collapseSecondaryViewController");
}

- (void)splitViewControllerDidExpand:(UISplitViewController *)svc {
    NSLog(@"splitViewControllerDidExpand");
//    NSDictionary *message = @{@"message": @"hide"};
//    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationHideShowButton object:self userInfo:message];
}

- (void)splitViewControllerDidCollapse:(UISplitViewController *)svc {
    NSLog(@"splitViewControllerDidCollapse");
//    NSDictionary *message = @{@"message": @"show"};
//    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationHideShowButton object:self userInfo:message];
}

//
//- (UISplitViewControllerColumn)splitViewController:(UISplitViewController *)svc topColumnForCollapsingToProposedTopColumn:(UISplitViewControllerColumn)proposedTopColumn {
//    NSLog(@"topColumnForCollapsingToProposedTopColumn: %@", [self columnName:proposedTopColumn]);
//    return proposedTopColumn;
//}
//
//- (UISplitViewControllerDisplayMode)splitViewController:(UISplitViewController *)svc displayModeForExpandingToProposedDisplayMode:(UISplitViewControllerDisplayMode)proposedDisplayMode {
//    NSLog(@"displayModeForExpandingToProposedDisplayMode: %li", proposedDisplayMode);
//    return proposedDisplayMode;
//}

- (NSString *)columnName:(UISplitViewControllerColumn)column {
    switch (column) {
        case UISplitViewControllerColumnPrimary:
            return @"Primary";
            break;
            
        case UISplitViewControllerColumnSecondary:
            return @"Secondary";
            break;
            
        case UISplitViewControllerColumnCompact:
            return @"Compact";
            break;
            
        case UISplitViewControllerColumnSupplementary:
            return @"Supplementary";
            break;

        default:
            NSAssert(NO, @"Unimplemented Column");
            return @"Unimplemented Column";
            break;
    }
}

@end
