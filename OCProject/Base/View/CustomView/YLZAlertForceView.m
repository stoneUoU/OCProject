//
//  YLZAlertForceView.m
//  OCProject
//
//  Created by stone on 2021/7/4.
//

#import "YLZAlertForceView.h"

//
//  HECPrivilegeNoticeView.m
//  HSA-ElectronicCertificateModule-iOS
//
//  Created by stone on 2021/3/11.
//  使用：
//  HECPrivilegeNoticeView *enLargeView = [[HECPrivilegeNoticeView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
//  [enLargeView showPrivilege];

#import "YLZAlertForceView.h"
#import <YYKit/YYKit.h>

@implementation YLZAlertForceModel

@end

@interface YLZAlertForceView ()

@property (strong, nonatomic) UIView *bgView;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) UIButton *okButton;

@end

@implementation YLZAlertForceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setModel:(YLZAlertForceModel *)model {
    _model = model;
    self.titleLabel.text = model.titleString;
    [self.cancelButton setTitle:model.cancelString forState:UIControlStateNormal];
    [self.okButton setTitle:model.okString forState:UIControlStateNormal];
}

- (void)showAlert {
    UIView *superView = [UIApplication sharedApplication].delegate.window;
    [superView addSubview:self];
    [self startAnimationWithView];
}

- (void)setUI {
    self.alpha = 0;
    [self addSubview:self.bgView];
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.cancelButton];
    [self.contentView addSubview:self.okButton];
    
    [self setMas];
}

- (void)setMas {
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.equalTo(@(CGSizeMake(252, 136)));
    }];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.equalTo(self.contentView);
        make.size.equalTo(@(CGSizeMake(126, 44)));
    }];
    [self.okButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.right.equalTo(self.contentView);
        make.size.equalTo(@(CGSizeMake(126, 44)));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.equalTo(@(82));
    }];
}

- (void)startAnimationWithView {
    [self showScaleView:self.contentView withAlphaView:self withDuration:0.3 withFinishBlock:^{
    }];
}

//放大
- (void)showScaleView:(UIView *)scaleView withAlphaView:(UIView *)alphaView withDuration:(NSTimeInterval)duration withFinishBlock:(void(^)(void))finishBlock {
    
    //缩小创建好的视图
    CGAffineTransform newTransform = CGAffineTransformScale(scaleView.transform, 0.1, 0.1);
    [scaleView setTransform:newTransform];
    alphaView.alpha = 0;
    //第一次显示的时候放大它
    [UIView animateWithDuration:duration animations:^{
        CGAffineTransform newTransform = CGAffineTransformConcat(scaleView.transform,  CGAffineTransformInvert(scaleView.transform));
        [scaleView setTransform:newTransform];
        alphaView.alpha = 1.0;
    } completion:^(BOOL finished) {
        if(finishBlock != nil){
            finishBlock();
        }
    }];
};

//缩小
- (void)hiddenScaleView:(UIView *)scaleView withAlphaView:(UIView *)alphaView withDuration:(NSTimeInterval)duration withFinishBlock:(void(^)(void))finishBlock {
    CGAffineTransform newTransform =  CGAffineTransformScale(scaleView.transform, 1.0, 1.0);
    [scaleView setTransform:newTransform];
    alphaView.alpha = 1;
    [UIView animateWithDuration:duration animations:^{
        CGAffineTransform newTransform =  CGAffineTransformScale(scaleView.transform, 0.1, 0.1);
        [scaleView setTransform:newTransform];
        alphaView.alpha = 0;
    } completion:^(BOOL finished) {
        if(finishBlock != nil){
            finishBlock();
        }
    }];
};

#pragma mark - IB-Action
#pragma mark -

- (void)toDone:(UIButton *)sender {
    @weakify(self);
    [self hiddenScaleView:self.contentView withAlphaView:self withDuration:0.3 withFinishBlock:^{
        @strongify(self);
        [self removeFromSuperview];
        !self.handle ?: self.handle(sender.tag);
    }];
}

#pragma mark - lazy load
#pragma mark -


- (UIView *)bgView {
    if(_bgView == nil) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
        _bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    }
    return _bgView;
}

- (UIView *)contentView {
    if(_contentView == nil) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = YLZColorWhite;
        _contentView.layer.cornerRadius = 34.0;
        _contentView.layer.masksToBounds = YES;
    }
    return _contentView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [YLZFont regular:16];
        _titleLabel.textColor = YLZColorTitleOne;
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.backgroundColor = YLZColorTitleThree;
        [_cancelButton setTitleColor:YLZColorTitleTwo forState:UIControlStateNormal];
        [_cancelButton.titleLabel setFont:[YLZFont regular:16]];
        _cancelButton.tag = 0;
        [_cancelButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

- (UIButton *)okButton {
    if (!_okButton) {
        _okButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _okButton.backgroundColor = YLZColorOrangeView;
        [_okButton setTitleColor:YLZColorWhite forState:UIControlStateNormal];
        [_okButton.titleLabel setFont:[YLZFont regular:16]];
        _okButton.tag = 1;
        [_okButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _okButton;
}
@end


