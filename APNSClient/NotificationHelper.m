//
//  NotificationHelper.m
//  APNSClient
//

#import "NotificationHelper.h"

@implementation NotificationHelper

+ (void)scheduleNotificationWithItem:(NotifyItem *)item afterInterval:(int)minutesAfter {
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    
    [dateComps setDay:item.day];
    
    [dateComps setMonth:item.month];
    
    [dateComps setYear:item.year];
    
    [dateComps setHour:item.hour];
    
    [dateComps setMinute:item.minute];
    
    NSDate *itemDate = [calendar dateFromComponents:dateComps];
    
    
    
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    
    if (localNotif == nil)
        
        return;
    
    localNotif.fireDate = [itemDate addTimeInterval:+(minutesAfter*60)];
    
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    
    
    
    localNotif.alertBody = [NSString stringWithFormat:NSLocalizedString(@"Notified %@ after %i minutes.", nil),
                            
                            item.eventName, minutesAfter];
    
    localNotif.alertAction = NSLocalizedString(@"View Details", nil);
    
    
    
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    
    localNotif.applicationIconBadgeNumber = 1;
    
    
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:item.eventName forKey:@"mykey"];
    
    localNotif.userInfo = infoDict;
    
    
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    
}

@end
