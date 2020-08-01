//
//  KeyboardHeightObserver.h
//  keyBoardObserver
//
//  Created by Юлия Лопатина on 8/1/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KeyboardHeightObserver : NSObject
@property (nonatomic, copy, nullable) void (^KeyBoardHeighChanged)(NSNumber* height);
@end

NS_ASSUME_NONNULL_END
