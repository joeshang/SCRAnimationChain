//
//  SCRAnimationSequence.h
//  SCRAnimationChain
//
//  Created by Joe Shang on 11/27/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCRAnimationActionProtocol.h"

@interface SCRAnimationSequence : NSObject <SCRAnimationActionProtocol>

- (void)runWithCompletion:(SCRAnimationCompletionBlock)completion;
- (void)cancel;
- (NSTimeInterval)overallTime;
- (void)addAction:(id<SCRAnimationActionProtocol>)action;

@end
