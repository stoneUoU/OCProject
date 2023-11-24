//
//  EPSpeechRecognizer.h
//  OldServe
//
//  Created by Mac on 2020/11/17.
//  Copyright © 2020 YLZ Information Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Speech/Speech.h>

typedef void(^EPSpeechAuthCallback)(BOOL authorized, SFSpeechRecognizerAuthorizationStatus status);

@protocol EPSpeechRecognizerDelegate <NSObject>

- (void)recognizeDidStart:(NSError *)error;
- (void)recognizeDidStop;
- (void)recognizeFail:(NSError *)error;
- (void)recognizeSuccess:(NSString *)result;
- (void)recognizeFinish;

@end

@interface EPSpeechRecognizer : NSObject

@property (nonatomic, assign) id <EPSpeechRecognizerDelegate> delegate;
@property (nonatomic, readonly, assign) BOOL isRunning;


/// 创建 方法
/// @param localeIdentifier 语言标志: 中文 zh_CN  ,  英文 en_US
- (instancetype)initWithLocaleIdentifier:(NSString *)localeIdentifier;

/// 检测权限
/// @param callback 回调处理
- (void)checkSpeechAuth:(EPSpeechAuthCallback)callback;

/// 开始录音
- (void)startRecording;

 /// 结束录音
- (void)stopRecording;

@end
