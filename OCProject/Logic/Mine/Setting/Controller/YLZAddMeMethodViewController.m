//
//  YLZAddMeMethodViewController.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZAddMeMethodViewController.h"

#import "YLZSecretSettingSwitchTableViewCell.h"
#import "YLZSettingModel.h"

@interface YLZAddMeMethodViewController ()<UITableViewDataSource,UITableViewDelegate,YLZSecretSettingSwitchTableViewCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray <YLZSettingModel *> *settingModelArrays;

@end

@implementation YLZAddMeMethodViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setBaseUI:YLZColorWhite withTitleString:@"添加我的方式" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
    [self setUI];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    [self.view addSubview:self.tableView];
    [self setMas];
}

- (void)setMas {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(StatusBarHeight+NavBarHeight);
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
    YLZLOG(@"_______%ld",(long)ylzSwitch.tag);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.settingModelArrays count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YLZSettingModel *model = self.settingModelArrays[indexPath.section];
    YLZSecretSettingSwitchTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZSecretSettingSwitchTableViewCell class])];
    if (!viewCell){
        viewCell = [[YLZSecretSettingSwitchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZSecretSettingSwitchTableViewCell class])];
    }
    viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    viewCell.settingModel = model;
    viewCell.delegate = self;
    return viewCell;
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
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

- (NSMutableArray<YLZSettingModel *> *)settingModelArrays {
    if (!_settingModelArrays) {
        _settingModelArrays = @[].mutableCopy;
        for (int i = 0; i < 3; i++) {
            YLZSettingModel *settingModel = [[YLZSettingModel alloc] init];
            settingModel.indexTag = i;
            if (i == 0) {
                settingModel.titleString = @"微信号";
                settingModel.picString = @"";
            } else if (i == 1) {
                settingModel.titleString = @"手机号";
                settingModel.picString = @"";
            } else {
                settingModel.titleString = @"QQ号";
                settingModel.picString = @"";
            }
            [_settingModelArrays addObject:settingModel];
        }
    }
    return _settingModelArrays;
}

@end

