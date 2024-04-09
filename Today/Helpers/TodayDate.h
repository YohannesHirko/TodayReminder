//
//  TodayDate.h
//  Today
//
//  Created by Yohannes Hirko on 03/04/2024.
//
#import <Foundation/Foundation.h>


@interface NSDate (TodayDate)

+ (NSString *) dayAndTimeText: (NSDate *) date;
+ (NSString *) dayText:(NSDate*) date;

@end

