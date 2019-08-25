//
//  SharedActivity.m
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 25/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//


#import "SharedActivity.h"

static SharedActivity *sharedInstance = nil;

@interface SharedActivity(PrivateMethods)
- (void)prepareView;
@end

@interface SharedActivity () {
    UIView *parentView;
    UIActivityIndicatorView *progressIndicator;
    UILabel *messageLabel;
}

@end

@implementation SharedActivity


#pragma Mark Action for Initiating the Shared Instance that is Globally Available for All over Project

/**
 *  Log a Start Initiating the Shared Instance that is Globally Available for All over Project
 *  users are doing this and how much they're intracting to Shared Instance related to other important
 *  USER LIST-related metrics.
 */

+ (SharedActivity *)sharedInstance {
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
    }
    return sharedInstance;
}


/**
 * Indicates that a thread wants the network activity indicator visible.
 * Threadsafe.
 */
- (void)startActivity {
    [self hideView];
    CGRect frame = CGRectMake(0.0f, 0.0f, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    if ([super initWithFrame:frame]) {
        [self prepareView];
    }
    [self showView];
}

/**
 * Indicates that a thread is no longer interested in the network activity
 * indicator's visiblility. Threadsafe.
 */
- (void)stopActivity {
    [self hideView];
}

#pragma MARK for Showing The Loader View

- (void) showView {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    parentView                    = [[UIView alloc] initWithFrame:CGRectMake(100.0f, 200.0f, 120.0f, 120.0f)];
    parentView.layer.cornerRadius = 6.0;
    UIWindow *window              = [[UIApplication sharedApplication] keyWindow];
    parentView.center             = window.center;
    [parentView setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
    [parentView addSubview:self];
    [window addSubview:parentView];
}

#pragma MARK for Hiding The Loader View

- (void) hideView {
    [progressIndicator removeFromSuperview];
    progressIndicator = nil;
    [messageLabel removeFromSuperview];
    messageLabel = nil;
    [parentView removeFromSuperview];
    parentView = nil;
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];
}

#pragma mark PRIVATE METHODS

- (void)prepareView {
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:YES];
    progressIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(45.0f, 25.0f, 30.0f, 30.0f)];
    messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(25.0f, 70.0f, 80.0f, 30.0f)];
    [progressIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    [progressIndicator setColor:[Cars24DAO colorFromHexString:@"#196498" andFloatValue:1.0f]];
    [progressIndicator startAnimating];
    [self addSubview:progressIndicator];
    [messageLabel setTextColor:[UIColor whiteColor]];
    [messageLabel setBackgroundColor:[UIColor clearColor]];
    messageLabel.text = @"Loading...";
    messageLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:messageLabel];
}

@end

