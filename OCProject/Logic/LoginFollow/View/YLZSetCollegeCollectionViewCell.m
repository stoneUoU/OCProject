//
//  YLZSetCollegeCollectionViewCell.m
//  OCProject
//
//  Created by stone on 2021/7/4.
//

#import "YLZSetCollegeCollectionViewCell.h"

@interface YLZSetCollegeCollectionViewCell()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation YLZSetCollegeCollectionViewCell

#pragma mark - Init
#pragma mark -

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

#pragma mark - Public
#pragma mark -

- (void)setModelString:(NSString *)modelString {
    _modelString = modelString;
    self.titleLabel.text = modelString;
}

#pragma mark - Private
#pragma mark -

- (void)setUI {
    [self.contentView addSubview:self.titleLabel];
    [self setMas];
}

- (void)setMas {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
}

- (UILabel *)titleLabel {
    if(_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [YLZFont regular:14];
        _titleLabel.textColor = YLZColorOrangeView;
    }
    return _titleLabel;
}

@end
