//
//  SCRAnimationSequence.m
//  SCRAnimationChain
//
//  Created by Joe Shang on 11/27/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#import "SCRAnimationSequence.h"

@implementation SCRAnimationSequence

- (void)runWithCompletion:(SCRAnimationCompletionBlock)completion
{
    id<SCRAnimationActionProtocol> action = [self.actions lastObject];
    [self.actions removeLastObject];
    
    SCRAnimationCompletionBlock recursive;
    if ([self.actions count] == 0)   // last action in sequence
    {
        recursive = completion;
    }
    else
    {
        recursive = ^{
            [self runWithCompletion:completion];
        };
    }
    
    [action runWithCompletion:recursive];
}

- (NSTimeInterval)workTime
{
    __block NSTimeInterval overallTime = 0.0;
    [self.actions enumerateObjectsUsingBlock:^(id<SCRAnimationActionProtocol> item, NSUInteger index, BOOL *finished){
        overallTime += [item workTime];
    }];
    
    return overallTime;
}

@end
