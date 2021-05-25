//
//  UITextField+YLZExtension.m
//  YLZ-NetEncryption-iOS
//
//  Created by yuan on 2019/10/7.
//

#import "UITextField+YLZExtension.h"
#import <objc/runtime.h>

@interface UITextField ()

@property (nonatomic, assign) BOOL obsever;

@end

@implementation UITextField (YLZExtension)

- (BOOL)obsever {
    return [objc_getAssociatedObject(self, @selector(obsever)) boolValue];
}

- (void)setObsever:(BOOL)obsever {
    objc_setAssociatedObject(self, @selector(obsever), [NSNumber numberWithBool:obsever], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSUInteger)maxLength {
    return [objc_getAssociatedObject(self, @selector(maxLength)) integerValue];
}

- (void)setMaxLength:(NSUInteger)maxLength {
    objc_setAssociatedObject(self, @selector(maxLength), @(maxLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (!self.obsever) {
        [self addTarget:self action:@selector(ylz_textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        self.obsever = YES;
    }
}

- (void)setValueChangedBlock:(void (^)(NSString *, NSInteger))valueChangedBlock {
    objc_setAssociatedObject(self, @selector(valueChangedBlock), valueChangedBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (!self.obsever) {
        [self addTarget:self action:@selector(ylz_textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        self.obsever = YES;
    }
}

- (void (^)(NSString * _Nonnull, NSInteger))valueChangedBlock {
    return objc_getAssociatedObject(self, @selector(valueChangedBlock));
}

- (void)ylz_textFieldDidChange:(UITextField *)textField {
    NSUInteger kMaxLength = [objc_getAssociatedObject(self, @selector(maxLength)) integerValue];
    if (kMaxLength == 0) {
        kMaxLength = NSIntegerMax;
    }
    
    NSString *toBeString = textField.text;
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position) {
        if (toBeString.length > kMaxLength) {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:kMaxLength];
            if (rangeIndex.length == 1) {
                textField.text = [toBeString substringToIndex:kMaxLength];
            } else {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, kMaxLength)];
                
                NSInteger tmpLength;
                if (rangeRange.length > kMaxLength) {
                    tmpLength = rangeRange.length - rangeIndex.length;
                } else {
                    tmpLength = rangeRange.length;
                }
                textField.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
            }
        }
    }
    if (self.valueChangedBlock) {
        self.valueChangedBlock(self.text, self.text.length);
    }
}

@end
