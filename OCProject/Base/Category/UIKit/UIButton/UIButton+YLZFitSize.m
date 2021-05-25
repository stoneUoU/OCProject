//
//  UIButton+YLZFitSize.m
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/4/3.
//

#import "UIButton+YLZFitSize.h"

@implementation UIButton (YLZFitSize)

- (void)ylz_fitSizeToButton:(CGSize)size
{
    CGRect previousFrame = self.frame;
    CGRect newFrame = self.frame;
    newFrame.size = size;
    CGFloat adjustX = (size.width - previousFrame.size.width)/2;
    CGFloat adjustY = (size.height - previousFrame.size.height)/2;
    newFrame.origin.x = previousFrame.origin.x - adjustX;
    newFrame.origin.y = previousFrame.origin.y - adjustY;
    self.frame = newFrame;
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(adjustY, adjustX, adjustY, adjustX);
    self.contentEdgeInsets = edgeInsets;
}
@end

