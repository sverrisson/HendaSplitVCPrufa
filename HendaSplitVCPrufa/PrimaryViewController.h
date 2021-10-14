//
//  PeplistViewController.h
//  HendaSplitVCPrufa
//
//  Created by Hannes Sverrisson on 13.10.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define kNotificationHideShowButton @"kNotificationHideShowButton"

@interface PrimaryViewController : UIViewController<UISplitViewControllerDelegate>
@property (weak) UIViewController *secondary;
@end

NS_ASSUME_NONNULL_END
