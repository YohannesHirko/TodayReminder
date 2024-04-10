//
//  ReminderVCDataSource.h
//  Today
//
//  Created by Yohannes Hirko on 09/04/2024.
//
#import <Foundation/Foundation.h>
#import "ReminderViewController.h"
#ifndef ReminderVCDataSource_h
#define ReminderVCDataSource_h
@interface ReminderViewController (ReminderVCDataSource)

- (Reminder *) reminderWithId:(NSString *) uuid;
- (void) updateReminderWith:(Reminder *) reminder;
- (void) completeReminderWithId:(NSString *) uuid;
- (UICellAccessoryCustomView *) doneButtonConfigurationForReminder:(Reminder*) reminder;
- (void) updateSnapshot:(NSArray *) updateuuids;

@end

#endif /* ReminderVCDataSource_h */
