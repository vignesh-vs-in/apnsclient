//
//  AppDelegate.m
//  APNSClient
//

#import "AppDelegate.h"
#import "NotificationHelper.h"
#import "NetworkHelper.h"

@implementation AppDelegate

@synthesize registered = _registered;

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    //Local Notification
    
//    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:~ NSTimeZoneCalendarUnit fromDate:[NSDate date]];
//    NotifyItem *item1 = [[NotifyItem alloc] initWithDateComponents:dateComponents andName:@"Testing1"];
//    NotifyItem *item2 = [[NotifyItem alloc] initWithDateComponents:dateComponents andName:@"Testing2"];
//    
//    [NotificationHelper scheduleNotificationWithItem:item1 afterInterval:1];
//    [NotificationHelper scheduleNotificationWithItem:item2 afterInterval:2];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)applicationDidFinishLaunching:(UIApplication *)app {
    
    // other setup tasks here....
    
}

// Delegation methods

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
    const unsigned *devTokenBytes = [devToken bytes];
    
    self.registered = YES;
    
    [self sendProviderDeviceToken:devTokenBytes]; // custom method
    
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    
    NSLog(@"Error in registration. Error: %@", err);
    
}

- (BOOL)application:(UIApplication *)app didFinishLaunchingWithOptions:(NSDictionary *)opts {
    
    // check launchOptions for notification payload and custom data, set UI context
    if (opts) {
        [self startDownloadingDataFromProvider];  // custom method
    }
    else{
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    }
    
    app.applicationIconBadgeNumber = 0;
    
    return YES;
}

-(void)sendProviderDeviceToken:(const unsigned *)tokenBytes{
    NSString *strToken = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
                                                ntohl(tokenBytes[0]), ntohl(tokenBytes[1]), ntohl(tokenBytes[2]),
                                                ntohl(tokenBytes[3]), ntohl(tokenBytes[4]), ntohl(tokenBytes[5]),
                                                ntohl(tokenBytes[6]), ntohl(tokenBytes[7])];
    NSLog(@"Token %@",strToken);
    
    NSString* lastToken = [[NSUserDefaults standardUserDefaults] stringForKey:@"token"];
    
    if (![strToken isEqualToString:lastToken]) {
        //Only send device token if it is changed
        if ([NetworkHelper sendTokenToServer:strToken]) {
            [[NSUserDefaults standardUserDefaults] setObject:strToken forKey:@"token"];
        }
    }
}

-(void)startDownloadingDataFromProvider{
    
}

@end
