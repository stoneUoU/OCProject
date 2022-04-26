//
//  YLZRouteCodeLoadingCell.m
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import "YLZRouteCodeLoadingCell.h"
#import "YLZKitCategory.h"
#import "YLZCategory.h"
#import "YLZRouteCodeCellLoadingView.h"
#import "YLZRouteCodeCellBottomView.h"
#import "YLZRouteCodeCellInfoView.h"

@interface YLZRouteCodeLoadingCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) YLZRouteCodeCellInfoView *codeInfoView;
@property (nonatomic, strong) YLZRouteCodeCellLoadingView *codeView;
@property (nonatomic, strong) YLZRouteCodeCellBottomView *bottomView;

@end

@implementation YLZRouteCodeLoadingCell

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
    [self.bgView addSubview:self.codeView];
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
        _bgView.frame = CGRectMake(24, 0, SCREENWIDTH - 48, 400);
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius = 12.0;
        _bgView.layer.shadowColor = [[UIColor colorWithRed:56/255.0 green:136/255.0 blue:221/255.0 alpha:0.1] CGColor];
        _bgView.layer.shadowOffset = CGSizeMake(0, 6);
        _bgView.layer.shadowOpacity = 1;
        _bgView.layer.shadowRadius = 12;
    }
    return _bgView;
}

- (YLZRouteCodeCellInfoView *)codeInfoView {
    if (!_codeInfoView) {
        _codeInfoView = [[YLZRouteCodeCellInfoView alloc] init];
        _codeInfoView.frame = CGRectMake(0, 0, SCREENWIDTH - 48, 76);
    }
    return _codeInfoView;
}

- (YLZRouteCodeCellLoadingView *)codeView {
    if (!_codeView) {
        _codeView = [[YLZRouteCodeCellLoadingView alloc] init];
        _codeView.frame = CGRectMake(16, 76, SCREENWIDTH - (48+32), 224);
    }
    return _codeView;
}

- (YLZRouteCodeCellBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[YLZRouteCodeCellBottomView alloc] init];
        _bottomView.frame = CGRectMake(0, 300, SCREENWIDTH - 48, 100);
    }
    return _bottomView;
}

@end





