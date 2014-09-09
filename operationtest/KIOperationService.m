//
//  KIOperationService.m
//  operationtest
//
//  Created by kaiinui on 2014/09/08.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIOperationService.h"
#import "KISomeOperation.h"

@interface KIOperationService ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation KIOperationService

+ (instancetype)service {
    static KIOperationService *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[KIOperationService alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.operationQueue = [[NSOperationQueue alloc] init];
        self.operationQueue.maxConcurrentOperationCount = 1;
    }
    return self;
}

- (void)someOperation {
    KISomeOperation *operation = [[KISomeOperation alloc] init];
    [self.operationQueue addOperation:operation];
}

@end
