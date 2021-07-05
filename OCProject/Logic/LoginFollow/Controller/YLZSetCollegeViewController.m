//
//  YLZSetCollegeViewController.m
//  OCProject
//
//  Created by stone on 2021/7/4.
//  设置学校：

#import "YLZSetCollegeViewController.h"
#import "YLZSetCollegeCollectionViewCell.h"

#import "YLZCategory.h"

#import "YLZCollegeAreaPickerView.h"

static NSString *const kYLZSetCollegeCollectionViewCell = @"YLZSetCollegeCollectionViewCell";

static CGFloat const kMargin = 24.0;

@interface YLZSetCollegeViewController()<UITextFieldDelegate,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,YLZCollegeAreaPickerViewDelegate>

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIButton *searchButton;

@property (nonatomic, strong) UILabel *searchLabel;

@property (nonatomic, strong) UIImageView *searchImageView;

@property (nonatomic, strong) UIView *provinceView;

@property (nonatomic, strong) UILabel *provinceLabel;

@property (nonatomic, strong) UIImageView *provinceImageView;

@property (nonatomic, strong) UIView *cityView;

@property (nonatomic, strong) UILabel *cityLabel;

@property (nonatomic, strong) UIImageView *cityImageView;

@property (nonatomic, strong) UILabel *fontLabel;

@property (nonatomic, strong) UIButton *moreButton;

@property (nonatomic, strong) UIView *collectionWrapView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIButton *doneButton;

@property (nonatomic, strong) NSMutableArray <NSString *>*collegeModelArrays;

@property (nonatomic, strong) YLZCollegeAreaPickerView *collegeAreaPickerView;

@end

@implementation YLZSetCollegeViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setBaseUI:YLZColorWhite withTitleString:@"" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back_circle" withRightString:@"步骤4/4" withRightColor:YLZColorTitleThree withRightFontSize:14];
    [self setUI];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    
    [self.view addSubview:self.nameLabel];
    
    [self.view addSubview:self.searchButton];
    [self.searchButton addSubview:self.searchLabel];
    [self.searchButton addSubview:self.searchImageView];
    
    [self.view addSubview:self.provinceView];
    [self.provinceView addSubview:self.provinceLabel];
    [self.provinceView addSubview:self.provinceImageView];
    
    [self.view addSubview:self.cityView];
    [self.cityView addSubview:self.cityLabel];
    [self.cityView addSubview:self.cityImageView];
    
    [self.view addSubview:self.fontLabel];
    [self.view addSubview:self.moreButton];
    [self.view addSubview:self.collectionWrapView];
    [self.collectionWrapView addSubview:self.collectionView];
    
    [self.view addSubview:self.doneButton];
    [self setMas];
}

- (void)setMas {
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(StatusBarHeight+NavBarHeight+36);
        make.left.equalTo(self.view.mas_left).offset(kMargin);
    }];
    [self.searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(15);
        make.left.equalTo(self.view.mas_left).offset(kMargin);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH-48), 44)));
    }];
    [self.searchLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.searchButton);
        make.left.equalTo(self.searchButton.mas_left).offset(16);
    }];
    [self.searchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.searchButton);
        make.right.equalTo(self.searchButton.mas_right).offset(-16);
    }];
    //省：
    [self.provinceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchButton.mas_bottom).offset(16);
        make.left.equalTo(self.view.mas_left).offset(kMargin);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH-64)/2, 64)));
    }];
    [self.provinceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.provinceView);
        make.right.equalTo(self.provinceView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake(10, 6)));
    }];
    [self.provinceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.provinceView);
        make.left.equalTo(self.provinceView.mas_left).offset(16);
        make.right.equalTo(self.provinceImageView.mas_left).offset(-16);
    }];
    //市：
    [self.cityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchButton.mas_bottom).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-kMargin);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH-64)/2, 64)));
    }];
    [self.cityImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cityView);
        make.right.equalTo(self.cityView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake(10, 6)));
    }];
    [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cityView);
        make.left.equalTo(self.cityView.mas_left).offset(16);
        make.right.equalTo(self.cityImageView.mas_left).offset(-16);
    }];
    [self.fontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.provinceView.mas_bottom).offset(16);
        make.left.equalTo(self.view.mas_left).offset(kMargin);
    }];
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.fontLabel);
        make.right.equalTo(self.view.mas_right).offset(-kMargin);
    }];
    [self.collectionWrapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fontLabel.mas_bottom).offset(16);
        make.left.equalTo(self.view.mas_left).offset(kMargin);
        make.right.equalTo(self.view.mas_right).offset(-kMargin);
        make.bottom.equalTo(self.doneButton.mas_top).offset(-(16));
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionWrapView.mas_top).offset(10);
        make.left.equalTo(self.collectionWrapView.mas_left);
        make.right.equalTo(self.collectionWrapView.mas_right);
        make.bottom.equalTo(self.collectionWrapView.mas_bottom).offset(-(10));
    }];
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-(BottomDangerAreaHeight+24));
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH-32, 44)));
    }];
    [self.moreButton setButtonEdgeInsetsStyle:UIButtonEdgeInsetsStyleRight margin:5];
    [self.doneButton setButtonEdgeInsetsStyle:UIButtonEdgeInsetsStyleRight margin:5];
}

#pragma mark - IB-Action
#pragma mark -

- (void)toSearch:(UIButton *)sender {
    
}

- (void)toDone:(UIButton *)sender {
    
}

- (void)textFieldChange:(UITextField *)textField {
    
}

- (void)toRecognizer:(UITapGestureRecognizer *)recognizer {
    UIView *view = recognizer.view;
    if (view.tag == 0) {
        self.collegeAreaPickerView = [[YLZCollegeAreaPickerView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 150+56)];
        self.collegeAreaPickerView.delegate = self;
        [self.collegeAreaPickerView ylz_show];
    }
}

- (void)toMore:(UIButton *)sender {
    
}

#pragma mark - Notice
#pragma mark -


#pragma mark - Delegate
#pragma mark -

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.collegeModelArrays count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *modelString = self.collegeModelArrays[indexPath.row];
    YLZSetCollegeCollectionViewCell *viewCell = [collectionView dequeueReusableCellWithReuseIdentifier:kYLZSetCollegeCollectionViewCell forIndexPath:indexPath];
    viewCell.modelString = modelString;
    return viewCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((SCREENWIDTH - 58)/2, 24);
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

#pragma mark - lazy load
#pragma mark -

- (YLZCollegeAreaPickerView *)collegeAreaPickerView {
    if (!_collegeAreaPickerView) {
        _collegeAreaPickerView = [[YLZCollegeAreaPickerView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 235+56+BottomDangerAreaHeight)];
        _collegeAreaPickerView.delegate = self;
    }
    return _collegeAreaPickerView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [YLZFont bold:18];
        _nameLabel.textColor = YLZColorTitleOne;
        _nameLabel.text = @"你所读的大学？";
    }
    return _nameLabel;
}

- (UIButton *)searchButton {
    if (!_searchButton) {
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchButton.layer.cornerRadius = 22.0;
        _searchButton.layer.masksToBounds = YES;
        _searchButton.layer.borderColor = [YLZColorLine CGColor];
        _searchButton.layer.borderWidth = 1.0;
        [_searchButton addTarget:self action:@selector(toSearch:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchButton;
}

- (UILabel *)searchLabel {
    if (!_searchLabel) {
        _searchLabel = [UILabel new];
        _searchLabel.font = [YLZFont regular:14];
        _searchLabel.textColor = YLZColorTitleThree;
        _searchLabel.text = @"快速查找学校";
    }
    return _searchLabel;
}

- (UIImageView *)searchImageView {
    if (!_searchImageView) {
        _searchImageView = [UIImageView new];
        _searchImageView.image = [UIImage imageNamed:@"ylz_follow_search"];
    }
    return _searchImageView;
}

- (UIView *)provinceView {
    if (!_provinceView) {
        _provinceView = [UIView new];
        _provinceView.backgroundColor = YLZColorCellBackGround;
        _provinceView.layer.cornerRadius = 10.0;
        _provinceView.layer.masksToBounds = YES;
        _provinceView.tag = 0;
        _provinceView.userInteractionEnabled = YES;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toRecognizer:)];
        [_provinceView addGestureRecognizer:recognizer];
    }
    return _provinceView;
}

- (UILabel *)provinceLabel {
    if (!_provinceLabel) {
        _provinceLabel = [UILabel new];
        _provinceLabel.font = [YLZFont regular:14];
        _provinceLabel.textColor = YLZColorTitleOne;
        _provinceLabel.text = @"省";
    }
    return _provinceLabel;
}

- (UIImageView *)provinceImageView {
    if (!_provinceImageView) {
        _provinceImageView = [UIImageView new];
        _provinceImageView.image = [UIImage imageNamed:@"ylz_arrow_down"];
    }
    return _provinceImageView;
}

- (UIView *)cityView {
    if (!_cityView) {
        _cityView = [UIView new];
        _cityView.backgroundColor = YLZColorCellBackGround;
        _cityView.layer.cornerRadius = 10.0;
        _cityView.layer.masksToBounds = YES;
        _cityView.tag = 1;
        _cityView.userInteractionEnabled = YES;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toRecognizer:)];
        [_cityView addGestureRecognizer:recognizer];
    }
    return _cityView;
}

- (UILabel *)cityLabel {
    if (!_cityLabel) {
        _cityLabel = [UILabel new];
        _cityLabel.font = [YLZFont regular:14];
        _cityLabel.textColor = YLZColorTitleOne;
        _cityLabel.text = @"市";
    }
    return _cityLabel;
}

- (UIImageView *)cityImageView {
    if (!_cityImageView) {
        _cityImageView = [UIImageView new];
        _cityImageView.image = [UIImage imageNamed:@"ylz_arrow_down"];
    }
    return _cityImageView;
}

- (UILabel *)fontLabel {
    if (!_fontLabel) {
        _fontLabel = [UILabel new];
        _fontLabel.font = [YLZFont medium:16];
        _fontLabel.textColor = YLZColorTitleOne;
        _fontLabel.text = @"北京的大学列表";
        _fontLabel.numberOfLines = 0;
    }
    return _fontLabel;
}

- (UIButton *)moreButton {
    if (!_moreButton) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreButton.titleLabel.font = [YLZFont regular:14];
        [_moreButton setTitleColor:YLZColorOrangeView forState:UIControlStateNormal];
        [_moreButton setTitle:@"更多" forState:UIControlStateNormal];
        [_moreButton setImage:[UIImage imageNamed:@"ylz_follow_next"] forState:UIControlStateNormal];
        [_moreButton addTarget:self action:@selector(toMore:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}

- (UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _doneButton.titleLabel.font = [YLZFont regular:16];
        [_doneButton setTitleColor:YLZColorOrangeView forState:UIControlStateNormal];
        [_doneButton setTitle:@"下一步  " forState:UIControlStateNormal];
        [_doneButton setImage:[UIImage imageNamed:@"ylz_follow_next"] forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = YLZColorCellBackGround;
        _collectionView.showsHorizontalScrollIndicator = NO;
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [_collectionView registerClass:YLZSetCollegeCollectionViewCell.self forCellWithReuseIdentifier:kYLZSetCollegeCollectionViewCell];
    }
    return _collectionView;
}

- (UIView *)collectionWrapView {
    if (!_collectionWrapView) {
        _collectionWrapView = [UIView new];
        _collectionWrapView.backgroundColor = YLZColorCellBackGround;
        _collectionWrapView.layer.cornerRadius = 10.0;
        _collectionWrapView.layer.masksToBounds = YES;
    }
    return _collectionWrapView;
}

- (NSMutableArray *)collegeModelArrays {
    if (!_collegeModelArrays) {
        _collegeModelArrays = [NSMutableArray array];
        for (int i = 0; i < 30; i++) {
            [_collegeModelArrays addObject:@"北京大学"];
        }
    }
    return _collegeModelArrays;
}

@end




