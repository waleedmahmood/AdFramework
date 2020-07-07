//
//  Repository.h
//  GithubUsers
//
//  Created by test on 07.07.20.
//  Copyright © 2020 test. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Repository : NSObject

@property (nonatomic, strong) NSString *name;

+ (NSURLSessionDataTask *)getPublicRepositoriesFor:(NSString*) username andCompletionBlock:(void (^)(NSArray *respositories, NSError *error))block;

@end

NS_ASSUME_NONNULL_END
