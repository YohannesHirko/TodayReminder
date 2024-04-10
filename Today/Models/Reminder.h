//
//  Reminder.h
//  Today
//
//  Created by Yohannes Hirko on 02/04/2024.
//


#import <Foundation/Foundation.h>
@interface Reminder: NSObject

@property (nonatomic)NSString *uuid;
@property (nonatomic)NSString *title;
@property (nonatomic)NSDate *dueDate;
@property (nonatomic)NSString *notes;
@property (nonatomic)BOOL isComplete;
#ifdef DEBUG
+ (NSMutableArray *) debugReminders;
#endif
- (instancetype) initWithTitle:(NSString *)title dueDate:(NSDate *)dueDate notes:(NSString *)notes;
@end

