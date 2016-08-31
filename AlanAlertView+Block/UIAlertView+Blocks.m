/*
    UIAlertView+Blocks.m
    Fisky-2015
*/

#import "UIAlertView+Blocks.h"
#import <objc/runtime.h>

@interface UIAlertViewWrapper : NSObject <UIAlertViewDelegate>

@property (copy) void(^completionBlockFisky)(UIAlertView *alertView, NSInteger buttonIndex);

@end

@implementation UIAlertViewWrapper

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.completionBlockFisky)
        self.completionBlockFisky(alertView, buttonIndex);
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    if (self.completionBlockFisky)
        self.completionBlockFisky(alertView, alertView.cancelButtonIndex);
}

@end

static const char kUIAlertViewWrapper;

@implementation UIAlertView (Blocks)

+ (void)showWithTitle:(NSString *)title
              message:(NSString *)message
    cancelButtonTitle:(NSString *)cancelButtonTitle
    otherButtonTitles:(NSArray *)otherButtonTitles
           completion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completionBlock
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:cancelButtonTitle
                             
                                              otherButtonTitles:nil];
    for (NSString *buttonTitle in otherButtonTitles)
        [alertView addButtonWithTitle:buttonTitle];
    
    [alertView showCompletion:completionBlock];
}

- (void)showCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completionBlock
{
    UIAlertViewWrapper *wrapper = [[UIAlertViewWrapper alloc] init];
    wrapper.completionBlockFisky = completionBlock;
    self.delegate = wrapper;
    objc_setAssociatedObject(self, &kUIAlertViewWrapper, wrapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self show];
}

@end
