//
//  ReminderViewController.m
//  Today
//
//  Created by Yohannes Hirko on 16/04/2024.
//

#import <Foundation/Foundation.h>
#import "DetailViewController.h"
#import "ReminderVCRow.h"
#import "TodayDate.h"
#import "Reminder.h"

@implementation DetailViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    return self;
}

- (instancetype) initWithReminder:(Reminder *) reminder{
    UICollectionLayoutListConfiguration *listConfig = [[UICollectionLayoutListConfiguration alloc] initWithAppearance:UICollectionLayoutListAppearanceInsetGrouped];
    [listConfig setShowsSeparators:false];
    UICollectionViewCompositionalLayout *listLayout = [UICollectionViewCompositionalLayout layoutWithListConfiguration:listConfig];
    self = [super initWithCollectionViewLayout:listLayout];
    if (self) {
        self.reminder = reminder;
    }
    return self;
}
- (NSString *) textForRow:(Row) row {
    switch (row) {
        case dates:
            return [NSDate dayText:self.reminder.dueDate];
            break;
        case notes:
            return self.reminder.notes;
            break;
        case times:
            return [NSDate dayAndTimeText:self.reminder.dueDate];
            break;
        case titles:
            return self.reminder.title;
        default:
            return @"noo";
            break;
    }
    
}
- (void) viewDidLoad{
    [super viewDidLoad];
    UICollectionViewCellRegistration *cellRegistration = [UICollectionViewCellRegistration registrationWithCellClass:[UICollectionViewListCell class] configurationHandler:^(UICollectionViewListCell *cell, NSIndexPath *indexPath, NSNumber *identifier) {
        NSLog(@"%ld section", (long)indexPath.section);
        NSLog(@"%ld item", (long)indexPath.item);
        if (indexPath.section == 0) {
            UIListContentConfiguration *contentConfiguration = cell.defaultContentConfiguration;
            
            contentConfiguration.text = [self textForRow:[self getRowEnumFor:identifier]];
            contentConfiguration.image = [self getImage:[self getRowEnumFor:identifier]];
            contentConfiguration.textProperties.font = [UIFont preferredFontForTextStyle:[self getTextStyle:[self getRowEnumFor:identifier]]] ;
            cell.contentConfiguration = contentConfiguration;
        } else {
            
        }
        
        
        cell.tintColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return [UIColor colorNamed:@"TodayPrimaryTint"];
        }];
        
    }];
    self.dataSource = [[UICollectionViewDiffableDataSource alloc] initWithCollectionView:self.collectionView cellProvider:^UICollectionViewCell *(UICollectionView *collectionView, NSIndexPath *indexPath, NSNumber *item) {
        return  [collectionView dequeueConfiguredReusableCellWithRegistration:cellRegistration forIndexPath:indexPath item:item];
    }];
    [[self navigationItem] setTitle:NSLocalizedString(@"Reminder", "Reminder view controller title")];
    [[self navigationItem] setRightBarButtonItem: [self editButtonItem]];
    [self updateSnapshotForViewing];
    
}
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    if (editing) {
        [self updateSnapshotForEditing];
    } else {
        [self updateSnapshotForViewing];
    }
}


- (void)updateSnapshotForViewing {
    Snapshot2 *snapshot = [[NSDiffableDataSourceSnapshot alloc] init];
    [snapshot appendSectionsWithIdentifiers:@[@0]];
    [snapshot appendItemsWithIdentifiers:@[@0, @1, @2, @3] intoSectionWithIdentifier:@0];
    [self.dataSource applySnapshot:snapshot animatingDifferences:true];
}
-(void)updateSnapshotForEditing {
    Snapshot2 *snapshot = [[NSDiffableDataSourceSnapshot alloc] init];
    [snapshot appendSectionsWithIdentifiers:@[@1,@2,@3]];
    [snapshot appendItemsWithIdentifiers:@[@0] intoSectionWithIdentifier:@1];
    [snapshot appendItemsWithIdentifiers:@[@1] intoSectionWithIdentifier:@2];
    [snapshot appendItemsWithIdentifiers:@[@3] intoSectionWithIdentifier:@3];
    [self.dataSource applySnapshot:snapshot animatingDifferences:true];
}





@end
