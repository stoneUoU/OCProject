//
//  YLZPendingViewController.m
//  OCProject
//
//  Created by stone on 2021/7/5.
//

#import "YLZPendingViewController.h"

#import "YLZPendingTableViewCell.h"
#import "YLZPendingModel.h"

@interface YLZPendingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray <YLZPendingModel *> *pendingModelArrays;

@end

@implementation YLZPendingViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setBaseUI:YLZColorWhite withTitleString:@"待处理" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back_circle" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
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
    return [self.pendingModelArrays count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YLZPendingModel *model = self.pendingModelArrays[indexPath.section];
    YLZPendingTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZPendingTableViewCell class])];
    if (!viewCell){
        viewCell = [[YLZPendingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZPendingTableViewCell class])];
    }
    viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    viewCell.model = model;
    return viewCell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95;
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
        [_tableView registerClass:[YLZPendingTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YLZPendingTableViewCell class])];
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

- (NSMutableArray<YLZPendingModel *> *)pendingModelArrays {
    if (!_pendingModelArrays) {
        _pendingModelArrays = @[].mutableCopy;
        for (int i = 0; i < 4; i++) {
            YLZPendingModel *model = [[YLZPendingModel alloc] init];
            model.count = i;
            if (i == 0) {
                model.contentString = @"南昌工程学院南昌工程学院";
                model.timeString = @"9：01";
                model.titleString = @"Stone";
                model.picString = @"ylz_message_admire";
            } else if (i == 1) {
                model.contentString = @"你的实名认证已通过审核";
                model.timeString = @"22：01";
                model.titleString = @"活动通知";
                model.picString = @"ylz_message_comment";
            } else if (i == 2) {
                model.contentString = @"“一块流浪”评论了您的说说";
                model.timeString = @"22：36";
                model.titleString = @"系统消息";
                model.picString = @"ylz_message_follow";
            } else {
                model.contentString = @"你在干嘛？";
                model.timeString = @"22：01";
                model.titleString = @"不屑的小坦克";
                model.picString = @"ylz_message_waiting";
            }
            [_pendingModelArrays addObject:model];
        }
    }
    return _pendingModelArrays;
}

@end
