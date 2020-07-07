//
//  Repository.m
//  GithubUsers
//
//  Created by test on 07.07.20.
//  Copyright © 2020 test. All rights reserved.
//

#import "Repository.h"
#import "AdAptrAPIClient.h"

@implementation Repository

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.name = [attributes valueForKeyPath:@"name"];
    return self;
}

#pragma mark -

+ (NSURLSessionDataTask *)getPublicRepositoriesFor:(NSString*) username andCompletionBlock:(void (^)(NSArray *respositories, NSError *error))block {
    NSString *path = [NSString stringWithFormat:@"users/%@/repos", username];//@"users/waleedmahmood/repos"
    return [[AdAptrAPIClient sharedClient] GET:path parameters:nil headers: nil progress:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray *reposFromRes = [[NSArray alloc] initWithArray:JSON];
        NSMutableArray *mutableRepos = [NSMutableArray arrayWithCapacity:[reposFromRes count]];
        for (id attributes in reposFromRes) {
            NSDictionary *json = [NSDictionary dictionaryWithDictionary:attributes];
            Repository *repo = [[Repository alloc] initWithAttributes:json];
            [mutableRepos addObject:repo];
        }
        if (block) {
            block([NSArray arrayWithArray:mutableRepos], nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

@end
