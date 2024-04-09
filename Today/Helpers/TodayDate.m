//
//  TodayDate.m
//  Today
//
//  Created by Yohannes Hirko on 03/04/2024.
//

#import <Foundation/Foundation.h>
#import "TodayDate.h"
@implementation NSDate (TodayDate)

+ (NSString *) dayAndTimeText: (NSDate*) date
{
    NSCalendar *localCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:[NSLocale autoupdatingCurrentLocale].calendarIdentifier];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    if ([localCalendar isDateInToday:date]){
        NSString *timeFormat = NSLocalizedString(@"Today at", @"Today at time format string");
        return [NSString localizedStringWithFormat:@"%@ %@", timeFormat, [dateFormatter stringFromDate:date]];
    } else {
        NSString *dateAndTimeFormat = NSLocalizedString(@"at", @"Date and time string");
        [dateFormatter stringFromDate:date];
        return [NSString localizedStringWithFormat:@"%@ %@", dateAndTimeFormat, [dateFormatter stringFromDate:date]];
    }
}
+ (NSString *) dayText:(NSDate*) date
{
    NSCalendar *localCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:[NSLocale currentLocale].calendarIdentifier];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if ([localCalendar isDateInToday:date]){
        [dateFormatter setDateFormat:@"Today"];
        return [dateFormatter stringFromDate:date];
    } else {
        [dateFormatter setDateFormat:@"MM-dd"];
        return [dateFormatter stringFromDate:date];
    }
}
@end
