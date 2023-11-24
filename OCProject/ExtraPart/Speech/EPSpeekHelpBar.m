//
//  EPSpeekHelpBar.m
//  OldServe
//
//  Created by Mac on 2021/1/28.
//  Copyright © 2021 YLZ Information Technology Co., Ltd. All rights reserved.
//

#import "EPSpeekHelpBar.h"
//#import "EPSAudioWaveView.h"
#import "EPSAudioRecorderUtil.h"
#import "UIView+Extension.h"
#import "EPSAppHelper.h"

@interface EPSpeekHelpBar() <EPSpeechRecognizerDelegate>
/// 语音动画view
@property (nonatomic, strong) EPSAudioRecorderUtil *waveUtil;

@property (nonatomic, strong) NSString *result;

@property (nonatomic, strong) UIViewController *vc;


@end

@implementation EPSpeekHelpBar{
    UILabel *_tipLb;
    BOOL _finished;  // 已完成
    BOOL _isWaiting;  // 正在等待说话 
}

-(instancetype)initWithVC:(UIViewController *)vc {
    if (self = [super init]) {
        self.vc = vc;
//        self.backgroundColor = [UIColor redColor];
        self.waveUtil = [[EPSAudioRecorderUtil alloc] init];
        self.waveUtil.voiceWave.x = ([UIScreen mainScreen].bounds.size.width-280) / 2;
        self.waveUtil.voiceWave.y = -24;
        self.waveUtil.voiceWave.hidden = 1;
        [self addSubview:self.waveUtil.voiceWave];
        
        UIImageView *voiceBtn = [[UIImageView alloc] init];
        voiceBtn.image = [UIImage imageNamed:@"hec_voice"];
        voiceBtn.userInteractionEnabled = YES;
        UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(clickVoice:)];
        [voiceBtn addGestureRecognizer:press];
         
        [self addSubview:voiceBtn];
        
        [voiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.bottom.equalTo(self);
            make.size.equalTo(@(CGSizeMake(62, 62)));
        }];
        
        UILabel *tipLb = [[UILabel alloc] init];
        tipLb.text = @"长按说话";
        tipLb.font = [UIFont systemFontOfSize:16];
        tipLb.textColor = [UIColor grayColor];
        [self addSubview:tipLb];
        [tipLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.mas_bottom).offset(6);
        }];
        _tipLb = tipLb;
    }
    return self;
}

-(void)clickVoice:(UILongPressGestureRecognizer *)recognizer{
    NSLog(@"clickVoice_clickVoice");
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            if (![self checkAuth]) {
                return;
            }
            
            [self showAnimation];
            [self startRecordVoice];
            
            break;
        case UIGestureRecognizerStateEnded:{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self hideAnimation];
                [self finishRecord];
            });
            break;
        }
        default:
            break;
    }
}

-(BOOL)checkAuth{
    if (![EPSAppHelper micorPhoneAuth] ) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"未获取到麦克风权限" message:@"请在系统设置中打开后重试" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [EPSAppHelper openSystemAuthSettings];
        }];
        [alertController addAction:action];
        [self.vc presentViewController:alertController animated:YES completion:nil];
        return NO;
    }
    if (![EPSAppHelper speechRecognizerAuth]) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"未获取到语音识别权限" message:@"请在系统设置中打开后重试" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [EPSAppHelper openSystemAuthSettings];
        }];
        [alertController addAction:action];
        [self.vc presentViewController:alertController animated:YES completion:nil];
        return NO;
    }
    return YES;
}

#pragma mark - delegate

- (void)recognizeSuccess:(NSString *)result{
    
    if ([result containsString:@"。"]) {
        result = [result stringByReplacingOccurrencesOfString:@"。" withString:@""];
    }
    if ([result containsString:@"，"]) {
        result = [result stringByReplacingOccurrencesOfString:@"，" withString:@""];
    }
    self.result = result;
    
}

#pragma mark - aciton

// 开始听音
-(void)startRecordVoice{
    if ([EPSAppHelper speechRecognizerAuth]) {
        [self.speech startRecording];
        return;
    }
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"未获取到语音识别权限" message:@"请在系统设置中打开后重试" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [EPSAppHelper openSystemAuthSettings];
    }];
    [alertController addAction:action];
    [self.vc presentViewController:alertController animated:YES completion:nil];
}


// 停止录制
-(void)finishRecord{
    _finished = YES;
 
    if ([self.speech isRunning]) {
        [self.speech stopRecording];
    }
    
    if ([self hsa_isNull:self.result]) {
        return ;
    }
    if (self.successBlock){
        self.successBlock(_result);        
    }
}


- (BOOL)hsa_isNull:(NSString *)str {
    if (str == nil || str == NULL || [str isKindOfClass:[NSNull class]] || [str length] == 0 || [str isEqualToString: @"(null)"] || [str isEqualToString: @"null"]) {
        return YES;
    }
    return NO;
}

// 开始动画
-(void)showAnimation{
    _tipLb.hidden = 1;
    [self.waveUtil startA];
}

// 结束动画
-(void)hideAnimation{
    _tipLb.hidden = 0;
    [self.waveUtil stopA];

}
  

-(EPSpeechRecognizer *)speech{
    if (!_speech) {
        _speech = [[EPSpeechRecognizer alloc] initWithLocaleIdentifier:@"zh_CN"];
        _speech.delegate = self;
    }
    return _speech;
}
  

@end
