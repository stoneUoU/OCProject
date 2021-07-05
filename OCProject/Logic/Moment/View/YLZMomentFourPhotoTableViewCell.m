//
//  YLZMomentFourPhotoTableViewCell.m
//  OCProject
//
//  Created by stone on 2021/7/5.
//

#import "YLZMomentFourPhotoTableViewCell.h"
#import "YLZMomentPicCollectionViewCell.h"

#import "YLZMomentModel.h"
#import "YLZKitCategory.h"

static NSString *const kYLZMomentPicCollectionViewCell = @"YLZMomentPicCollectionViewCell";

@interface YLZMomentFourPhotoTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIImageView *avaterImageView;

@property (nonatomic, strong) UILabel *avaterLabel;

@property (nonatomic, strong) UIButton *followButton;

//图片collectionView:
@property (nonatomic, strong) UICollectionView *picCollectionView;

//说说文字:
@property (nonatomic, strong) UILabel *modeLabel;

@property (nonatomic, strong) UIView *operateView;

@property (nonatomic, strong) UIButton *sendButton;

@property (nonatomic, strong) UILabel *sendLabel;

@property (nonatomic, strong) UIImageView *sendImageView;

@property (nonatomic, strong) UIButton *commentButton;

@property (nonatomic, strong) UIButton *admireButton;

//发布日期：
@property (nonatomic, strong) UILabel *publishLabel;

@end

@implementation YLZMomentFourPhotoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setModel:(YLZMomentModel *)model {
    _model = model;
    
    self.avaterImageView.image = [UIImage imageNamed:model.picString];
    self.avaterLabel.text = model.titleString;
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.avaterImageView];
    [self.bgView addSubview:self.avaterLabel];
    [self.bgView addSubview:self.followButton];
    
    [self.bgView addSubview:self.picCollectionView];
    [self.bgView addSubview:self.modeLabel];
    
    [self.bgView addSubview:self.operateView];
    [self.operateView addSubview:self.sendButton];
    [self.sendButton addSubview:self.sendLabel];
    [self.sendButton addSubview:self.sendImageView];
    
    [self.operateView addSubview:self.commentButton];
    [self.operateView addSubview:self.admireButton];
    
    [self.bgView addSubview:self.publishLabel];
    [self setMas];
}

- (void)setMas {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(8);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
    }];
    
    [self.avaterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(20);
        make.left.equalTo(self.bgView.mas_left).offset(12);
        make.size.equalTo(@(CGSizeMake(36, 36)));
    }];
    [self.avaterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.avaterImageView);
        make.left.equalTo(self.avaterImageView.mas_right).offset(8);
    }];
    
    [self.followButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.avaterImageView);
        make.right.equalTo(self.bgView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake(56, 24)));
    }];
    
    [self.picCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avaterImageView.mas_bottom).offset(6);
        make.left.equalTo(self.bgView.mas_left).offset(18);
        make.right.equalTo(self.bgView.mas_right).offset(-18);
        make.height.equalTo(@(266));
    }];
    [self.modeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.picCollectionView.mas_bottom).offset(16);
        make.left.equalTo(self.bgView.mas_left).offset(18);
        make.right.equalTo(self.bgView.mas_right).offset(-18);
    }];
    [self.operateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.modeLabel.mas_bottom).offset(16);
        make.left.equalTo(self.bgView.mas_left).offset(18);
        make.right.equalTo(self.bgView.mas_right).offset(-18);
        make.height.equalTo(@(36));
    }];
    
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.operateView);
        make.left.equalTo(self.bgView.mas_left).offset(18);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH - (32 + 36 +20))/2, 36)));
    }];
    [self.sendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.operateView);
        make.left.equalTo(self.sendButton.mas_left).offset(16);
    }];
    [self.sendImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.operateView);
        make.right.equalTo(self.sendButton.mas_right).offset(-16);
    }];
    
    [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.operateView);
        make.left.equalTo(self.sendButton.mas_right).offset(10);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH - (32 + 36 +20))/4, 36)));
    }];
    [self.admireButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.operateView);
        make.right.equalTo(self.bgView.mas_right).offset(-18);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH - (32 + 36 +20))/4, 36)));
    }];
    [self.publishLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.operateView.mas_bottom).offset(16);
        make.left.equalTo(self.bgView.mas_left).offset(18);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-36);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)toFollow:(UIButton *)sender {
    !self.followHandle ?: self.followHandle();
}

- (void)toOperate:(UIButton *)sender {
    !self.operateHandle ?: self.operateHandle(sender.tag);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YLZMomentModel *model = [[YLZMomentModel alloc] init];
    YLZMomentPicCollectionViewCell *viewCell = [collectionView dequeueReusableCellWithReuseIdentifier:kYLZMomentPicCollectionViewCell forIndexPath:indexPath];
    viewCell.model = model;
    return viewCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((SCREENWIDTH - (36+32+10))/2, 128);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
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
        _bgView.layer.cornerRadius = 42;
        _bgView.layer.shadowColor = [UIColor colorWithRed:56/255.0 green:136/255.0 blue:221/255.0 alpha:0.1].CGColor;
        _bgView.layer.shadowOffset = CGSizeMake(0,6);
        _bgView.layer.shadowOpacity = 1;
        _bgView.layer.shadowRadius = 12;
    }
    return _bgView;
}

- (UIImageView *)avaterImageView {
    if (!_avaterImageView) {
        _avaterImageView = [UIImageView new];
        _avaterImageView.backgroundColor = YLZColorRed;
        _avaterImageView.layer.cornerRadius = 18.0;
        _avaterImageView.layer.masksToBounds = YES;
    }
    return _avaterImageView;
}

- (UILabel *)avaterLabel {
    if (!_avaterLabel) {
        _avaterLabel = [UILabel new];
        _avaterLabel.font = [YLZFont medium:14];
        _avaterLabel.textColor = YLZColorTitleOne;
    }
    return _avaterLabel;
}

- (UIButton *)followButton {
    if (!_followButton) {
        _followButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _followButton.titleLabel.font = [YLZFont regular:12];
        _followButton.layer.cornerRadius = 12;
        _followButton.layer.masksToBounds = YES;
        _followButton.layer.borderColor = YLZColorOrangeView.CGColor;
        _followButton.layer.borderWidth = 1.0;
        [_followButton setTitleColor:YLZColorOrangeView forState:UIControlStateNormal];
        [_followButton setTitle:@"关注 + " forState:UIControlStateNormal];
        [_followButton addTarget:self action:@selector(toFollow:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _followButton;
}

- (UICollectionView *)picCollectionView {
    if(_picCollectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _picCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _picCollectionView.delegate = self;
        _picCollectionView.dataSource = self;
        _picCollectionView.showsHorizontalScrollIndicator = NO;
        if (@available(iOS 11.0, *)) {
            _picCollectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _picCollectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [_picCollectionView registerClass:YLZMomentPicCollectionViewCell.self forCellWithReuseIdentifier:kYLZMomentPicCollectionViewCell];
        _picCollectionView.backgroundColor = [UIColor whiteColor];
    }
    return _picCollectionView;
}

- (UILabel *)modeLabel {
    if (!_modeLabel) {
        _modeLabel = [UILabel new];
        _modeLabel.font = [YLZFont regular:13];
        _modeLabel.textColor = YLZColorTitleOne;
        _modeLabel.numberOfLines = 0;
        _modeLabel.text = @"周末一起运动吧！！周末一起运动吧！！周末一起运动吧！！周末一起运动吧！！周末一起运动吧！！周末一起运动吧！！周末一起运动吧！！周末一起运动吧！！";
    }
    return _modeLabel;
}

- (UIView *)operateView {
    if (!_operateView) {
        _operateView = [UIView new];
//        _operateView.backgroundColor = YLZColorRed;
//        _operateView.layer.cornerRadius = 18.0;
//        _operateView.layer.masksToBounds = YES;
    }
    return _operateView;
}

- (UIButton *)sendButton {
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton.backgroundColor = YLZColorCellBackGround;
        _sendButton.layer.cornerRadius = 18.0;
        _sendButton.layer.masksToBounds = YES;
        [_sendButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendButton;
}

- (UILabel *)sendLabel {
    if (!_sendLabel) {
        _sendLabel = [UILabel new];
        _sendLabel.font = [YLZFont regular:12];
        _sendLabel.textColor = YLZColorTitleThree;
        _sendLabel.text = @"说点什么吧！";
    }
    return _sendLabel;
}

- (UIImageView *)sendImageView {
    if (!_sendImageView) {
        _sendImageView = [UIImageView new];
        _sendImageView.image = [UIImage imageNamed:@"ylz_moment_publish"];
    }
    return _sendImageView;
}


- (UIButton *)commentButton {
    if (!_commentButton) {
        _commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _commentButton.backgroundColor = YLZColorCellBackGround;
        _commentButton.layer.cornerRadius = 18.0;
        _commentButton.layer.masksToBounds = YES;
        _commentButton.tag = 1;
        [_commentButton setImage:[UIImage imageNamed:@"ylz_moment_comment"] forState:UIControlStateNormal];
        _commentButton.titleLabel.font = [YLZFont regular:14];
        [_commentButton setTitleColor:YLZColorTitleTwo forState:UIControlStateNormal];
        [_commentButton setTitle:@" 33" forState:UIControlStateNormal];
        [_commentButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commentButton;
}

- (UIButton *)admireButton {
    if (!_admireButton) {
        _admireButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _admireButton.backgroundColor = YLZColorCellBackGround;
        _admireButton.layer.cornerRadius = 18.0;
        _admireButton.titleLabel.font = [YLZFont regular:14];
        _admireButton.layer.masksToBounds = YES;
        _admireButton.tag = 2;
        [_admireButton setImage:[UIImage imageNamed:@"ylz_moment_admire"] forState:UIControlStateNormal];
        [_admireButton setTitleColor:YLZColorTitleTwo forState:UIControlStateNormal];
        [_admireButton setTitle:@" 66" forState:UIControlStateNormal];
        [_admireButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _admireButton;
}

- (UILabel *)publishLabel {
    if (!_publishLabel) {
        _publishLabel = [UILabel new];
        _publishLabel.font = [YLZFont regular:10];
        _publishLabel.textColor = YLZColorTitleThree;
        _publishLabel.text = @"发布日期：2020:05:20 09:00";
    }
    return _publishLabel;
}

@end




