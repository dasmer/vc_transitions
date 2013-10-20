//
//  ShrinkDismissAnimationController.m
//  Transitions
//
//  Created by dasmer on 10/19/13.
//  Copyright (c) 2013 Columbia University. All rights reserved.
//

#import "ShrinkDismissAnimationController.h"

@implementation ShrinkDismissAnimationController

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
    
    
    //the StartViewController doesn't move so we its initial frame is set to its final frame (which is the bounds of the screen) **this should probably be considered boilerplate code for dismiss transitions 
    toViewController.view.frame = finalFrame;

    //create a shrunken frame that is has 75% of the original height and width
    CGRect fromShrunkenFrame = CGRectInset(fromViewController.view.frame, fromViewController.view.frame.size.width/4, fromViewController.view.frame.size.height/4);
    
    //the final position of the shrunken frame should be directly under the screen
    //(this is similar to the initial frame of the toViewController in BouncePresentAnimationController)
    CGRect fromFinalFrame = CGRectOffset(fromShrunkenFrame, 0,[[UIScreen mainScreen] bounds].size.height);
    

    // create a snapshot of the EndViewController
    UIView *intermediateView = [fromViewController.view snapshotViewAfterScreenUpdates:NO];
    intermediateView.frame = fromViewController.view.frame;
    
    //put the screenshot on top of the viewhierarchy
    [containerView addSubview:intermediateView];
    

    //begin the animation
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                   delay:0.0
                             options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
                                 // for the first 25% of the animation, shrink!
                                 [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.25
                                                               animations:^{ intermediateView.frame = fromShrunkenFrame;
                                                                   intermediateView.alpha =0.7; }];
                                 //for the latter 75% of the animation get large
                                 [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.50
                                                               animations:^{ intermediateView.frame = fromFinalFrame;
                                                                       
                                                                   }];
                                 }
                              completion:^(BOOL finished) {
                                  // remove the intermediate view (the screenshot)
                                  [intermediateView removeFromSuperview];
                                  [transitionContext completeTransition:YES];
                                  
                              }];
    
}

@end
