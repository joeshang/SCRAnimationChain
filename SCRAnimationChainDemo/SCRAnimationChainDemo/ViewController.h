//
//  ViewController.h
//  SCRAnimationChainDemo
//
//  Created by Joe Shang on 11/27/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIView *midBox;
@property (nonatomic, weak) IBOutlet UIView *leftBox;
@property (nonatomic, weak) IBOutlet UIView *rightBox;
@property (nonatomic, weak) IBOutlet UIButton *animateButton;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *midBoxVertSpace;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *leftBoxVertSpace;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *rightBoxVertSpace;

- (IBAction)onAnimateButtonClicked:(id)sender;

@end

