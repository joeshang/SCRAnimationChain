//
//  SCRAnimationContainer.m
//  SCRAnimationChain
//
//  Created by Joe Shang on 11/27/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#import "SCRAnimationContainer.h"

@implementation SCRAnimationContainer

- (void)addAction:(id<SCRAnimationActionProtocol>)action
{
    if (!self.actions)
    {
        self.actions = [[NSMutableArray alloc] init];
    }
    
    if (action)
    {
        [self.actions insertObject:action atIndex:0];
    }
}

@end
