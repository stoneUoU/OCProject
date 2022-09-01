//
//  HSAQRCodeObtainConfigure.m
//  HSA-AppBaseBusinessModule-iOS
//
//  Created by kingsic on 2018/7/29.
//  Copyright © 2018年 kingsic. All rights reserved.
//

#import "HSAQRCodeObtainConfigure.h"

@implementation HSAQRCodeObtainConfigure

+ (instancetype)QRCodeObtainConfigure {
    return [[self alloc] init];
}

- (NSString *)sessionPreset {
    if (!_sessionPreset) {
        _sessionPreset = AVCaptureSessionPreset1920x1080;
    }
    return _sessionPreset;
}

- (NSMutableArray *)metadataObjectTypes {
    if (!_metadataObjectTypes) {
        _metadataObjectTypes = [NSMutableArray arrayWithObjects:AVMetadataObjectTypeAztecCode, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeUPCECode, nil];
      // >= iOS 8
      if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1) {
          [_metadataObjectTypes addObjectsFromArray:@[AVMetadataObjectTypeInterleaved2of5Code, AVMetadataObjectTypeITF14Code, AVMetadataObjectTypeDataMatrixCode]];
      }
    }
    return _metadataObjectTypes;
}
@end
