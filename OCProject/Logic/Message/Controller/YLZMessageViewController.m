//
//  YLZMessageViewController.m
//  OCProject
//
//  Created by stone on 2021/7/4.
//

#import "YLZMessageViewController.h"
#import "YLZMessageCollectionViewCell.h"
#import "YLZMessageTableViewCell.h"

#import "YLZKitCategory.h"
#import "YLZNetWork.h"

#import "YLZMessageModel.h"
#import "YLZOperateModel.h"

static CGFloat const kMargin = 24.0;
static NSString *const kYLZMessageCollectionViewCell = @"YLZMessageCollectionViewCell";
static NSString *const kYLZMessageTableViewCell = @"YLZMessageTableViewCell";

@interface YLZMessageViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray <YLZMessageModel *> *messageModelArrays;

@property (nonatomic, strong) NSMutableArray <YLZOperateModel *> *operateModelArrays;

@property (nonatomic, strong) UIButton *searchButton;

@property (nonatomic, strong) UILabel *searchLabel;

@property (nonatomic, strong) UIImageView *searchImageView;

@property (nonatomic, strong) UIView *collectionWrapView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation YLZMessageViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    [self setBaseUI:YLZColorWhite withTitleString:@"消息" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
    
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
    [self.view addSubview:self.searchButton];
    [self.searchButton addSubview:self.searchLabel];
    [self.searchButton addSubview:self.searchImageView];
    
    [self.view addSubview:self.collectionWrapView];
    [self.collectionWrapView addSubview:self.collectionView];
    [self.view addSubview:self.tableView];
    
    [self setMas];
}

- (void)setMas {
    [self.searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(StatusBarHeight+NavBarHeight+16);
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
    [self.collectionWrapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchButton.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH-32), 112)));
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.collectionWrapView);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionWrapView.mas_bottom).offset(16);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view);
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

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.operateModelArrays count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YLZOperateModel *model = self.operateModelArrays[indexPath.row];
    YLZMessageCollectionViewCell *viewCell = [collectionView dequeueReusableCellWithReuseIdentifier:kYLZMessageCollectionViewCell forIndexPath:indexPath];
    viewCell.model = model;
    return viewCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((SCREENWIDTH - 32)/4, 112);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.messageModelArrays count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YLZMessageModel *model = self.messageModelArrays[indexPath.section];
    YLZMessageTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:kYLZMessageTableViewCell];
    if (!viewCell){
        viewCell = [[YLZMessageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kYLZMessageTableViewCell];
    }
    viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    viewCell.model = model;
    return viewCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 96;
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
        _searchLabel.text = @"搜索聊天记录\通知内容";
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

- (UIView *)collectionWrapView {
    if (!_collectionWrapView) {
        _collectionWrapView = [UIView new];
        _collectionWrapView.backgroundColor = YLZColorWhite;
        _collectionWrapView.layer.cornerRadius = 12;
        _collectionWrapView.layer.shadowColor = [UIColor colorWithRed:56/255.0 green:136/255.0 blue:221/255.0 alpha:0.1].CGColor;
        _collectionWrapView.layer.shadowOffset = CGSizeMake(0,6);
        _collectionWrapView.layer.shadowOpacity = 1;
        _collectionWrapView.layer.shadowRadius = 12;
    }
    return _collectionWrapView;
}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [_collectionView registerClass:YLZMessageCollectionViewCell.self forCellWithReuseIdentifier:kYLZMessageCollectionViewCell];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (NSMutableArray *)operateModelArrays {
    if (!_operateModelArrays) {
        _operateModelArrays = [NSMutableArray array];
        for (int i = 0; i < 4; i++) {
            YLZOperateModel *model = [[YLZOperateModel alloc] init];
            model.count = i;
            if (i == 0) {
                model.titleString = @"点赞";
                model.picString = @"ylz_message_admire";
            } else if (i == 1) {
                model.titleString = @"评论";
                model.picString = @"ylz_message_comment";
            } else if (i == 2) {
                model.titleString = @"新增关注";
                model.picString = @"ylz_message_follow";
            } else {
                model.titleString = @"待处理";
                model.picString = @"ylz_message_waiting";
            }
            [_operateModelArrays addObject:model];
        }
    }
    return _operateModelArrays;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView registerClass:[YLZMessageTableViewCell class] forCellReuseIdentifier:kYLZMessageTableViewCell];
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

- (NSMutableArray *)messageModelArrays {
    if (!_messageModelArrays) {
        _messageModelArrays = [NSMutableArray array];
        for (int i = 0; i < 4; i++) {
            YLZMessageModel *model = [[YLZMessageModel alloc] init];
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
            [_messageModelArrays addObject:model];
        }
    }
    return _messageModelArrays;
}

@end
