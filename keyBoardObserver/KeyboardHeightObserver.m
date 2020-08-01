//
//  KeyboardHeightObserver.m
//  keyBoardObserver
//
//  Created by Юлия Лопатина on 8/1/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "KeyboardHeightObserver.h"
#import "UIKit/UIKit.h"

@implementation KeyboardHeightObserver
- (void)subscribeOnKeyboardEvents {
    // Keyboard will show
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillShow:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
    // Keyboard will hide
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillHide:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
    
    // Keyboard will change frame
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillChangeFrame:)
                                               name:UIKeyboardWillChangeFrameNotification
                                             object:nil];
    
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

/*- (void)keybaordWillShow:(NSNotification *)notification {
    CGRect rect = [(NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.keyBoardBlock(rect.size.height);
    [self.view layoutIfNeeded];
}

- (void)keybaordWillHide:(NSNotification *)notification {
    self.keyBoardBlock(0);
    [self.view layoutIfNeeded];
}

- (void)keybaordWillChangeFrame:(NSNotification *)notification {
    CGRect rect = [(NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.keyBoardBlock(rect.size.height);
    [self.view layoutIfNeeded];
}*/
@end
