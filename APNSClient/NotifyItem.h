//
//  NotifyItem.h
//  APNSClient
//

#import <Foundation/Foundation.h>

@interface NotifyItem : NSObject

@property(nonatomic)int day;
@property(nonatomic)int month;
@property(nonatomic)int year;

@property(nonatomic)int hour;
@property(nonatomic)int minute;
@property(nonatomic)int second;

@property(nonatomic,strong) NSString* eventName;

-(NotifyItem*)initWithDateComponents:(NSDateComponents*)dateComponents andName:(NSString*)name;

@end
