//
//  AsyncOperation.m
//
//  Created by Pavel N on 6/13/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "AsyncOperation.h"

@interface AsyncOperation(){
    @private
    BOOL _executing;
    BOOL _finished;
}
@end

@implementation AsyncOperation

- (instancetype)init
{
    self = [super init];
    if (self) {
        _executing = false;
        _finished = false;
    }
    return self;
}

- (BOOL)isAsynchronous {
    return true;
}

- (BOOL)isExecuting {
    return _executing;
}

- (BOOL)isFinished {
    return _finished;
}

- (void)main {
    [NSException raise:NSGenericException format:@"Should be overriden"];
}

- (void)start {
    if ([self isCancelled]) {
        [self finish];
        return;
    }
    [self willChangeValueForKey:@"isExecuting"];
    _executing = true;
    [self main];
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)finish {
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    _finished = true;
    _executing = false;
    [self didChangeValueForKey:@"isFinished"];
    [self didChangeValueForKey:@"isExecuting"];
}
@end
