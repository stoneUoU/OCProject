//
//  YLZScanResultCellInfoView.m
//  OCProject
//
//  Created by stone on 2022/9/2.
//

#import "YLZScanResultCellInfoView.h"

@interface YLZScanResultCellInfoView()

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *certLabel;

@end

@implementation YLZScanResultCellInfoView

#pragma mark - LifeCycle
#pragma mark -
    
- (id)init {
    self = [super init];//当前对象self
    if (self !=nil) {
//        self.backgroundColor = [UIColor redColor];
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
    [self addSubview:self.nameLabel];
    [self addSubview:self.certLabel];
    [self setMas];
}
    
 - (void)setMas {
     [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mas_top).offset(16);
         make.left.equalTo(self.mas_left).offset(16);
     }];
     [self.certLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.nameLabel.mas_bottom).offset(6);
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

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [YLZFont medium:20];
        _nameLabel.textColor = YLZColorTitleOne;
        _nameLabel.text = @"*磊";
    }
    return _nameLabel;
}

- (UILabel *)certLabel {
    if (!_certLabel) {
        _certLabel = [UILabel new];
        _certLabel.font = [YLZFont medium:18];
        _certLabel.textColor = YLZColorTitleTwo;
        _certLabel.text = @"36**************10";
    }
    return _certLabel;
}

@end


