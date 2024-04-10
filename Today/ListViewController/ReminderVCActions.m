//
//  ReminderVCActions.m
//  Today
//
//  Created by Yohannes Hirko on 10/04/2024.
//

#import <Foundation/Foundation.h>
#import "ReminderVCActions.h"
#import "ReminderVCDataSource.h"
#import "ReminderViewController.h"

@implementation ReminderViewController (ReminderVCActions)

- (void) didPressDoneButton:(ReminderDoneButton *)sender
{
    if (sender.uuid) {
        NSString *uuid = sender.uuid;
        [self completeReminderWithId:uuid];
       
    } else {
        return;
    }
}

@end
