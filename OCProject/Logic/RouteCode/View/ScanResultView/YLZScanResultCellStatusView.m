//
//  YLZScanResultCellStatusView.m
//  OCProject
//
//  Created by stone on 2022/9/2.
//

#import "YLZScanResultCellStatusView.h"

@interface YLZScanResultCellStatusView()

@property (nonatomic, strong) UIImageView *logoImageView;

@property (nonatomic, strong) UILabel *statusLabel;

@end

@implementation YLZScanResultCellStatusView

#pragma mark - LifeCycle
#pragma mark -
    
- (id)init {
    self = [super init];//当前对象self
    if (self !=nil) {
        [self setUI];
    }
    return self;//返回一个已经初始化完毕的对象；
}
    
- (void)drawRect:(CGRect)rect {
}
    
#pragma mark - Public Method
#pragma mark -
    
#pragma mark - Private Method
#pragma mark -
    
- (void)setUI {
    [self addSubview:self.logoImageView];
    [self addSubview:self.statusLabel];
    [self setMas];
}
    
 - (void)setMas {
     [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mas_top).offset(32);
         make.centerX.equalTo(self);
     }];
     [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.logoImageView.mas_bottom).offset(16);
         make.left.equalTo(self.mas_left).offset(16);
     }];
}
    
#pragma mark - IB-Action
#pragma mark -
    
#pragma mark - Notice
#pragma mark -
    
#pragma mark - Delegate
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [UIImageView new];
        _logoImageView.image = [UIImage imageNamed:@"ylz_process_succ_big"];
    }
    return _logoImageView;
}

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = [UILabel new];
        _statusLabel.font = [YLZFont medium:18];
        _statusLabel.textColor = [UIColor colorWithHexString:@"#63a379"];
        _statusLabel.text = @"绿码：健康状态为低风险";
    }
    return _statusLabel;
}

@end

