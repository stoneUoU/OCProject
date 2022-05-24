//
//  YLZPaddingLabel.h
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/1/8.
//

#import "YLZPaddingLabel.h"

@implementation YLZPaddingLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.edgeInsets = UIEdgeInsetsMake(self.topEdge, self.leftEdge, self.bottomEdge, self.rightEdge);
    }
    return self;
}

// 文字区域
- (void)drawTextInRect:(CGRect)rect {
    self.edgeInsets = UIEdgeInsetsMake(self.topEdge, self.leftEdge, self.bottomEdge, self.rightEdge);
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

// UILabel的内容区域
- (CGSize)intrinsicContentSize {
    self.edgeInsets = UIEdgeInsetsMake(self.topEdge, self.leftEdge, self.bottomEdge, self.rightEdge);
    CGSize size = [super intrinsicContentSize];
    size.width  += self.edgeInsets.left + self.edgeInsets.right;
    size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return size;
}

@end
