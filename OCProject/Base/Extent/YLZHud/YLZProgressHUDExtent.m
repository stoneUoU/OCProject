//
//  YLZProgressHUDExtent.m
//  YLZ-Category-iOS
//
//  Created by stone on 2021/5/24.
//

#import "YLZProgressHUDExtent.h"
#import <SVProgressHUD/SVProgressHUD.h>

@implementation YLZProgressHUDExtent

+ (void)showErrorSvg:(NSString *)errorMsg
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.5];
    [SVProgressHUD setMaximumDismissTimeInterval:3.5];
    [SVProgressHUD showErrorWithStatus:errorMsg];
    
}

+ (void)showInfoSvg:(NSString *)msg
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.5];
    [SVProgressHUD setMaximumDismissTimeInterval:3.5];
    [SVProgressHUD showInfoWithStatus:msg];
}

+ (void)showSuccessSvg:(NSString *)msg
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.5];
    [SVProgressHUD setMaximumDismissTimeInterval:3.5];
    [SVProgressHUD showSuccessWithStatus:msg];
}


@end

