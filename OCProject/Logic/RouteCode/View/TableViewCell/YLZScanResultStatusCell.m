//
//  YLZScanResultStatusCell.m
//  OCProject
//
//  Created by stone on 2022/9/2.
//

#import "YLZScanResultStatusCell.h"
#import "YLZKitCategory.h"
#import "YLZCategory.h"
#import "YLZScanResultCellStatusView.h"
#import "YLZScanResultCellRecordView.h"
#import "YLZScanResultCellInfoView.h"

@interface YLZScanResultStatusCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) YLZScanResultCellInfoView *codeInfoView;
@property (nonatomic, strong) YLZScanResultCellStatusView *statusView;
@property (nonatomic, strong) YLZScanResultCellRecordView *bottomView;

@property (nonatomic, assign) NSInteger clickNum;

@end

@implementation YLZScanResultStatusCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = YLZColorRouteCode;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.codeInfoView];
    [self.bgView addSubview:self.statusView];
    [self.bgView addSubview:self.bottomView];
    
    [self setMas];
}

- (void)setMas {
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)toOperate:(UIButton *)sender {
    
}

#pragma mark - getter

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = YLZColorWhite;
        _bgView.frame = CGRectMake(24, 0, SCREENWIDTH - 48, 374);
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius = 12.0;
        _bgView.layer.shadowColor = [[UIColor colorWithRed:56/255.0 green:136/255.0 blue:221/255.0 alpha:0.1] CGColor];
        _bgView.layer.shadowOffset = CGSizeMake(0, 6);
        _bgView.layer.shadowOpacity = 1;
        _bgView.layer.shadowRadius = 12;
    }
    return _bgView;
}

- (YLZScanResultCellInfoView *)codeInfoView {
    if (!_codeInfoView) {
        _codeInfoView = [[YLZScanResultCellInfoView alloc] init];
        _codeInfoView.frame = CGRectMake(0, 0, SCREENWIDTH - 48, 76);
    }
    return _codeInfoView;
}

- (YLZScanResultCellStatusView *)statusView {
    if (!_statusView) {
        _statusView = [[YLZScanResultCellStatusView alloc] init];
        _statusView.frame = CGRectMake(16, 76, SCREENWIDTH - (48+32), 210);
        _statusView.userInteractionEnabled = YES;
        __weak typeof(self) weakSelf = self;
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            !weakSelf.statusHandle ?: weakSelf.statusHandle();
        }];
        [_statusView addGestureRecognizer:ges];
    }
    return _statusView;
}

- (YLZScanResultCellRecordView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[YLZScanResultCellRecordView alloc] init];
        _bottomView.frame = CGRectMake(0, 286, SCREENWIDTH - 48, 88);
        _bottomView.userInteractionEnabled = YES;
        __weak typeof(self) weakSelf = self;
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            !weakSelf.processHandle ?: weakSelf.processHandle();
        }];
        [_bottomView addGestureRecognizer:ges];
    }
    return _bottomView;
}

@end
