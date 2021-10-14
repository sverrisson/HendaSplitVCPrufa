//
//  SceneDelegate.m
//  HendaSplitVCPrufa
//
//  Created by Hannes Sverrisson on 13.10.2021.
//

#import "SceneDelegate.h"
#import "MainSplitViewController.h"
#import "SecondaryViewController.h"
#import "PrimaryViewController.h"
#import "SupplementaryViewController.h"

@interface SceneDelegate ()
- (NSString *)columnName:(UISplitViewControllerColumn)column;
@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    UIWindow *window = [[UIWindow alloc] initWithWindowScene:windowScene];
    
    // Create VC
    UISplitViewController *mainSplitVC = [[MainSplitViewController alloc] initWithStyle: UISplitViewControllerStyleDoubleColumn];
    mainSplitVC.delegate = self;
    [mainSplitVC setPreferredDisplayMode:UISplitViewControllerDisplayModeOneBesideSecondary];
    [mainSplitVC setPreferredSplitBehavior:UISplitViewControllerSplitBehaviorTile];
    [mainSplitVC setPreferredPrimaryColumnWidth: 280];
    
    PrimaryViewController *primary = [[PrimaryViewController alloc] init];
    SecondaryViewController *secondary = [[SecondaryViewController alloc] init];
    [primary setSecondary:secondary];
    
    [mainSplitVC setViewController:primary forColumn:UISplitViewControllerColumnPrimary];
    [mainSplitVC setViewController:secondary forColumn:UISplitViewControllerColumnSecondary];
    
    // Activate windows
    window.rootViewController = mainSplitVC;
    self.window = window;
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

//MARK: - SplitViewControllerDelegate

- (void)splitViewController:(UISplitViewController *)svc willHideColumn:(UISplitViewControllerColumn)column {
    NSLog(@"willHideColumn: %@", [self columnName:column]);
}

- (void)splitViewController:(UISplitViewController *)svc willShowColumn:(UISplitViewControllerColumn)column {
    NSLog(@"willShowColumn: %@", [self columnName:column]);
}

- (void)collapseSecondaryViewController:(UIViewController *)secondaryViewController forSplitViewController:(UISplitViewController *)splitViewController {
    NSLog(@"collapseSecondaryViewController");
}

- (void)splitViewControllerDidExpand:(UISplitViewController *)svc {
    NSLog(@"splitViewControllerDidExpand");
    NSDictionary *message = @{@"message": @"hide"};
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationHideShowButton object:self userInfo:message];
}

- (void)splitViewControllerDidCollapse:(UISplitViewController *)svc {
    NSLog(@"splitViewControllerDidCollapse");
    NSDictionary *message = @{@"message": @"show"};
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationHideShowButton object:self userInfo:message];

}


- (UISplitViewControllerColumn)splitViewController:(UISplitViewController *)svc topColumnForCollapsingToProposedTopColumn:(UISplitViewControllerColumn)proposedTopColumn {
    NSLog(@"topColumnForCollapsingToProposedTopColumn: %@", [self columnName:proposedTopColumn]);
    return proposedTopColumn;
}

- (UISplitViewControllerDisplayMode)splitViewController:(UISplitViewController *)svc displayModeForExpandingToProposedDisplayMode:(UISplitViewControllerDisplayMode)proposedDisplayMode {
    NSLog(@"displayModeForExpandingToProposedDisplayMode: %li", proposedDisplayMode);
    return proposedDisplayMode;
}

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
