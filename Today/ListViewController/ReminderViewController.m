//
//
//
//  ViewController.m
//  Today
//
//  Created by Yohannes Hirko on 02/04/2024.
//

#import "ReminderViewController.h"
#import "ReminderVCDataSource.h"
#import "Reminder.h"
#import "TodayDate.h"

@interface ReminderViewController ()

@end

@implementation ReminderViewController

- (void)setReminders {
    self.reminders = Reminder.debugReminders;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reminderWithId:[self.reminders objectAtIndex:6]];
    self.collectionView.collectionViewLayout = self.listLayout;
    
    [self setReminders];
    UICollectionViewCellRegistration *cellRegistration = [UICollectionViewCellRegistration registrationWithCellClass:[UICollectionViewListCell class] configurationHandler:^(UICollectionViewListCell *cell, NSIndexPath *indexPath, NSString *uuid) {
        
        Reminder *reminder = [self.reminders objectAtIndex:indexPath.item];
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
    
}



- (UICollectionViewCompositionalLayout *)listLayout
{
    UICollectionLayoutListConfiguration *listConfiguration = [[UICollectionLayoutListConfiguration alloc] initWithAppearance: UICollectionLayoutListAppearanceGrouped];
    [listConfiguration setShowsSeparators:false];
    [listConfiguration setBackgroundColor:[[UIColor alloc] initWithWhite:1.0 alpha:0] ];
    
    return [UICollectionViewCompositionalLayout layoutWithListConfiguration:listConfiguration];
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
    UIButton *button = [[UIButton alloc] init];
    [button setImage: image forState: normal];
    return [[UICellAccessoryCustomView alloc] initWithCustomView:button placement:UICellAccessoryPlacementLeading];
}

@end
