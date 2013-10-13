//
//  NetworkHelper.h
//  APNSClient
//
//  Created by Vs on 13/10/13.
//  Copyright (c) 2013 Keys Game Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkHelper : NSObject

+(BOOL)sendTokenToServer:(NSString*)token;

@end
