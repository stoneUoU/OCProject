//
//  YLZScanResultCellRecordView.m
//  OCProject
//
//  Created by stone on 2022/9/2.
//

#import "YLZScanResultCellRecordView.h"
#import "YLZKitCategory.h"

@interface YLZScanResultCellRecordView()

@property (nonatomic, strong) UIImageView *dashImageView;

@property (nonatomic, strong) UILabel *searchLabel;

@property (nonatomic, strong) UIImageView *arrowIconImageView;

@property (nonatomic, strong) UILabel *infoLabel;

@property (nonatomic, strong) UIImageView *processImageView;

@end

@implementation YLZScanResultCellRecordView

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
    [self addSubview:self.dashImageView];
    [self addSubview:self.searchLabel];
    [self addSubview:self.arrowIconImageView];
    [self addSubview:self.processImageView];
    [self addSubview:self.infoLabel];
    [self setMas];
}
    
 - (void)setMas {
     [self.dashImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mas_top).offset(12);
         make.left.equalTo(self.mas_left).offset(16);
         make.size.equalTo(@(CGSizeMake(SCREENWIDTH - (48+32), 0.5)));
     }];
     [self.searchLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.dashImageView.mas_bottom).offset(12);
         make.left.equalTo(self.mas_left).offset(16);
     }];
     [self.arrowIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(self.searchLabel);
         make.left.equalTo(self.searchLabel.mas_right).offset(6);
     }];
     [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.searchLabel.mas_bottom).offset(6);
         make.left.equalTo(self.mas_left).offset(16);
     }];
     [self.processImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.right.equalTo(self);
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

- (UILabel *)searchLabel {
    if (!_searchLabel) {
        _searchLabel = [UILabel new];
        _searchLabel.font = [YLZFont bold:18];
        _searchLabel.textColor = YLZColorTitleOne;
        _searchLabel.text = @"点击查询行程卡";
    }
    return _searchLabel;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [UILabel new];
        _infoLabel.font = [YLZFont regular:14];
        _infoLabel.textColor = YLZColorTitleThree;
        _infoLabel.text = @"查询本人在疫情期间7天内到访地信息";
    }
    return _infoLabel;
}
- (UIImageView *)arrowIconImageView {
    if(_arrowIconImageView == nil) {
        _arrowIconImageView = [[UIImageView alloc] init];
        _arrowIconImageView.image = [UIImage imageNamed:@"ylz_route_to_search"];
    }
    return _arrowIconImageView;
}

- (UIImageView *)processImageView {
    if(_processImageView == nil) {
        _processImageView = [[UIImageView alloc] init];
        _processImageView.image = [UIImage imageNamed:@"ylz_process"];
    }
    return _processImageView;
}

- (UIImageView *)dashImageView {
    if(_dashImageView == nil) {
        _dashImageView = [[UIImageView alloc] init];
        _dashImageView.backgroundColor = YLZColorPlace;
    }
    return _dashImageView;
}

@end


