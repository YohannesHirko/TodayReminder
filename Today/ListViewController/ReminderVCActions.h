//
//  ReminderVCActions.h
//  Today
//
//  Created by Yohannes Hirko on 10/04/2024.
//
#import <UIKit/UIKit.h>
#import "ReminderListViewController.h"
#import "ReminderDoneButton.h"
#ifndef ReminderVCActions_h
#define ReminderVCActions_h

@interface ReminderListViewController (ReminderVCActions)

- (void) didPressDoneButton:(ReminderDoneButton *)sender;

@end

#endif /* ReminderVCActions_h */
