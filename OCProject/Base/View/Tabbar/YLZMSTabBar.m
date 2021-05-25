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

@property (nonatomic, strong) UIImageView *qrBgImageView;

@property (nonatomic, strong) UIView *leftShadowView;

@property (nonatomic, strong) UIView *rightShadowView;

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
    [self addSubview:self.leftShadowView];
    [self addSubview:self.rightShadowView];
    [self.qrCodeView addSubview:self.qrBgImageView];
    [self.qrCodeView addSubview:self.qrImageView];
    [self setMas];
}

- (void)setMas {
    [self.qrBgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.qrCodeView.mas_top).offset(20);
        make.centerX.equalTo(self.qrCodeView);
    }];
    [self.qrImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.qrCodeView).offset(-0.5);
        make.bottom.equalTo(self.qrBgImageView.mas_bottom).offset(-5);
        make.size.equalTo(@(CGSizeMake(72, 72)));
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

- (UIImageView *)qrBgImageView {
    if (!_qrBgImageView) {
        _qrBgImageView = [[UIImageView alloc] init];
        _qrBgImageView.image = [UIImage imageNamed:@"tabbar_middle_cert_shape"];
    }
    return _qrBgImageView;
}

- (UIView *)leftShadowView {
    if (!_leftShadowView) {
        _leftShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, -4, (SCREENWIDTH - middleButtonWidth)/2, 8)];
        UIImage *image = [UIImage imageNamed:@"ylz_tabbar_custom_line"];
        _leftShadowView.layer.contents = (__bridge id)image.CGImage;
    }
    return _leftShadowView;
}

- (UIView *)rightShadowView {
    if (!_rightShadowView) {
        _rightShadowView = [[UIView alloc] initWithFrame:CGRectMake((SCREENWIDTH - middleButtonWidth)/2+middleButtonWidth, -4, (SCREENWIDTH - middleButtonWidth)/2, 8)];
        UIImage *image = [UIImage imageNamed:@"ylz_tabbar_custom_line"];
        _rightShadowView.layer.contents = (__bridge id)image.CGImage;
    }
    return _rightShadowView;
}

@end

