//
//  SharedActivity.h
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 25/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SharedActivity : UIView

+ (SharedActivity *)sharedInstance;

/**
 * Indicates that a thread wants the network activity indicator visible.
 * Threadsafe.
 */
- (void)startActivity;

/**
 * Indicates that a thread is no longer interested in the network activity
 * indicator's visiblility. Threadsafe.
 */
- (void)stopActivity;

@end
