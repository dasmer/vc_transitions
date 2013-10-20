//
//  StartViewController.m
//  Transitions
//
//  Created by dasmer on 10/19/13.
//  Copyright (c) 2013 Columbia University. All rights reserved.
//

#import "StartViewController.h"
#import "BouncePresentAnimationController.h"
#import "ShrinkDismissAnimationController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"presentModal"])
    {
        //Do any additional setup before presenting the EndViewController
        UIViewController *endVC = segue.destinationViewController;
        endVC.transitioningDelegate = self;
    }
}

- (id<UIViewControllerAnimatedTransitioning>) animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    BouncePresentAnimationController *animationController = [[BouncePresentAnimationController alloc] init];
    return animationController;
    
}

- (id<UIViewControllerAnimatedTransitioning>) animationControllerForDismissedController:(UIViewController *)dismissed{
    ShrinkDismissAnimationController *animationController = [[ShrinkDismissAnimationController alloc] init];
    return animationController;

}

@end
