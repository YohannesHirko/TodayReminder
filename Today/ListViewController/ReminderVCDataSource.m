//
//  ReminderVCDataSource.m
//  Today
//
//  Created by Yohannes Hirko on 09/04/2024.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ReminderVCDataSource.h"
#import "ReminderDoneButton.h"
#import "ReminderVCActions.h"
@implementation ReminderListViewController (ReminderVCDataSource)


- (Reminder*) reminderWithId:(NSString *) uuid
{
    NSInteger index = [self.reminders indexOfObjectPassingTest:^BOOL(Reminder* obj, NSUInteger idx, BOOL* stop) {
        return ([[obj uuid] isEqual:uuid]);
    }];

    return [self.reminders objectAtIndex:index];
}

- (void) updateReminderWith:(Reminder *) reminder
{
    NSInteger index = [self.reminders indexOfObjectPassingTest:^BOOL(Reminder* obj, NSUInteger idx, BOOL* stop) {
        return ([[obj uuid] isEqual:reminder.uuid]);
    }];
    [self.reminders replaceObjectAtIndex:index withObject:reminder];
}

- (void)completeReminderWithId:(NSString *) uuid
{
     NSInteger index = [self.reminders indexOfObjectPassingTest:^BOOL(Reminder* obj, NSUInteger idx, BOOL* stop) {
        return ([[obj uuid] isEqual:uuid]);
    }];
    Reminder *reminder = [self.reminders objectAtIndex:index];
    [reminder setIsComplete:!reminder.isComplete];
    [self updateReminderWith:reminder];
#ifdef DEBUG
    NSLog(@"%@ ? %d", reminder.title, reminder.isComplete);
    
#endif
    [self updateSnapshot:@[reminder.uuid]];
}

- (void) updateSnapshot:(NSMutableArray *) updateuuids
{
    Snapshot *snapshot = [[NSDiffableDataSourceSnapshot alloc] init];
    NSArray *sections = @[@0];
    [snapshot appendSectionsWithIdentifiers: sections];
    NSMutableArray *uuids = [[NSMutableArray alloc]init];
    for (Reminder *reminder in self.reminders) {
        [uuids addObject:reminder.uuid];
    }
    [snapshot appendItemsWithIdentifiers:uuids];
    if ([updateuuids count] != 0) {
        [snapshot reloadItemsWithIdentifiers:updateuuids];
    }
    [self.dataSource applySnapshot:snapshot animatingDifferences:true];
}

- (UICellAccessoryCustomView *)doneButtonConfigurationForReminder:(Reminder *)reminder
{
    NSString *symboleName = [[NSString alloc] init];
    if (reminder.isComplete){
        symboleName = @"circle.fill";
    }else{
        symboleName = @"circle";
    }
    UIImageSymbolConfiguration *symbolConfiguration = [UIImageSymbolConfiguration configurationWithTextStyle: UIFontTextStyleTitle1];
    UIImage *image = [UIImage systemImageNamed:symboleName withConfiguration:symbolConfiguration];
    UIButton *button = [[ReminderDoneButton alloc] initWithUuid:reminder.uuid];
    [button addTarget:self action:@selector(didPressDoneButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage: image forState: normal];
    return [[UICellAccessoryCustomView alloc] initWithCustomView:button placement:UICellAccessoryPlacementLeading];
}

- (UIAccessibilityCustomAction *) doneButtonAccecibilityActionFor:(Reminder *) reminder
{
    ReminderListViewController * __weak weakSelf = self;
    NSAttributedString *name = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Toggle complition", @"Reminder done button acccessibility label")];
    UIAccessibilityCustomAction *action = [[UIAccessibilityCustomAction alloc]
                                           initWithAttributedName:name
                                           actionHandler:^BOOL(UIAccessibilityCustomAction * customAction) {
        [weakSelf completeReminderWithId:reminder.uuid];
        return  true;
    }];
    return action;
}
@end
