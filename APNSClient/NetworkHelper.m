//
//  NetworkHelper.m
//  APNSClient
//
//  Created by Vs on 13/10/13.
//  Copyright (c) 2013 Keys Game Studios. All rights reserved.
//

#import "NetworkHelper.h"
#import "MagicValues.h"

@implementation NetworkHelper

+(BOOL)sendTokenToServer:(NSString*)token{
    NSURL *aUrl = [NSURL URLWithString:[[MagicValues server] stringByAppendingString:@"/apns/registertoken"]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request setHTTPMethod:@"POST"];
    NSString *postString = [NSString stringWithFormat:@"token=%@",token];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSHTTPURLResponse *urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request
                                                 returningResponse:&urlResponse
                                                             error:&error];
    
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    NSLog(@"Response: %@", result);
    
    return true;
}

@end
