//
//
//
//  ViewController.m
//  Today
//
//  Created by Yohannes Hirko on 02/04/2024.
//

#import "ReminderListViewController.h"
#import "../DetailViewController/DetailViewController.h"
#import "ReminderVCDataSource.h"
#import "Reminder.h"
#import "TodayDate.h"


@interface ReminderListViewController ()

@end

@implementation ReminderListViewController

- (void)setReminders {
    NSMutableArray *debugReminders = [[NSMutableArray alloc] initWithArray:Reminder.debugReminders];
    self.reminders = debugReminders;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self reminderWithId:[self.reminders objectAtIndex:6]];
    self.collectionView.collectionViewLayout = self.listLayout;
    
    [self setReminders];
    UICollectionViewCellRegistration *cellRegistration = [UICollectionViewCellRegistration registrationWithCellClass:[UICollectionViewListCell class] configurationHandler:^(UICollectionViewListCell *cell, NSIndexPath *indexPath, NSString *uuid) {
        NSLog(@"%ld", (long)indexPath.row);
        Reminder *reminder = [self reminderWithId:uuid];
        UIListContentConfiguration *contentConfiguration = cell.defaultContentConfiguration;
        
        contentConfiguration.text = [reminder title];
        contentConfiguration.secondaryText = [NSDate dayAndTimeText:reminder.dueDate];
        contentConfiguration.secondaryTextProperties.font = [UIFont preferredFontForTextStyle: UIFontTextStyleCaption1];
        
        cell.contentConfiguration = contentConfiguration;
        
        UICellAccessoryCustomView *doneButtonConfig = [self doneButtonConfigurationForReminder:reminder];
        doneButtonConfig.tintColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return [UIColor colorNamed:@"TodayListCellDoneButtonTint"];
        }];
        NSArray *accessories = [[NSArray alloc] initWithObjects:doneButtonConfig,[[UICellAccessoryDisclosureIndicator alloc] init], nil];
        [cell setAccessories:accessories];
        [cell setAccessibilityCustomActions:@[[self doneButtonAccecibilityActionFor:reminder]]];
        NSString *accessibilityValue;
        if (reminder.isComplete) {
            accessibilityValue =  NSLocalizedString(@"Completed", comment: @"Reminder completed value");
        } else {
            NSLocalizedString(@"Not completed", comment: @"Reminder not completed value");
        }
        [cell setAccessibilityValue:accessibilityValue];
        UIBackgroundConfiguration *bgConfig = [UIBackgroundConfiguration listGroupedCellConfiguration];
        bgConfig.backgroundColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            return [UIColor colorNamed:@"TodayListCellBackground"];
        }];
        
        cell.backgroundConfiguration = bgConfig;
    }];
    
    self.dataSource = [[UICollectionViewDiffableDataSource alloc] initWithCollectionView:self.collectionView cellProvider:^UICollectionViewCell *(UICollectionView *collectionView, NSIndexPath *indexPath, NSString *item) {
        return  [collectionView dequeueConfiguredReusableCellWithRegistration:cellRegistration forIndexPath:indexPath item:item];
    }];
    
    
    self.snapshot = [[NSDiffableDataSourceSnapshot alloc] init];
    NSArray *sections = @[@0];
    [_snapshot appendSectionsWithIdentifiers:sections];
    
    NSMutableArray *uuids = [[NSMutableArray alloc]init];
    for (Reminder *reminder in self.reminders) {
        [uuids addObject:reminder.uuid];
    }
    
    [_snapshot appendItemsWithIdentifiers:uuids];
    [_dataSource applySnapshot:_snapshot animatingDifferences:true];
    
    [self.collectionView setDataSource:_dataSource];
    
    
    self.navigationItem.title = NSLocalizedString(@"Reminders", "Reminder view controller title");
    
}



- (UICollectionViewCompositionalLayout *)listLayout
{
    UICollectionLayoutListConfiguration *listConfiguration = [[UICollectionLayoutListConfiguration alloc] initWithAppearance: UICollectionLayoutListAppearanceGrouped];
    [listConfiguration setShowsSeparators:false];
    [listConfiguration setBackgroundColor:[[UIColor alloc] initWithWhite:1.0 alpha:0] ];
    
    return [UICollectionViewCompositionalLayout layoutWithListConfiguration:listConfiguration];
}

-(void)pushDetailViewForReminder:(NSString *)uuid{
    Reminder *reminder = [Reminder.debugReminders objectAtIndex:0];
    DetailViewController *viewController = [[DetailViewController alloc] initWithReminder:reminder];
    if (self.navigationController) {
        [self.navigationController pushViewController:viewController animated:true];
    }
    
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%@", indexPath);
    Reminder *reminder = [Reminder.debugReminders objectAtIndex:indexPath.item];
    [self pushDetailViewForReminder:reminder.uuid];
    return NO;
}

@end
