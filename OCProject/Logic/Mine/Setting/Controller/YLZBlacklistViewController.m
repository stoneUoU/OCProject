//
//  YLZBlacklistViewController.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZBlacklistViewController.h"

#import "YLZBlacklistTableViewCell.h"
#import "YLZBlacklistModel.h"

@interface YLZBlacklistViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray <YLZBlacklistModel *> *peopleModelArrays;

@end

@implementation YLZBlacklistViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setBaseUI:YLZColorWhite withTitleString:@"黑名单" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
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
    return [self.peopleModelArrays count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YLZBlacklistModel *model = self.peopleModelArrays[indexPath.section];
    YLZBlacklistTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZBlacklistTableViewCell class])];
    if (!viewCell){
        viewCell = [[YLZBlacklistTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZBlacklistTableViewCell class])];
    }
    viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    viewCell.blacklistModel = model;
    return viewCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88;
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
        [_tableView registerClass:[YLZBlacklistTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YLZBlacklistTableViewCell class])];
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

- (NSMutableArray<YLZBlacklistModel *> *)peopleModelArrays {
    if (!_peopleModelArrays) {
        _peopleModelArrays = @[].mutableCopy;
        for (int i = 0; i < 3; i++) {
            YLZBlacklistModel *settingModel = [[YLZBlacklistModel alloc] init];
//            settingModel.indexTag = i;
            if (i == 0) {
                settingModel.nameString = @"微信号";
                settingModel.picString = @"";
            } else if (i == 1) {
                settingModel.nameString = @"手机号";
                settingModel.picString = @"";
            } else {
                settingModel.nameString = @"QQ号";
                settingModel.picString = @"";
            }
            [_peopleModelArrays addObject:settingModel];
        }
    }
    return _peopleModelArrays;
}

@end

