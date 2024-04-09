//
//  Reminder.m
//  Today
//
//  Created by Yohannes Hirko on 02/04/2024.
//

#import "Reminder.h"

static NSArray *debugReminders;

@implementation Reminder

- (instancetype)initWithTitle:(NSString *)title dueDate:(NSDate *)dueDate notes:(NSString *)notes
{
    if (self) {
        self.uuid = [[[NSUUID alloc] init] UUIDString];
        self.title = title;
        self.dueDate = dueDate;
        self.notes = notes;
        self.isComplete = TRUE;
    }
    return  self;
}

#ifdef DEBUG
+ (NSMutableArray *)debugReminders 
{
    static NSArray *_debugReminders;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _debugReminders = @[
            [[Reminder alloc]initWithTitle:@"Submit reimbursement report" dueDate:[[NSDate alloc] initWithTimeIntervalSinceNow:101000.0] notes:@"Don't forget about taxi receipts"],
         
            [[Reminder alloc]initWithTitle:@"Code review" dueDate:[[NSDate alloc] initWithTimeIntervalSinceNow:14000.0] notes:@"Check tech specs in shared folder"],
            
            [[Reminder alloc]initWithTitle:@"Pick up new contacts" dueDate:[[NSDate alloc] initWithTimeIntervalSinceNow:24000.0] notes:@"Optometrist closes at 6:00PM"],
            
            [[Reminder alloc]initWithTitle:@"Add notes to retrospective" dueDate:[[NSDate alloc] initWithTimeIntervalSinceNow:32000.0] notes:@"Collaborate with project manager"],
            
            [[Reminder alloc]initWithTitle:@"Interview new project manager candidate" dueDate:[[NSDate alloc] initWithTimeIntervalSinceNow:6000.0] notes:@"Review portfolio"],
            
            [[Reminder alloc]initWithTitle:@"Mock up onboarding experience" dueDate:[[NSDate alloc] initWithTimeIntervalSinceNow:72000.0] notes:@"Think different"],
            
            [[Reminder alloc]initWithTitle:@"Review usage analytics" dueDate:[[NSDate alloc] initWithTimeIntervalSinceNow:83000.0] notes:@"Discuss trends with management"],
            
            [[Reminder alloc]initWithTitle:@"Confirm group reservation" dueDate:[[NSDate alloc] initWithTimeIntervalSinceNow:92500.0] notes:@"Ask about space heaters"],
            
            [[Reminder alloc]initWithTitle:@"Add beta testers to TestFlight" dueDate:[[NSDate alloc] initWithTimeIntervalSinceNow:101000.0] notes:@"v0.9 out on Friday"],


        ];
      });
    return _debugReminders;
}
#endif

@end
