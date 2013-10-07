//
//  NotifyItem.m
//  APNSClient
//

#import "NotifyItem.h"

@implementation NotifyItem

@synthesize year = _year;
@synthesize month = _month;
@synthesize day = _day;

@synthesize hour = _hour;
@synthesize minute = _minute;
@synthesize second = _second;

@synthesize eventName = _eventName;

-(NotifyItem*)initWithDateComponents:(NSDateComponents*)dateComponents andName:(NSString*)name{
    if (self = [super init]) {
        self.year =  dateComponents.year;
        self.month =  dateComponents.month;
        self.day =  dateComponents.day;
        
        self.hour =  dateComponents.hour;
        self.minute =  dateComponents.minute;
        self.second =  dateComponents.second;
        
        self.eventName = name;
    }
    return self;
}

@end
