//
//  SCRAnimationSequence.m
//  SCRAnimationChain
//
//  Created by Joe Shang on 11/27/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#import "SCRAnimationSequence.h"

@interface SCRAnimationSequence ()

@property (nonatomic, strong) NSMutableArray *actionSequence;
@property (nonatomic, assign) BOOL cancelRequest;

@end

@implementation SCRAnimationSequence

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _cancelRequest = NO;
    }
    
    return self;
}

- (void)runWithCompletion:(SCRAnimationCompletionBlock)completion
{
    if (self.cancelRequest)
    {
        self.cancelRequest = NO;
        return;
    }
    
    id<SCRAnimationActionProtocol> action = [self.actionSequence lastObject];
    [self.actionSequence removeLastObject];
    
    SCRAnimationCompletionBlock recursive;
    if ([self.actionSequence count] == 0)   // last action in sequence
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

- (void)cancel
{
    self.cancelRequest = YES;
}

- (NSTimeInterval)overallTime
{
    __block NSTimeInterval overallTime = 0.0;
    [self.actionSequence enumerateObjectsUsingBlock:^(id<SCRAnimationActionProtocol> item, NSUInteger index, BOOL *finished){
        overallTime += [item overallTime];
    }];
    
    return overallTime;
}

- (void)addAction:(id<SCRAnimationActionProtocol>)action
{
    if (!self.actionSequence)
    {
        self.actionSequence = [[NSMutableArray alloc] init];
    }
    
    if (action)
    {
        [self.actionSequence insertObject:action atIndex:0];
    }
}

@end
