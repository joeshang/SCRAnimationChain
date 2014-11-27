//
//  SCRAnimationContainer.h
//  SCRAnimationChain
//
//  Created by Joe Shang on 11/27/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCRAnimationActionProtocol.h"

@interface SCRAnimationContainer : NSObject

@property (nonatomic, strong) NSMutableArray *actions;

- (void)addAction:(id<SCRAnimationActionProtocol>)action;

@end
