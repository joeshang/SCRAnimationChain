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
@property (nonatomic, copy)   SCRAnimationBlock prepare;

@end

@implementation SCRAnimationAction

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                     delay:(NSTimeInterval)delay
                                   options:(UIViewAnimationOptions)options
                                   prepare:(SCRAnimationBlock)prepare
                                 animation:(SCRAnimationBlock)animation
{
    SCRAnimationAction *action = [[SCRAnimationAction alloc] init];
    
    if (action)
    {
        action.duration = duration;
        action.delay = delay;
        action.options = options;
        action.prepare = prepare;
        action.animation = animation;
    }
    
    return action;
}

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                   options:(UIViewAnimationOptions)options
                                   prepare:(SCRAnimationBlock)prepare
                                 animation:(SCRAnimationBlock)animation
{
    return [self actionWithDuration:duration
                              delay:0.0
                            options:options
                            prepare:prepare
                          animation:animation];
}

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                   options:(UIViewAnimationOptions)options
                                 animation:(SCRAnimationBlock)animation
{
    return [self actionWithDuration:duration
                              delay:0.0
                            options:options
                            prepare:nil
                          animation:animation];
}

+ (SCRAnimationAction *)actionWithDuration:(NSTimeInterval)duration
                                 animation:(SCRAnimationBlock)animation
{
    return [self actionWithDuration:duration
                              delay:0.0
                            options:0
                            prepare:nil
                          animation:animation];
}

- (void)runWithCompletion:(SCRAnimationCompletionBlock)completion
{
    if (self.prepare)
    {
        self.prepare();
    }
    
   [UIView animateWithDuration:self.duration
                         delay:self.delay
                       options:self.options
                    animations:self.animation
                    completion:^(BOOL finished){
                        if (finished)
                        {
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
