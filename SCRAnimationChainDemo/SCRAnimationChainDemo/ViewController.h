//
//  ViewController.h
//  SCRAnimationChainDemo
//
//  Created by Joe Shang on 11/27/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIView *box;

- (IBAction)onAnimateButtonClicked:(id)sender;
- (IBAction)onCancelButtonClicked:(id)sender;

@end

