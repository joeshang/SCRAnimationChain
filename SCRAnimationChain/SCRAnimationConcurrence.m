//
//  SCRAnimationConcurrence.m
//  SCRAnimationChain
//
//  Created by Joe Shang on 11/27/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#import "SCRAnimationConcurrence.h"

@implementation SCRAnimationConcurrence

- (void)runWithCompletion:(SCRAnimationCompletionBlock)completion
{
    NSTimeInterval maxWorkTime = [self workTime];
    [self.actions enumerateObjectsUsingBlock:^(id<SCRAnimationActionProtocol> item, NSUInteger index, BOOL *finished){
        if ([item workTime] == maxWorkTime) // find the last finished action
        {
            [item runWithCompletion:completion];
        }
        else
        {
            [item runWithCompletion:nil];
        }
    }];
}

- (NSTimeInterval)workTime
{
    __block NSTimeInterval maxTime = 0.0;
    [self.actions enumerateObjectsUsingBlock:^(id<SCRAnimationActionProtocol> item, NSUInteger index, BOOL *finished){
        if (maxTime < [item workTime])
        {
            maxTime = [item workTime];
        }
    }];
    
    return maxTime;
}

@end
