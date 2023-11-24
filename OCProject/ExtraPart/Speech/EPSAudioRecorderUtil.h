//
//  EPSAudioRecorderUtil.h
//  OldServe
//
//  Created by Mac on 2021/11/16.
//  Copyright © 2021 YLZ Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EPSpectrumView.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>



NS_ASSUME_NONNULL_BEGIN

@interface EPSAudioRecorderUtil : UIView

@property (nonatomic, strong) EPSpectrumView *voiceWave;
@property (nonatomic, strong) AVAudioRecorder *audioRecorder;//音频录音机

-(void)stopA;

-(void)startA;

@end

NS_ASSUME_NONNULL_END
