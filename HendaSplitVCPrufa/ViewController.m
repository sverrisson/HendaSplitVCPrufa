//
//  ViewController.m
//  HendaSplitVCPrufa
//
//  Created by Hannes Sverrisson on 13.10.2021.
//

#import "ViewController.h"
#import "PeplistViewController.h"
#import "PepDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // Create VC
    UISplitViewController *splitVC = [[UISplitViewController alloc] initWithStyle: UISplitViewControllerStyleDoubleColumn];
    UIViewController *pepDetail = [PepDetailViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:pepDetail];
    UIViewController *pepList = [PeplistViewController new];
    
    [self addChildViewController:splitVC];
    [self.view addSubview:splitVC.view];
    splitVC.view.frame = self.view.bounds;
    navigationController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight + UIViewAutoresizingFlexibleWidth;
    navigationController.view.translatesAutoresizingMaskIntoConstraints = YES;
    [splitVC didMoveToParentViewController:self];
    
    [splitVC setViewController:pepList forColumn:UISplitViewControllerColumnPrimary];
    [splitVC setViewController:navigationController forColumn:UISplitViewControllerColumnSecondary];
    
    self.view.backgroundColor = [UIColor systemRedColor];
}


@end
