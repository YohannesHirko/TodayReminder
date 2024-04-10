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

typedef UICollectionViewDiffableDataSource<NSNumber *, NSString *> DataSource;
typedef NSDiffableDataSourceSnapshot<NSNumber *, NSString *> Snapshot;

@interface ReminderViewController : UICollectionViewController

@property (copy) UICollectionViewCellConfigurationUpdateHandler configHandler;
@property (nonatomic) NSMutableArray *reminders;
@property DataSource *dataSource;
@property Snapshot *snapshot;
- (UICollectionViewCompositionalLayout *) listLayout;


@end

#endif
