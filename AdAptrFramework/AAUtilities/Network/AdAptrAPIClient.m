//
//  AdAptrAPIClient.m
//  GithubUsers
//
//  Created by test on 07.07.20.
//  Copyright © 2020 test. All rights reserved.
//

#import "AdAptrAPIClient.h"

static NSString * const ServerAPIBaseURLString = @"https://api.github.com/";

@implementation AdAptrAPIClient

+ (instancetype)sharedClient {
    static AdAptrAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AdAptrAPIClient alloc] initWithBaseURL:[NSURL URLWithString:ServerAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

@end
