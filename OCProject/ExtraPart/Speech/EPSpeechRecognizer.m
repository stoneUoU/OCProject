//
//  EPSpeechRecognizer.m
//  OldServe
//
//  Created by Mac on 2020/11/17.
//  Copyright © 2020 YLZ Information Technology Co., Ltd. All rights reserved.
//

#import "EPSpeechRecognizer.h"

@interface EPSpeechRecognizer () <SFSpeechRecognizerDelegate>
/// 语音引擎，负责提供语音输入
@property (nonatomic, strong) AVAudioEngine *audioEngine;
/// 语音识别器
@property (nonatomic, strong) SFSpeechRecognizer *speechRecognizer;
/// 处理语音识别请求
@property (nonatomic, strong) SFSpeechAudioBufferRecognitionRequest *recognitionRequest;
/// 输出语音识别对象的结果
@property (nonatomic, strong) SFSpeechRecognitionTask *recognitionTask;
/// 用于标识 语种
@property (nonatomic, strong) NSLocale *locale;

@end

@implementation EPSpeechRecognizer

- (instancetype)initWithLocaleIdentifier:(NSString *)localeIdentifier{
    self = [super init];
    if (self) {
        self.locale = [NSLocale localeWithLocaleIdentifier:localeIdentifier];
    }
    return self;
}

#pragma mark - public

- (void)checkSpeechAuth:(EPSpeechAuthCallback)callback{
    
    [SFSpeechRecognizer requestAuthorization:^(SFSpeechRecognizerAuthorizationStatus status) {
        BOOL isAuthorized = NO;
        switch (status) {
                // 结果未知 用户尚未进行选择
            case SFSpeechRecognizerAuthorizationStatusNotDetermined:
                isAuthorized = NO;
                break;
                // 用户拒绝授权语音识别
            case SFSpeechRecognizerAuthorizationStatusDenied:
                isAuthorized = NO;
                break;
                // 设备不支持语音识别功能
            case SFSpeechRecognizerAuthorizationStatusRestricted:
                isAuthorized = NO;
                break;
                // 用户授权语音识别
            case SFSpeechRecognizerAuthorizationStatusAuthorized:
                isAuthorized = YES;
                break;
            default:
                break;
        }
        
        if (callback) {
            callback(isAuthorized, status);
        }
    }];
}

- (void)startRecording{
    [self initSpeechRecognizer];
    [self initAudioEngine];
    [self initAudioSession];
    
    [self createRecognitionRequest];
    [self createRecognitionTask];
    
    AVAudioFormat *recordingFormat = [[self.audioEngine inputNode] outputFormatForBus:0];
    [[self.audioEngine inputNode] installTapOnBus:0 bufferSize:1024 format:recordingFormat block:^(AVAudioPCMBuffer * _Nonnull buffer, AVAudioTime * _Nonnull when) {
        // 音频流拼接
        [self.recognitionRequest appendAudioPCMBuffer:buffer];
        
    }];
    
    [self.audioEngine prepare];
    
    NSError *startError = nil;
    [self.audioEngine startAndReturnError:&startError];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(recognizeDidStart:)]) {
        [self.delegate recognizeDidStart:startError];
    }
}

- (void)stopRecording{
    [self endTask];
    if (self.delegate && [self.delegate respondsToSelector:@selector(recognizeDidStop)]) {
        [self.delegate recognizeDidStop];
    }
}

#pragma mark - private

- (void)endTask{
    [[self.audioEngine inputNode] removeTapOnBus:0];
    [self.audioEngine stop];
    [self.recognitionRequest endAudio];
    self.recognitionRequest = nil;
    self.recognitionTask = nil;
}

// 初始化语音识别引擎
- (void)initAudioEngine{
    if (self.audioEngine) return;
    
    self.audioEngine = [[AVAudioEngine alloc] init];
}

// 初始化语音识别器
- (void)initSpeechRecognizer{
    if (self.speechRecognizer) return;
    
    self.speechRecognizer = [[SFSpeechRecognizer alloc] initWithLocale:self.locale];
    self.speechRecognizer.delegate = self;
}

- (void)initAudioSession{
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryRecord mode:AVAudioSessionModeMeasurement options:AVAudioSessionCategoryOptionDuckOthers error:nil];
    [audioSession setActive:YES withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
}

// 初始化 语音识别请求
- (void)createRecognitionRequest{
    if (self.recognitionRequest) {
        [self.recognitionRequest endAudio];
        self.recognitionRequest = nil;
    }
    self.recognitionRequest = [[SFSpeechAudioBufferRecognitionRequest alloc] init];
    
    // 实时返回, 每产生一种结果就马上返回
    self.recognitionRequest.shouldReportPartialResults = YES;
}

// 创建任务
- (void)createRecognitionTask{
    self.recognitionTask = [self.speechRecognizer recognitionTaskWithRequest:self.recognitionRequest resultHandler:^(SFSpeechRecognitionResult * _Nullable result, NSError * _Nullable error) {
        BOOL isFinal = NO;
        NSString *bestResult = [[result bestTranscription] formattedString];
        isFinal = result.isFinal;
        if (error || isFinal) {
            [self endTask];
            if (self.delegate && [self.delegate respondsToSelector:@selector(recognizeFail:)]) {
                [self.delegate recognizeFail:error];
            }
        } else {
            if (self.delegate && [self.delegate respondsToSelector:@selector(recognizeSuccess:)]) {
                [self.delegate recognizeSuccess:bestResult];
//                YLZLog(@"-----%@", bestResult);
            }
        }
    }];
    
}


- (BOOL)isRunning{
    return [self.audioEngine isRunning];
}



//请求任务过程中的监听方法
#pragma mark - SFSpeechRecognitionTaskDelegate
 
//当开始检测音频源中的语音时首先调用此方法
-(void)speechRecognitionDidDetectSpeech:(SFSpeechRecognitionTask *)task{
  
}
//当识别出一条可用的信息后 会调用
/*     需要注意，apple的语音识别服务会根据提供的音频源识别出多个可能的结果 每有一条结果可用 都会调用此方法 */
-(void)speechRecognitionTask:(SFSpeechRecognitionTask *)task didHypothesizeTranscription:(SFTranscription *)transcription{
   
}
//当识别完成所有可用的结果后调用
- (void)speechRecognitionTask:(SFSpeechRecognitionTask *)task didFinishRecognition:(SFSpeechRecognitionResult *)recognitionResult{
    
}
//当不再接受音频输入时调用 即开始处理语音识别任务时调用
- (void)speechRecognitionTaskFinishedReadingAudio:(SFSpeechRecognitionTask *)task{
 
}
//当语音识别任务被取消时调用
- (void)speechRecognitionTaskWasCancelled:(SFSpeechRecognitionTask *)task{
    
}
//语音识别任务完成时被调用
- (void)speechRecognitionTask:(SFSpeechRecognitionTask *)task didFinishSuccessfully:(BOOL)successfully{

}



@end
