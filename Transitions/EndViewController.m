//
//  EndViewController.m
//  Transitions
//
//  Created by dasmer on 10/19/13.
//  Copyright (c) 2013 Columbia University. All rights reserved.
//

#import "EndViewController.h"

@interface EndViewController ()

@end

@implementation EndViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)clickedEnd:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
