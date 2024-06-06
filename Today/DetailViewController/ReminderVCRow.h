//
//  ReminderVCRow.h
//  Today
//
//  Created by Yohannes Hirko on 17/04/2024.
//

#import "DetailViewController.h"
#import <UIKit/UIKit.h>
#ifndef ReminderVCRow_h
#define ReminderVCRow_h
typedef NS_ENUM(NSInteger, Row) {
    dates,
    notes,
    titles,
    times
};
typedef NS_ENUM(NSInteger, Section) {
    sview,
    stitle,
    sdate,
    snotes
};
@interface DetailViewController (ReminderVCRow)
- (NSString *) getImageName:(Row) row;
- (UIImage *) getImage:(Row) row;
- (UIFontTextStyle) getTextStyle:(Row) row;
- (Row) getRowEnumFor:(NSNumber *__strong)itemIdentifier;
- (Section) getSectionEnumFor:(NSNumber *__strong)sectionIdentifier;
- (NSString *) getSectionHeaderFor:(Section) section;
@end

#endif /* ReminderVCRow_h */
