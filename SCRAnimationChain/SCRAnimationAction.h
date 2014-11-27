//
//  SCRAnimationAction.h
//  SCRAnimationChain
//
//  Created by Joe Shang on 11/27/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SCRAnimationActionProtocol.h"

typedef void (^SCRAnimationBlock)(void);

@interface SCRAnimationAction : NSObject <SCRAnimationActionProtocol>

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                     delay:(NSTimeInterval)delay
                                   options:(UIViewAnimationOptions)options
                                   prepare:(SCRAnimationBlock)prepare
                                 animation:(SCRAnimationBlock)animation;

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                   options:(UIViewAnimationOptions)options
                                   prepare:(SCRAnimationBlock)prepare
                                 animation:(SCRAnimationBlock)animation;

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                   options:(UIViewAnimationOptions)options
                                 animation:(SCRAnimationBlock)animation;

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                 animation:(SCRAnimationBlock)animation;

- (void)runWithCompletion:(SCRAnimationCompletionBlock)completion;
- (NSTimeInterval)workTime;

@end
