//
//  YLZSettingViewController.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZSettingViewController.h"

#import "YLZSettingTableViewCell.h"
#import "YLZConstTableViewCell.h"
#import "YLZSettingModel.h"

@interface YLZSettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray <YLZSettingModel *> *settingModelArrays;

@end

@implementation YLZSettingViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setBaseUI:YLZColorWhite withTitleString:@"设置" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back_circle" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.settingModelArrays count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YLZSettingModel *model = self.settingModelArrays[indexPath.section];
    if (indexPath.section > 6) {
        YLZConstTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZConstTableViewCell class])];
        if (!viewCell){
            viewCell = [[YLZConstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZConstTableViewCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        viewCell.settingModel = model;
        return viewCell;
    } else {
        YLZSettingTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZSettingTableViewCell class])];
        if (!viewCell){
            viewCell = [[YLZSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZSettingTableViewCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        viewCell.settingModel = model;
        return viewCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 8;
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
        [_tableView registerClass:[YLZSettingTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YLZSettingTableViewCell class])];
        [_tableView registerClass:[YLZConstTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YLZConstTableViewCell class])];
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

- (NSMutableArray<YLZSettingModel *> *)settingModelArrays {
    if (!_settingModelArrays) {
        _settingModelArrays = @[].mutableCopy;
        for (int i = 0; i < 9; i++) {
            YLZSettingModel *settingModel = [[YLZSettingModel alloc] init];
            settingModel.indexTag = i;
            if (i == 0) {
                settingModel.titleString = @"实名认证";
                settingModel.picString = @"";
            } else if (i == 1) {
                settingModel.titleString = @"隐私设置";
                settingModel.picString = @"";
            } else if (i == 2) {
                settingModel.titleString = @"密码修改";
                settingModel.picString = @"";
            } else if (i == 3) {
                settingModel.titleString = @"编辑资料";
                settingModel.picString = @"";
            } else if (i == 4) {
                settingModel.titleString = @"绑定账号";
                settingModel.picString = @"";
            } else if (i == 5) {
                settingModel.titleString = @"用户协议";
                settingModel.picString = @"";
            } else if (i == 6) {
                settingModel.titleString = @"意见反馈";
                settingModel.picString = @"";
            } else if (i == 7) {
                settingModel.titleString = @"退出登录";
                settingModel.picString = @"";
            } else {
                settingModel.titleString = @"切换账号";
                settingModel.picString = @"";
            }
            [_settingModelArrays addObject:settingModel];
        }
    }
    return _settingModelArrays;
}

@end
