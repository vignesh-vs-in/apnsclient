//
//  NotificationHelper.h
//  APNSClient
//

#import <Foundation/Foundation.h>
#import "NotifyItem.h"

@interface NotificationHelper : NSObject

+ (void)scheduleNotificationWithItem:(NotifyItem *)item afterInterval:(int)minutesAfter;

@end
