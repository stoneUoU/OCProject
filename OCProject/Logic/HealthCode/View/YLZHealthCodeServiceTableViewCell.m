//
//  YLZHealthCodeServiceTableViewCell.m
//  OCProject
//
//  Created by stone on 2021/9/24.
//

#import "YLZHealthCodeServiceTableViewCell.h"
#import "YLZHealthCodeCollectionViewCell.h"
#import "YLZKitCategory.h"

@interface YLZHealthCodeServiceTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray <NSString *> *dataModelArrays;


@end

@implementation YLZHealthCodeServiceTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = YLZColorMZTBlueView;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.titleLabel];
    [self.bgView addSubview:self.collectionView];
    
    [self setMas];
}

- (void)setMas {
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(16);
        make.left.equalTo(self.bgView).offset(16);
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(16);
        make.left.right.equalTo(self.bgView);
        make.height.equalTo(@(210));
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)toOperate:(UIButton *)sender {
    
}

#pragma mark - Delegate
#pragma mark -

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataModelArrays count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *modelString = self.dataModelArrays[indexPath.row];
    YLZHealthCodeCollectionViewCell *viewCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([YLZHealthCodeCollectionViewCell class]) forIndexPath:indexPath];
    viewCell.modelString = modelString;
    return viewCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((SCREENWIDTH - 42)/2, 36);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - getter

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = YLZColorWhite;
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius = 10.0;
        _bgView.layer.shadowColor = [UIColor colorWithRed:56/255.0 green:136/255.0 blue:221/255.0 alpha:0.1].CGColor;
        _bgView.layer.shadowOffset = CGSizeMake(0,6);
        _bgView.layer.shadowOpacity = 1;
        _bgView.layer.shadowRadius = 12;
    }
    return _bgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont regular:24];
        _titleLabel.textColor = YLZColorTitleOne;
        _titleLabel.text = @"相关服务";
    }
    return _titleLabel;
}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [_collectionView registerClass:YLZHealthCodeCollectionViewCell.self forCellWithReuseIdentifier:NSStringFromClass([YLZHealthCodeCollectionViewCell class])];
    }
    return _collectionView;
}

- (NSMutableArray *)dataModelArrays {
    if (!_dataModelArrays) {
        _dataModelArrays = [NSMutableArray array];
        [_dataModelArrays addObjectsFromArray:@[@"健康报告",@"为家人申领",@"扫张贴码",@"疫苗接种预约",@"疫苗接种查询",@"医保电子凭证",@"申领张贴码",@"申领机构张贴码",@"通信行程卡",@"疫情防控服务"]];
    }
    return _dataModelArrays;
}

@end






