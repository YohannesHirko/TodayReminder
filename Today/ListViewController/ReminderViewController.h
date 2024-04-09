//
//  ViewController.h
//  Today
//
//  Created by Yohannes Hirko on 02/04/2024.
//

#import <UIKit/UIKit.h>
#import "Reminder.h"
#ifndef ReminderViewController_h
#define ReminderViewController_h
@interface ReminderViewController : UICollectionViewController

@property (copy) UICollectionViewCellConfigurationUpdateHandler configHandler;
@property (nonatomic) NSMutableArray *reminders;
@property UICollectionViewDiffableDataSource<NSNumber *, NSString *> *dataSource;
@property NSDiffableDataSourceSnapshot<NSNumber *, NSString *> *snapshot;
- (UICollectionViewCompositionalLayout *) listLayout;
- (UICellAccessoryCustomView *) doneButtonConfigurationForReminder:(Reminder*) reminder;

@end

#endif
