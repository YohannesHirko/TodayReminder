//
//  ReminderDoneButton.m
//  Today
//
//  Created by Yohannes Hirko on 10/04/2024.
//

#import <Foundation/Foundation.h>
#import "ReminderDoneButton.h"
@implementation ReminderDoneButton

- (instancetype) initWithUuid:(NSString *)uuid
{
    self = [super init];
    if (self) {
        self.uuid = uuid;
    }
    return self;
}

@end
