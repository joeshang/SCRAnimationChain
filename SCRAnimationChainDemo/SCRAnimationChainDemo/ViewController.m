//
//  ViewController.m
//  SCRAnimationChainDemo
//
//  Created by Joe Shang on 11/27/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#import "ViewController.h"
#import "SCRAnimationAction.h"
#import "SCRAnimationSequence.h"

@interface ViewController ()

@property (nonatomic, strong) SCRAnimationSequence *sequence;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sequence = [[SCRAnimationSequence alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onAnimateButtonClicked:(id)sender
{
    [self.sequence addAction:[SCRAnimationAction actionWithDuration:2
                                                          animation:^{
                                                              self.box.backgroundColor = [UIColor redColor];
                                                          }]];
    [self.sequence addAction:[SCRAnimationAction actionWithDuration:2
                                                          animation:^{
                                                              self.box.alpha = 0.0;
                                                          }]];
    [self.sequence addAction:[SCRAnimationAction actionWithDuration:2
                                                          animation:^{
                                                              self.box.alpha = 1.0;
                                                          }]];
    [self.sequence addAction:[SCRAnimationAction actionWithDuration:2
                                                          animation:^{
                                                              self.box.transform = CGAffineTransformScale(self.box.transform, 1.5, 1.5);
                                                          }]];
    [self.sequence addAction:[SCRAnimationAction actionWithDuration:2
                                                          animation:^{
                                                              self.box.transform = CGAffineTransformIdentity;
                                                          }]];
    [self.sequence runWithCompletion:^{
        NSLog(@"sequence finished");
    }];
}

- (IBAction)onCancelButtonClicked:(id)sender
{
    [self.sequence cancel];
}

@end
