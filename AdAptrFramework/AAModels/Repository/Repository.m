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
    
    // A BETTER APPROACH WOULD BE:
    // Using Codeable and Decodable protocols introduced recently.
    
    // Simply assign the relavant properties
    self.name = [attributes valueForKeyPath:@"name"];
    
    return self;
}

#pragma mark - Public Methods

+ (NSURLSessionDataTask *)getPublicRepositoriesFor:(NSString*) username andCompletionBlock:(void (^)(NSArray *respositories, NSError *error))block {
    
    // Create a string for path of API end point
    NSString *path = [NSString stringWithFormat:@"users/%@/repos", username];
    
    // Return a shared instance referene for completion and failure of the request
    return [[AdAptrAPIClient sharedClient] GET:path parameters:nil headers: nil progress:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        // Convert response object to an NSArry for easy manipulation
        // and also create a mutable array for holding parsed objects
        NSArray *reposFromRes = [[NSArray alloc] initWithArray:JSON];
        NSMutableArray *mutableRepos = [NSMutableArray arrayWithCapacity:[reposFromRes count]];
        
        // Iterate over the objects to form custome objects
        for (id attributes in reposFromRes) {
            // type-cast for better readability
            NSDictionary *json = [NSDictionary dictionaryWithDictionary:attributes];
            
            // Create Repository objects and put them in mutable-array
            Repository *repo = [[Repository alloc] initWithAttributes:json];
            [mutableRepos addObject:repo];
        }
        
        // Return the block, if it is passed by the caller
        if (block) {
            block([NSArray arrayWithArray:mutableRepos], nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        
        // For failure, create an empty array and pass in the possible error
        if (block) {
            block([NSArray array], error);
        }
    }];
}

@end
