//
//  EPSAudioRecorderUtil.m
//  OldServe
//
//  Created by Mac on 2021/11/16.
//  Copyright © 2021 YLZ Information Technology Co., Ltd. All rights reserved.
//

#import "EPSAudioRecorderUtil.h"

@interface EPSAudioRecorderUtil () <AVAudioRecorderDelegate>

@end

@implementation EPSAudioRecorderUtil

-(instancetype)init{
    if (self = [super init]) {
        
        __weak typeof(self) weakself = self;
        self.voiceWave = [[EPSpectrumView alloc] initWithFrame:CGRectMake(20, 14,280, 50)];
        self.voiceWave.text = @"";
        self.voiceWave.middleInterval = 0;

        __weak EPSpectrumView * weakSpectrum1 = self.voiceWave;
        self.voiceWave.itemLevelCallback = ^() {
            
            [weakself.audioRecorder updateMeters];
            //取得第一个通道的音频，音频强度范围是-160到0
            float power = [weakself.audioRecorder averagePowerForChannel:0];
            weakSpectrum1.level = power;
        };
         
        
    }
    return self;
}

-(void)stopA{
    [self.audioRecorder stop];

    [self.voiceWave stop];
    self.voiceWave.hidden = YES;
}

-(void)startA{
    
    [self.audioRecorder record];
    
    [self.voiceWave start];
    self.voiceWave.hidden = NO;
}


#pragma mark - AVAudioRecorder

- (AVAudioRecorder *)audioRecorder {
   if (!_audioRecorder) {
       [self setAudioSession];
       //创建录音文件保存路径
       NSURL *url = [self getSavePath];
       //创建录音格式设置
       NSDictionary *setting = [self getAudioSetting];
       //创建录音机
       NSError *error = nil;
       _audioRecorder = [[AVAudioRecorder alloc] initWithURL:url settings:setting error:&error];
       _audioRecorder.delegate = self;
       _audioRecorder.meteringEnabled=YES;//如果要监控声波则必须设置为YES
       if (error) {
           NSLog(@"创建录音机对象时发生错误，错误信息：%@",error.localizedDescription);
           return nil;
       }
   }
   return _audioRecorder;
}

- (void)setAudioSession {
    AVAudioSession *session = [AVAudioSession sharedInstance];
    NSError *sessionError;
    //AVAudioSessionCategoryPlayAndRecord用于录音和播放
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
    if(session == nil)
        NSLog(@"Error creating session: %@", [sessionError description]);
    else
        [session setActive:YES error:nil];
}


/**
 *  取得录音文件设置
 *
 *  @return 录音设置
 */
- (NSDictionary *)getAudioSetting {
    NSMutableDictionary *dicM=[NSMutableDictionary dictionary];
    //设置录音格式
    [dicM setObject:@(kAudioFormatMPEG4AAC) forKey:AVFormatIDKey];
    //设置录音采样率，8000是电话采样率，对于一般录音已经够了
    [dicM setObject:@(8000) forKey:AVSampleRateKey];
    //设置通道,这里采用单声道
    [dicM setObject:@(1) forKey:AVNumberOfChannelsKey];
    //每个采样点位数,分为8、16、24、32
    [dicM setObject:@(8) forKey:AVLinearPCMBitDepthKey];
    //是否使用浮点数采样
    [dicM setObject:@(YES) forKey:AVLinearPCMIsFloatKey];
    //....其他设置等
    return dicM;
}


/**
 *  取得录音文件保存路径
 *
 *  @return 录音文件路径
 */
- (NSURL *)getSavePath {
    
    //  在Documents目录下创建一个名为FileData的文件夹
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"AudioData"];
    NSLog(@"%@",path);
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = FALSE;
    BOOL isDirExist = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    if(!(isDirExist && isDir)) {
        BOOL bCreateDir = [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        if(!bCreateDir){
            NSLog(@"创建文件夹失败！");
        }
        NSLog(@"创建文件夹成功，文件路径%@",path);
    }
    
    path = [path stringByAppendingPathComponent:@"myRecord.aac"];
    NSLog(@"file path:%@",path);
    NSURL *url=[NSURL fileURLWithPath:path];
    return url;
}


@end
