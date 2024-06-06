//
//  ReminderViewController.h
//  Today
//
//  Created by Yohannes Hirko on 16/04/2024.
//
#import <UIKit/UIKit.h>
#import "Reminder.h"
#ifndef DetailViewController_h
#define DetailViewController_h
typedef UICollectionViewDiffableDataSource<NSNumber *, NSNumber *> DataSource2;
typedef NSDiffableDataSourceSnapshot<NSNumber *, NSNumber *> Snapshot2;
@interface DetailViewController: UICollectionViewController
@property DataSource2 *dataSource;
@property Snapshot2 *snapshot;
@property Reminder *reminder;
- (instancetype) initWithReminder:(Reminder *)reminder;
- (instancetype)initWithCoder:(NSCoder *)coder;
- (void) updateSnapshotForViewing;



@end

#endif /* ReminderViewController_h */
