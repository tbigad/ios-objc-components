//
//  UIImageView+LoadWithUrl.h
//  rs.ios-stage2-task7
//
//  Created by Pavel N on 7/21/20.
//  Copyright © 2020 Pavel N. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (LoadWithUrl)
- (void) loadImageWithUrl:(NSURL*)url andPlaceholder:(UIImage*)placeholder;
@end

NS_ASSUME_NONNULL_END
