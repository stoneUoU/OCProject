//
//  YLZEnlargeButton.m
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/5/13.
//

#import "YLZEnlargeButton.h"

@implementation YLZEnlargeButton

- (CGRect)ylz_enlargeEdge
{
    return CGRectMake(self.bounds.origin.x - self.enlargeEdge_ylz.left,
                      self.bounds.origin.y - self.enlargeEdge_ylz.top,
                      self.bounds.size.width + self.enlargeEdge_ylz.left + self.enlargeEdge_ylz.right,
                      self.bounds.size.height + self.enlargeEdge_ylz.top + self.enlargeEdge_ylz.bottom);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    [super pointInside:point withEvent:event];
    return CGRectContainsPoint([self ylz_enlargeEdge], point);
}

@end
