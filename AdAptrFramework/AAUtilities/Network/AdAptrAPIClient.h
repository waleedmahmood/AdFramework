//
//  AdAptrAPIClient.h
//  GithubUsers
//
//  Created by test on 07.07.20.
//  Copyright © 2020 test. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdAptrAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end

NS_ASSUME_NONNULL_END
