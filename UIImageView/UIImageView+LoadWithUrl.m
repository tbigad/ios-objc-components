//
//  UIImageView+LoadWithUrl.m
//  rs.ios-stage2-task7
//
//  Created by Pavel N on 7/21/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import "UIImageView+LoadWithUrl.h"
#import <UIKit/UIKit.h>

@implementation UIImageView (LoadWithUrl)
- (void)loadImageWithUrl:(NSURL *)url andPlaceholder:(UIImage *)placeholder {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURLCache* cache = [NSURLCache sharedURLCache];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        NSCachedURLResponse *cachedResponse = [cache cachedResponseForRequest:request];
        if (cachedResponse) {
            UIImage *image = [UIImage imageWithData:cachedResponse.data];
            [weakSelf setImageInMain:image];
        } else {
            [weakSelf setImageInMain:placeholder];
            
            NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (error) {
                    return;
                }
                NSCachedURLResponse *cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:response data:data];
                [cache storeCachedResponse:cachedResponse forRequest:request];
                UIImage *image = [UIImage imageWithData:data];
                [weakSelf setImageInMain:image];
            }];
            [dataTask resume];
        }
    });
}

- (void) setImageInMain:(UIImage*)image {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setImage:image];
    });
}
@end
