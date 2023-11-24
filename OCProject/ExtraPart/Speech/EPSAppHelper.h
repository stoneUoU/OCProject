//
//  EPSAppHelper.h
//  Gdrs
//
//  Created by stone on 2023/5/23.
//  Copyright © 2023 ylzinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EPSAppHelper : NSObject

+(BOOL)speechRecognizerAuth;

+(BOOL)micorPhoneAuth;

+(void)openSystemAuthSettings;

@end

NS_ASSUME_NONNULL_END
