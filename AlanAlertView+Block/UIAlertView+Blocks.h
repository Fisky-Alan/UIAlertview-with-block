/*
    UIAlertView+Blocks.h
    Fisky-2015
*/

#import <UIKit/UIKit.h>

@interface UIAlertView (Blocks)
 
+ (void)showWithTitle:(NSString *)title
              message:(NSString *)message
    cancelButtonTitle:(NSString *)cancelButtonTitle
    otherButtonTitles:(NSArray *)otherButtonTitles
           completion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completionBlock;
 
- (void)showCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completionBlock;
 
@end