//
//  YLZMomentFollowViewController.m
//  OCProject
//
//  Created by stone on 2021/7/5.
//

#import "YLZMomentFollowViewController.h"
#import "YLZMomentOnePhotoTableViewCell.h"
#import "YLZMomentFourPhotoTableViewCell.h"

#import "YLZKitCategory.h"
#import "YLZNetWork.h"

#import "YLZMomentModel.h"

static CGFloat const kMargin = 24.0;
static NSString *const kYLZMomentOnePhotoTableViewCell = @"YLZMomentOnePhotoTableViewCell";
static NSString *const kYLZMomentFourPhotoTableViewCell = @"YLZMomentFourPhotoTableViewCell";

@interface YLZMomentFollowViewController ()< UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray <YLZMomentModel *> *momentModelArrays;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation YLZMomentFollowViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)dealloc {
    YLZLOG(@"界面销毁");
}

- (instancetype)init
{
    self = [super init ];//当前对象self
    if (self !=nil) {//如果对象初始化成功，才有必要进行接下来的初始化
    }
    return self;//返回一个已经初始化完毕的对象；
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YLZColorView;
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
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
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - IB-Action
#pragma mark -

- (void)toSearch:(UIButton *)sender {

}

#pragma mark - Notice
#pragma mark -


#pragma mark - Delegate
#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.momentModelArrays count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YLZMomentModel *model = self.momentModelArrays[indexPath.section];
    if (indexPath.section == 0) {
        YLZMomentFourPhotoTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:kYLZMomentFourPhotoTableViewCell];
        if (!viewCell){
            viewCell = [[YLZMomentFourPhotoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kYLZMomentFourPhotoTableViewCell];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        viewCell.model = model;
        return viewCell;
    } else {
        YLZMomentOnePhotoTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:kYLZMomentOnePhotoTableViewCell];
        if (!viewCell){
            viewCell = [[YLZMomentOnePhotoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kYLZMomentOnePhotoTableViewCell];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        viewCell.model = model;
        return viewCell;
    }
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

#pragma mark - JXCategoryListContentViewDelegate

/**
 实现 <JXCategoryListContentViewDelegate> 协议方法，返回该视图控制器所拥有的「视图」
 */
- (UIView *)listView {
    return self.view;
}


#pragma mark - lazy load
#pragma mark -

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = YLZColorView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 16, 0, 16);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.estimatedRowHeight = 300;
        _tableView.estimatedSectionFooterHeight = 300;
        _tableView.estimatedSectionHeaderHeight = 300;
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView registerClass:[YLZMomentOnePhotoTableViewCell class] forCellReuseIdentifier:kYLZMomentOnePhotoTableViewCell];
        [_tableView registerClass:[YLZMomentFourPhotoTableViewCell class] forCellReuseIdentifier:kYLZMomentFourPhotoTableViewCell];
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

- (NSMutableArray *)momentModelArrays {
    if (!_momentModelArrays) {
        _momentModelArrays = [NSMutableArray array];
        for (int i = 0; i < 4; i++) {
            YLZMomentModel *model = [[YLZMomentModel alloc] init];
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
            [_momentModelArrays addObject:model];
        }
    }
    return _momentModelArrays;
}

@end

