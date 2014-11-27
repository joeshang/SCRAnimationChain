//
//  ViewController.m
//  SCRAnimationChainDemo
//
//  Created by Joe Shang on 11/27/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#import "ViewController.h"
#import "SCRAnimationChain.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL reverted;
@property (nonatomic, assign) CGFloat leftBoxOriginVertSpaceConstant;
@property (nonatomic, assign) CGFloat rightBoxOriginVertSpaceConstant;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.reverted = NO;
    self.leftBoxOriginVertSpaceConstant = self.leftBoxVertSpace.constant;
    self.rightBoxOriginVertSpaceConstant = self.rightBoxVertSpace.constant;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onAnimateButtonClicked:(id)sender
{
    if (!self.reverted)
    {
        SCRAnimationConcurrence *concurrence = [[SCRAnimationConcurrence alloc] init];
        self.leftBoxVertSpace.constant = self.midBoxVertSpace.constant;
        self.rightBoxVertSpace.constant = self.midBoxVertSpace.constant;
        [concurrence addAction:[SCRAnimationAction actionWithDuration:3
                                                            animation:^{
                                                                [self.view layoutIfNeeded];
                                                            }]];
        SCRAnimationSequence *sequence = [[SCRAnimationSequence alloc] init];
        [sequence addAction:[SCRAnimationAction actionWithDuration:1
                                                         animation:^{
                                                             self.midBox.alpha = 0.0;
                                                         }]];
        [sequence addAction:[SCRAnimationAction actionWithDuration:1
                                                         animation:^{
                                                             self.midBox.alpha = 1.0;
                                                         }]];
        [sequence addAction:[SCRAnimationAction actionWithDuration:1
                                                         animation:^{
                                                             self.midBox.backgroundColor = [UIColor redColor];
                                                         }]];
        [sequence addAction:[SCRAnimationAction actionWithDuration:1
                                                         animation:^{
                                                             self.midBox.transform = CGAffineTransformScale(self.midBox.transform, 1.5, 1.5);
                                                         }]];
        [sequence addAction:[SCRAnimationAction actionWithDuration:1
                                                         animation:^{
                                                             self.midBox.transform = CGAffineTransformIdentity;
                                                         }]];
        [concurrence addAction:sequence];
        [concurrence runWithCompletion:^{
            NSLog(@"animate finished");
            self.animateButton.titleLabel.text = @"Revert";
            self.reverted = YES;
        }];
    }
    else
    {
        SCRAnimationSequence *sequence = [[SCRAnimationSequence alloc] init];
        [sequence addAction:[SCRAnimationAction actionWithDuration:1
                                                         animation:^{
                                                             self.midBox.transform = CGAffineTransformScale(self.midBox.transform, 1.5, 1.5);
                                                         }]];
        [sequence addAction:[SCRAnimationAction actionWithDuration:1
                                                           options:0
                                                         animation:^{
                                                             self.midBox.transform = CGAffineTransformIdentity;
                                                         }
                                                       nextPrepare:^{
                                                           self.leftBoxVertSpace.constant = self.leftBoxOriginVertSpaceConstant;
                                                           self.rightBoxVertSpace.constant = self.rightBoxOriginVertSpaceConstant;
                                                       }]];
        SCRAnimationConcurrence *concurrence = [[SCRAnimationConcurrence alloc] init];
        [concurrence addAction:[SCRAnimationAction actionWithDuration:3
                                                            animation:^{
                                                                [self.view layoutIfNeeded];
                                                            }]];
        [concurrence addAction:[SCRAnimationAction actionWithDuration:1
                                                            animation:^{
                                                                self.midBox.backgroundColor = [UIColor greenColor];
                                                            }]];
        [sequence addAction:concurrence];
        [sequence addAction:[SCRAnimationAction actionWithDuration:1
                                                         animation:^{
                                                             self.midBox.backgroundColor = [UIColor blueColor];
                                                         }]];
        
        [sequence runWithCompletion:^{
            NSLog(@"revert finished");
            self.animateButton.titleLabel.text = @"Animate";
            self.reverted = NO;
        }];
    }
}

@end
