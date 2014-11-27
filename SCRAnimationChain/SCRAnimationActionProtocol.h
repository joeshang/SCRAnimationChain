//
//  SCRAnimationActionProtocol.h
//  SCRAnimationChain
//
//  Created by Joe Shang on 11/27/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#ifndef SCRAnimationChain_SCRAnimationActionProtocol_h
#define SCRAnimationChain_SCRAnimationActionProtocol_h

#import <Foundation/Foundation.h>

typedef void (^SCRAnimationCompletionBlock)(void);

@protocol SCRAnimationActionProtocol <NSObject>

@required

- (void)runWithCompletion:(SCRAnimationCompletionBlock)completion;
- (NSTimeInterval)workTime;

// There is no cancel method because animation block is a black box in SCRAnimationAction,
// so it's your responsibility to can cancel animation by calling [view.layer removeAllAnimations]

@optional

- (void)addAction:(id<SCRAnimationActionProtocol>)action;

@end

#endif
