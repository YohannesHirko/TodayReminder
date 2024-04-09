//
//  ReminderVCDataSource.m
//  Today
//
//  Created by Yohannes Hirko on 09/04/2024.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ReminderVCDataSource.h"
@implementation ReminderViewController (ReminderVCDataSource)


- (void) reminderWithId:(NSString *) uuid {
    NSInteger index = [self.reminders indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%lu", (unsigned long)idx);
        return true;
    }];
}



@end
