//
//  ReminderVCDataSource.h
//  Today
//
//  Created by Yohannes Hirko on 09/04/2024.
//
#import <Foundation/Foundation.h>
#import "ReminderListViewController.h"
#ifndef ReminderVCDataSource_h
#define ReminderVCDataSource_h
@interface ReminderListViewController (ReminderVCDataSource)

- (Reminder *) reminderWithId:(NSString *) uuid;
- (void) updateReminderWith:(Reminder *) reminder;
- (void) completeReminderWithId:(NSString *) uuid;
- (void) updateSnapshot:(NSArray *) updateuuids;
- (UICellAccessoryCustomView *) doneButtonConfigurationForReminder:(Reminder *) reminder;
- (UIAccessibilityCustomAction *) doneButtonAccecibilityActionFor:(Reminder *) reminder;
- (void) ConfigurationHandler:(UICollectionViewCell *) cell (NSIndexPath *) indexPath (id) item);

@end

#endif /* ReminderVCDataSource_h */
