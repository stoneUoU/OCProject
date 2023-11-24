//
//  EPSAppHelper.m
//  Gdrs
//
//  Created by stone on 2023/5/23.
//  Copyright © 2023 ylzinfo. All rights reserved.
//

#import "EPSAppHelper.h"
#import <Speech/Speech.h>

@implementation EPSAppHelper

+ (BOOL)speechRecognizerAuth{
    
    SFSpeechRecognizerAuthorizationStatus status = [SFSpeechRecognizer authorizationStatus];
    
    if(status == AVAuthorizationStatusRestricted ||
       status == AVAuthorizationStatusDenied){
        return NO;
    }
    return YES;
}

+(BOOL)micorPhoneAuth{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    
    if(status == AVAuthorizationStatusRestricted ||
       status == AVAuthorizationStatusDenied){
        
        return NO;
    }
    return YES;
}

// 直接打开系统的APP权限设置界面
+(void)openSystemAuthSettings{
    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if([[UIApplication sharedApplication] canOpenURL:url]) {
       [[UIApplication sharedApplication] openURL:url];
    }
}


@end
