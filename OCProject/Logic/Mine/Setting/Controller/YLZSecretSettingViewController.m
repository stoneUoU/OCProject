//
//  YLZSecretSettingViewController.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZSecretSettingViewController.h"

#import "YLZSecretSettingSwitchTableViewCell.h"
#import "YLZSecretSettingTableViewCell.h"
#import "YLZSettingModel.h"

@interface YLZSecretSettingViewController ()<UITableViewDataSource,UITableViewDelegate,YLZSecretSettingSwitchTableViewCellDelegate>

@property (nonatomic, strong) UILabel *fontLabel;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray <YLZSettingModel *> *settingModelArrays;

@end

@implementation YLZSecretSettingViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setBaseUI:YLZColorWhite withTitleString:@"" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
    [self setUI];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.fontLabel];
    [self setMas];
}

- (void)setMas {
    [self.fontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(StatusBarHeight+NavBarHeight);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 44)));
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fontLabel.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH, SCREENHEIGHT - (StatusBarHeight+NavBarHeight+BottomDangerAreaHeight))));
    }];
    
    [self.tableView reloadData];
}

#pragma mark - IB-Action
#pragma mark -


#pragma mark - Notice
#pragma mark -


#pragma mark - Delegate
#pragma mark -


- (void)toSwitchClick:(UISwitch *)ylzSwitch {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.settingModelArrays count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YLZSettingModel *model = self.settingModelArrays[indexPath.section];
    if (indexPath.section == 0) {
        YLZSecretSettingSwitchTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZSecretSettingSwitchTableViewCell class])];
        if (!viewCell){
            viewCell = [[YLZSecretSettingSwitchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZSecretSettingSwitchTableViewCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        viewCell.settingModel = model;
        viewCell.delegate = self;
        return viewCell;
    } else {
        YLZSecretSettingTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZSecretSettingTableViewCell class])];
        if (!viewCell){
            viewCell = [[YLZSecretSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZSecretSettingTableViewCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        viewCell.settingModel = model;
        return viewCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 12;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.000001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - lazy load
#pragma mark -

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView registerClass:[YLZSecretSettingSwitchTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YLZSecretSettingSwitchTableViewCell class])];
        [_tableView registerClass:[YLZSecretSettingTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YLZSecretSettingTableViewCell class])];
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

- (UILabel *)fontLabel {
    if (!_fontLabel) {
        _fontLabel = [UILabel new];
        _fontLabel.font = [YLZFont medium:18];
        _fontLabel.textColor = YLZColorTitleOne;
        _fontLabel.text = @"隐私设置";
    }
    return _fontLabel;
}

- (NSMutableArray<YLZSettingModel *> *)settingModelArrays {
    if (!_settingModelArrays) {
        _settingModelArrays = @[].mutableCopy;
        for (int i = 0; i < 5; i++) {
            YLZSettingModel *settingModel = [[YLZSettingModel alloc] init];
            settingModel.indexTag = i;
            if (i == 0) {
                settingModel.titleString = @"模糊定位";
                settingModel.picString = @"";
            } else if (i == 1) {
                settingModel.titleString = @"精准定位";
                settingModel.picString = @"";
            } else if (i == 2) {
                settingModel.titleString = @"空闲时间";
                settingModel.picString = @"";
            } else if (i == 3) {
                settingModel.titleString = @"添加我的方式";
                settingModel.picString = @"";
            } else {
                settingModel.titleString = @"黑名单";
                settingModel.picString = @"";
            }
            [_settingModelArrays addObject:settingModel];
        }
    }
    return _settingModelArrays;
}

@end

