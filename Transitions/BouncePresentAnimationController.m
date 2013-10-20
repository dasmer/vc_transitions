//
//  BouncePresentAnimationController.m
//  Transitions
//
//  Created by dasmer on 10/19/13.
//  Copyright (c) 2013 Columbia University. All rights reserved.
//

#import "BouncePresentAnimationController.h"

@implementation BouncePresentAnimationController


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
   
    //get references to the to and from view controllers  **BOILERPLATE
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //get a reference to the final frame of the toViewController **BOILERPLATE
    CGRect finalFrame  = [transitionContext finalFrameForViewController:toViewController];
    
    //get a reference to the transtion context's container view (where the animation actually happens) **BOILERPLATE
    UIView *containerView = [transitionContext containerView];
    
    //add the toViewController to the transition context's container view **BOILERPLATE
    [containerView addSubview:toViewController.view];
    
    
    //Customizations Below...
    
    //set the intial frame of the toViewController as just below the screen
    toViewController.view.frame = CGRectOffset(finalFrame, 0, [[UIScreen mainScreen] bounds].size.height);
    
    //begin the animation
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
         usingSpringWithDamping:0.4 //lower this is the more spring effect there is
          initialSpringVelocity:0.0 //higher this is the higher the initial velocity of the animation is
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         toViewController.view.frame = finalFrame; //animate the toViewController go from beneath the screen to its finalframe (on the screen bounds)
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];//tell the transitioncontext to complete the transition.  This will remove the context's containerview where the animation was happening
                     }];

}


@end
