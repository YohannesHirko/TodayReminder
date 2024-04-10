//
//  ReminderDoneButton.h
//  Today
//
//  Created by Yohannes Hirko on 10/04/2024.
//
#import <UIKit/UIKit.h>
#ifndef ReminderDoneButton_h
#define ReminderDoneButton_h
@interface ReminderDoneButton : UIButton

@property (nonatomic) NSString *uuid;

- (instancetype) initWithUuid:(NSString *) uuid;

@end

#endif /* ReminderDoneButton_h */
