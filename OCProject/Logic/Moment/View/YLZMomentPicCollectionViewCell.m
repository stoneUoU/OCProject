//
//  YLZMomentPicCollectionViewCell.m
//  OCProject
//
//  Created by stone on 2021/7/5.
//

#import "YLZMomentPicCollectionViewCell.h"
#import "YLZOperateModel.h"

@interface YLZMomentPicCollectionViewCell()

@property (nonatomic, strong) UIImageView *picImageView;

@end

@implementation YLZMomentPicCollectionViewCell

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

- (void)setModel:(YLZMomentModel *)model {
    _model = model;
    self.picImageView.image = [UIImage imageNamed:@""];
}

#pragma mark - Private
#pragma mark -

- (void)setUI {
    [self.contentView addSubview:self.picImageView];
    
    [self setMas];
}

- (void)setMas {
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

- (UIImageView *)picImageView {
    if(_picImageView == nil) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.layer.cornerRadius = 21;
        _picImageView.layer.masksToBounds = YES;
        _picImageView.backgroundColor = YLZColorOrangeView;
    }
    return _picImageView;
}

@end


