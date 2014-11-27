//
//  SCRAnimationAction.m
//  SCRAnimationChain
//
//  Created by Joe Shang on 11/27/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#import "SCRAnimationAction.h"

@interface SCRAnimationAction ()

@property (nonatomic, assign) NSTimeInterval delay;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) UIViewAnimationOptions options;
@property (nonatomic, copy)   SCRAnimationBlock animation;

@end

@implementation SCRAnimationAction

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                     delay:(NSTimeInterval)delay
                                   options:(UIViewAnimationOptions)options
                                 animation:(SCRAnimationBlock)animation
{
    SCRAnimationAction *action = [[SCRAnimationAction alloc] init];
    
    if (action)
    {
        action.duration = duration;
        action.delay = delay;
        action.options = options;
        action.animation = animation;
    }
    
    return action;
}

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                   options:(UIViewAnimationOptions)options
                                 animation:(SCRAnimationBlock)animation
{
    return [self actionWithDuration:duration
                              delay:0.0
                            options:options
                          animation:animation];
}

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                 animation:(SCRAnimationBlock)animation
{
    return [self actionWithDuration:duration
                              delay:0.0
                            options:0
                          animation:animation];
}


- (void)runWithCompletion:(SCRAnimationCompletionBlock)completion
{
   [UIView animateWithDuration:self.duration
                         delay:self.delay
                       options:self.options
                    animations:self.animation
                    completion:^(BOOL finished){
                        if (finished)
                        {
                            completion();
                        }
                    }];
}

- (void)cancel
{
    // The cancel method is using for canceling animation chain, no the animation block.
    // Because the animation block is a black box in SCRAnimationAction, so it's your
    // responsibility to can cancel animation block by calling [view.layer removeAllAnimations]
}

- (NSTimeInterval)overallTime
{
    return (self.delay + self.duration);
}

@end
