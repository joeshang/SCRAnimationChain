//
//  SCRAnimationConcurrence.h
//  SCRAnimationChain
//
//  Created by Joe Shang on 11/27/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCRAnimationContainer.h"

@interface SCRAnimationConcurrence : SCRAnimationContainer <SCRAnimationActionProtocol>

- (void)runWithCompletion:(SCRAnimationCompletionBlock)completion;
- (NSTimeInterval)workTime;

@end
