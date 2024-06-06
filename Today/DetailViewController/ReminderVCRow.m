//
//  ReminderVCRow.m
//  Today
//
//  Created by Yohannes Hirko on 17/04/2024.
//

#import <Foundation/Foundation.h>
#import "DetailViewController.h"
#import "ReminderVCRow.h"
@implementation DetailViewController (ReminderVCRow)

-(NSString *) getImageName:(Row) row;
{
    switch (row) {
        case dates:
            return @"calendar.circle";
            break;
        case notes:
            return @"square.and.pencil";
            break;
        case times:
            return @"clock";
        default:
            return nil;
            break;
    }
}

- (UIImage *) getImage:(Row) row{
    UIImageSymbolConfiguration *config = [UIImageSymbolConfiguration configurationWithTextStyle: UIFontTextStyleHeadline];
    
    NSString *imageName = [self getImageName:row];
    return [UIImage systemImageNamed:imageName withConfiguration:config];
}


- (UIFontTextStyle)getTextStyle:(Row)row {
    switch (row) {
       case titles:
            return UIFontTextStyleHeadline;
        default:
            return UIFontTextStyleSubheadline;
            break;
    }
}
- (Row) getRowEnumFor:(NSNumber *__strong)itemIdentifier{
    switch (itemIdentifier.intValue) {
        case 0 :
            return titles;
            break;
        case 1 :
            return dates;
            break;
        case 2 :
            return times;
            break;
        case 3 :
            return notes;
            break;
        default:
            return titles;
            break;
    }
}
- (Section) getSectionEnumFor:(NSNumber *__strong)sectionIdentifier{
    switch (sectionIdentifier.intValue) {
        case 0 :
            return sview;
            break;
        case 1 :
            return stitle;
            break;
        case 2 :
            return sdate;
            break;
        case 3 :
            return snotes;
            break;
        default:
            return stitle;
            break;
    }
}
- (NSString *) getSectionHeaderFor:(Section) section{
    switch (section) {
        case sview:
            return @"";
            break;
        case stitle:
            return NSLocalizedString(@"Title", "Title section name");
            break;
        case sdate:
            return NSLocalizedString(@"Date", "Date section name");;
            break;
        case snotes:
            return NSLocalizedString(@"Notes", "Notes section name");;
            break;
            
        default:
            return @"";
            break;
    }
}

@end
