//
//  KISomeOperation.m
//  operationtest
//
//  Created by kaiinui on 2014/09/08.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KISomeOperation.h"

@interface KISomeOperation ()

@end

@implementation KISomeOperation

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"whoa");
        self.isFinished = NO;
    }
    return self;
}

- (BOOL)isConcurrent {
    return YES;
}

- (void)main {
    [self doSomethingWithBlock:^{
        [self finish];
    }];
}

- (void)doSomethingWithBlock:(void (^)())completion {
    sleep(3);
    completion();
}

- (void)next {
    NSLog(@"next");
    [self finish];
}

- (void)finish {
    self.isFinished = YES;
}

- (void)dealloc {
    NSLog(@"I'm dieing! %@", self);
}

@end
