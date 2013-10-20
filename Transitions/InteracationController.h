//
//  InteracationController.h
//  Transitions
//
//  Created by dasmer on 10/19/13.
//  Copyright (c) 2013 Columbia University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InteracationController : UIPercentDrivenInteractiveTransition

- (void)wireToViewController:(UIViewController*)viewController;

@property (nonatomic, assign) BOOL interactionInProgress;


@end
