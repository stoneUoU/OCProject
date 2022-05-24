//
//  YLZPaddingLabel.h
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/1/8.
//

#import <UIKit/UIKit.h>

@interface YLZPaddingLabel : UILabel

@property (nonatomic, assign) IBInspectable CGFloat leftEdge;
@property (nonatomic, assign) IBInspectable CGFloat rightEdge;
@property (nonatomic, assign) IBInspectable CGFloat topEdge;
@property (nonatomic, assign) IBInspectable CGFloat bottomEdge;
@property (nonatomic, assign) UIEdgeInsets edgeInsets;

@end
