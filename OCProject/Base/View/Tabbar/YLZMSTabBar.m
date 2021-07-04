//
//  YLZMSTabBar.m
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import "YLZMSTabBar.h"
#import "UIImage+YLZGif.h"

#import <YYKit/YYKit.h>

#define middleButtonWidth 77

@interface YLZMSTabBar()

@property (nonatomic, assign) NSInteger tabbarBtnNum;

@property (nonatomic, strong) UIView *qrCodeView;

@end

@implementation YLZMSTabBar

- (instancetype)initWithTabbarBtnNum:(NSInteger)tabbarBtnNum {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _tabbarBtnNum = tabbarBtnNum;
        CGRect rect = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        if (@available(iOS 13.0, *)) {
            UITabBarAppearance *tabBarAppearance = [self.standardAppearance copy];
            [tabBarAppearance setShadowImage:img];
            [tabBarAppearance setBackgroundColor:[UIColor whiteColor]];
            
            //修改选中的字体颜色:
            NSMutableDictionary *normalAttr=[NSMutableDictionary dictionary];
            normalAttr[NSForegroundColorAttributeName] = YLZColorTitleTwo;
            normalAttr[NSFontAttributeName] = [YLZFont regular:10.32];
            tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttr;

            NSMutableDictionary *selectAttr=[NSMutableDictionary dictionary];
            selectAttr[NSForegroundColorAttributeName] = YLZColorBlueView;
            selectAttr[NSFontAttributeName] = [YLZFont regular:10.32];
            tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = selectAttr;
            [self setStandardAppearance:tabBarAppearance];
        } else {
            [self setBackgroundImage:img];
            [self setShadowImage:img];
        }
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    [self addSubview:self.qrCodeView];
    [self.qrCodeView addSubview:self.qrImageView];
    [self setMas];
}

- (void)setMas {
    [self.qrImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.qrCodeView);
        make.size.equalTo(@(CGSizeMake(45, 45)));
    }];
}

#pragma mark - layoutSubviews
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.frame.size.width/self.tabbarBtnNum;
    Class class = NSClassFromString(@"UITabBarButton");
    for (UIView *view in self.subviews) {
        if ([view isEqual:self.qrCodeView]) {
            view.size = CGSizeMake(middleButtonWidth,TabBarHeight+24);
            view.top = -24;
            view.centerX = self.frame.size.width/2;
        } else if ([view isKindOfClass:class]) {
            CGRect frame = view.frame;
            int indexFromOrign = view.frame.origin.x/width;
            if (indexFromOrign >= (self.tabbarBtnNum - 1) / 2) {
                indexFromOrign++;
            }
            CGFloat x = indexFromOrign * width;
            view.frame = CGRectMake(x, view.frame.origin.y, width, frame.size.height);
        }
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (!self.isHidden) {
        CGPoint newP = [self convertPoint:point toView:self.qrCodeView];
        if ([self.qrCodeView pointInside:newP withEvent:event]) {
            return self.qrCodeView;
        }else{
            return [super hitTest:point withEvent:event];
        }
    } else {
        return [super hitTest:point withEvent:event];
    }
}

#pragma mark - Button 操作
- (void)didMiddleBtn:(UITapGestureRecognizer *)recognizer {
    if (self.didTabBarMiddleBtn) {
        self.didTabBarMiddleBtn();
    }
}

- (UIView *)qrCodeView {
    if (!_qrCodeView) {
        _qrCodeView = [[UIView alloc] init];
        _qrCodeView.userInteractionEnabled = YES;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didMiddleBtn:)];
        [_qrCodeView addGestureRecognizer:recognizer];
    }
    return _qrCodeView;
}

- (UIImageView *)qrImageView {
    if (!_qrImageView) {
        _qrImageView = [[UIImageView alloc] init];
    }
    return _qrImageView;
}

@end

