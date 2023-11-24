//
//  EPSpeekHelpBar.h
//  OldServe
//
//  Created by Mac on 2021/1/28.
//  Copyright © 2021 YLZ Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPSpeechRecognizer.h"

NS_ASSUME_NONNULL_BEGIN

@interface EPSpeekHelpBar : UIView

@property (nonatomic, strong) EPSpeechRecognizer *speech;

@property (nonatomic, strong) UIButton *mBtn;

@property (nonatomic, strong) UIButton *hBtn;

@property (nonatomic, strong) void (^successBlock)(NSString *result); 

-(instancetype)initWithVC:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END

 
