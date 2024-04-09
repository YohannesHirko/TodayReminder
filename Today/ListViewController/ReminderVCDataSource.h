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

- (void) reminderWithId:(NSString *) uuid;

@end

#endif /* ReminderVCDataSource_h */
