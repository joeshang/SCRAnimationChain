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
@property (nonatomic, copy)   SCRAnimationCompletionBlock nextPrepare;

@end

@implementation SCRAnimationAction

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                     delay:(NSTimeInterval)delay
                                   options:(UIViewAnimationOptions)options
                                 animation:(SCRAnimationBlock)animation
                               nextPrepare:(SCRAnimationCompletionBlock)nextPrepare
{
    SCRAnimationAction *action = [[SCRAnimationAction alloc] init];
    
    if (action)
    {
        action.duration = duration;
        action.delay = delay;
        action.options = options;
        action.animation = animation;
        action.nextPrepare = nextPrepare;
    }
    
    return action;
}

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                   options:(UIViewAnimationOptions)options
                                 animation:(SCRAnimationBlock)animation
                               nextPrepare:(SCRAnimationCompletionBlock)nextPrepare
{
    return [self actionWithDuration:duration
                              delay:0.0
                            options:options
                          animation:animation
                        nextPrepare:nextPrepare];
}

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                   options:(UIViewAnimationOptions)options
                                 animation:(SCRAnimationBlock)animation
{
    return [self actionWithDuration:duration
                              delay:0.0
                            options:options
                          animation:animation
                        nextPrepare:nil];
}

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                 animation:(SCRAnimationBlock)animation
{
    return [self actionWithDuration:duration
                              delay:0.0
                            options:0
                          animation:animation
                        nextPrepare:nil];
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
                            if (self.nextPrepare)
                            {
                                self.nextPrepare();
                            }
                            
                            if (completion)
                            {
                                completion();
                            }
                        }
                    }];
}

- (NSTimeInterval)workTime
{
    return (self.delay + self.duration);
}

@end
