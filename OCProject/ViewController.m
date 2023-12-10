//
//  ViewController.m
//  OCProject
//
//  Created by stone on 2021/5/24.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "YLZKitCategory.h"
#import <Flutter/Flutter.h>
#import <MJExtension/MJExtension.h>
#import "YLZRouteCodeViewController.h"

typedef void(^HSAExcuteHandle)(BOOL isSucc);

@interface ViewController ()<FlutterStreamHandler>

@property (nonatomic, copy) FlutterEventSink eventSink;

@property (nonatomic, strong) NSMutableArray *homeModelArrays;

@property (nonatomic, strong) UIButton *btnOk;

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *productLabel;

@property (nonatomic, strong) UILabel *bottomLabel;

@property (nonatomic, strong) dispatch_semaphore_t semaphore;

@property (nonatomic, copy) HSAExcuteHandle hsaHandle;

@property (nonatomic, copy) void(^resultHandle)(BOOL isSucc);

@end

@implementation ViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)dealloc {
    YLZLOG(@"界面销毁");
}

- (instancetype)init
{
    self = [super init ];//当前对象self
    if (self !=nil) {//如果对象初始化成功，才有必要进行接下来的初始化
        self.semaphore = dispatch_semaphore_create(0);
    }
    return self;//返回一个已经初始化完毕的对象；
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setBaseUI:YLZColorWhite withTitleString:@"" withTitleColor:YLZColorWhite withLeftImageViewString:@"" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
    
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:true];
    self.navigationController.navigationBarHidden = true;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    [self.view addSubview:self.btnOk];
//    [self.view addSubview:self.iconImageView];
//    [self.view addSubview:self.productLabel];
//    [self.view addSubview:self.bottomLabel];
    [self setMas];
}

- (void)setMas {
    [self.btnOk mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 64, 40)));
    }];
    
//    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        make.centerY.equalTo(self.view).offset(-64);
//        make.size.equalTo(@(CGSizeMake(64, 64)));
//    }];
//    [self.productLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        make.top.equalTo(self.iconImageView.mas_bottom).offset(32);
//    }];
//    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-(BottomDangerAreaHeight+16));
//    }];
    
//    [self funcWithHandle:^(NSString *handleStr) {
//        YLZLOG(@"_____%@",handleStr);
//    }];
    
//    [self mergeRequest];
    
//    [self excuteSerialQueue];
    
//    [self excuteQueueGroup];
}

- (void)funcWithHandle:(void(^)(NSString *handleStr))handle {
    
//    void(^excuteHandle)(NSString *handleStr) = ^(NSString *handleStr) {
//    };
//    excuteHandle(@"iOS开发工程师");
    
    !handle ?: handle(@"iOS开发工程师----林磊");
}

#pragma mark - Example 1
#pragma mark -

- (void)mergeRequest {
    __weak typeof(self)weakSelf = self;
    dispatch_queue_t concurrentQueue = dispatch_queue_create("hsa.barItem.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^{
        [self fetchHotBannersWithHandle:^(BOOL isSuccess) {
            __weak typeof(weakSelf)strongifySelf = weakSelf;
            dispatch_semaphore_signal(strongifySelf.semaphore);
        }];
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
        [self fetchHotServicesWithHandle:^(BOOL isSuccess) {
            __weak typeof(weakSelf)strongifySelf = weakSelf;
            dispatch_semaphore_signal(strongifySelf.semaphore);
        }];
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak typeof(weakSelf)strongifySelf = weakSelf;
            YLZLOG(@"请求完毕____");
        });
    });
}

- (void)fetchHotBannersWithHandle:(void(^)(BOOL isSucc))handle {
    sleep(3.0);
    YLZLOG(@"_______%@",NSStringFromSelector(_cmd));
    !handle ?: handle(YES);
}

- (void)fetchHotServicesWithHandle:(void(^)(BOOL isSucc))handle {
    sleep(2.0);
    YLZLOG(@"_______%@",NSStringFromSelector(_cmd));
    !handle ?: handle(YES);
}

#pragma mark - Example 2
#pragma mark -

- (void)excuteSerialQueue {
    dispatch_queue_t serialQueue = dispatch_queue_create("hsa_serial_queue",NULL);
    dispatch_async(serialQueue, ^{
        [self doTask];
        YLZLOG(@"Task1----------结束________%@",[NSThread currentThread]);
    });
    dispatch_async(serialQueue, ^{
        [self doTaskDelay];
        YLZLOG(@"Task2----------结束________%@",[NSThread currentThread]);
    });
    dispatch_async(serialQueue, ^{
        YLZLOG(@"请求完毕----------%@",[NSThread currentThread]);
    });
}

- (void)doTask {
    [self funcWithHandle:^(NSString *handleStr) {
        YLZLOG(@"doTask----------1");
    }];
}

- (void)doTaskDelay {
    sleep(3.0);
    for (int i=0; i<10; i++) {
        YLZLOG(@"doTaskDelay----------%d----------%@",i,[NSThread currentThread]);
    }
}

#pragma mark - Example 3
#pragma mark -

- (void)excuteQueueGroup {
//    YLZLOG(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
//    YLZLOG(@"group---begin");
//
//    dispatch_group_t group =  dispatch_group_create();
//    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        // 追加任务 1
//        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
//        YLZLOG(@"1---%@",[NSThread currentThread]);      // 打印当前线程
//    });
//
//    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        YLZLOG(@"2---%@",[NSThread currentThread]);      // 打印当前线程
//    });
//
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        YLZLOG(@"3---%@",[NSThread currentThread]);      // 打印当前线程
//        YLZLOG(@"group---end");
//    });
    
    YLZLOG(@"group---begin");
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:5];              // 模拟耗时操作
        YLZLOG(@"task1---%@",[NSThread currentThread]);      // 打印当前线程
        dispatch_group_leave(group);
    });
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        // 追加任务 2
        YLZLOG(@"task2---%@",[NSThread currentThread]);      // 打印当前线程
        dispatch_group_leave(group);
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        YLZLOG(@"task3---%@",[NSThread currentThread]);      // 打印当前线程
        YLZLOG(@"group---end");
    });
}

#pragma mark - IB-Action
#pragma mark -

- (void)btnOKClick {
//    YLZLOG(@"YYYYYYYYY_____%@",[@{@"homeModel":@"stone"} mj_JSONString]);
//    self.view.backgroundColor = [UIColor redColor];
//    [self requestWithParams:@{} withSuccessBlock:^(NSDictionary *object) {
//        NSLog(@"Success");
//    } withFailureBlock:^(NSError *error) {
//        NSLog(@"Failure");
//    }];
    FlutterEngine *flutterEngine =
            ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    FlutterViewController *flutterViewController =
        [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    __weak __typeof(self) weakSelf = self;
    
    NSString *channelName = @"hi_flutter_module_flutter_to_iOS";
    NSString *eventChannelName = @"hi_flutter_module_iOS_to_flutter";
    
    //FlutterMethodChannel是flutter页面主动交互iOS页面
    FlutterMethodChannel *methodChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterViewController.binaryMessenger];
    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:eventChannelName binaryMessenger:flutterViewController.binaryMessenger];
    [eventChannel setStreamHandler:self];
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        // call.method 获取 flutter 给回到的方法名，要匹配到 channelName 对应的多个 发送方法名，一般需要判断区分
        // call.arguments 获取到 flutter 给到的参数，（比如跳转到另一个页面所需要参数）
        // result 是给flutter的回调， 该回调只能使用一次
        YLZLOG(@"call.method=%@ \n call.arguments = %@", call.method, [call.arguments mj_JSONString]);
        //iOS给flutter返回值:
        if ([call.method isEqualToString:@"flutterIOSMethod"]) {
            if (result) {
                result(@{@"name": @"iOS 林磊 原生开发", @"age":@(27), @"certNo":@"362324199610016010"});
            }
        }
        if ([call.method isEqualToString:@"backToViewController"]) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
        if ([call.method isEqualToString:@"iOSFlutterMethodToPage"]) {
            YLZRouteCodeViewController *vc = [[YLZRouteCodeViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }];
    [self.navigationController pushViewController:flutterViewController animated:YES];
//    [self presentViewController:flutterViewController animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.view.backgroundColor = [UIColor greenColor];
}

- (void)requestWithParams:(id)params withSuccessBlock:(void(^)( NSDictionary * object))successBlock withFailureBlock:(void(^)( NSError *error))failureBlock {
    BOOL  isSucc = YES;
    if (isSucc) {
        !successBlock ?: successBlock(@{});
    } else {
        !failureBlock ?: failureBlock([[NSError alloc] init]);
    }
}

#pragma mark - Notice
#pragma mark -


#pragma mark - Delegate
#pragma mark -

//这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体。
- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events {
    if (events) {
        self.eventSink  = events;
        self.eventSink(@"原生push到flutter页面,传给flutter的值");
    }
    return nil;
}

// flutter不再接收
- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    return nil;
}

#pragma mark - lazy load
#pragma mark -

- (NSMutableArray *)homeModelArrays {
    if (!_homeModelArrays) {
        _homeModelArrays = [NSMutableArray array];
    }
    return _homeModelArrays;
}

- (UIButton *)btnOk
{
    if (!_btnOk) {
        _btnOk = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnOk setTitle:@"Objective-C 项目" forState:UIControlStateNormal];
        [_btnOk setTitleColor:YLZColorTitleOne forState:UIControlStateNormal];
        _btnOk.titleLabel.font = [YLZFont medium:16.f];
        _btnOk.layer.cornerRadius = 20.f;
        _btnOk.layer.masksToBounds = YES;
        _btnOk.layer.borderColor = [YLZColorBlue CGColor];
        _btnOk.layer.borderWidth = 0.5;
//        _btnOk.userInteractionEnabled = NO;
        [_btnOk addTarget:self action:@selector(btnOKClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnOk;
}

- (UIImageView *)iconImageView {
    if(_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = YLZColorLightBlueView;
        _iconImageView.layer.cornerRadius = 4.0;
        _iconImageView.layer.masksToBounds = YES;
    }
    return _iconImageView;
}

- (UILabel *)productLabel {
    if (!_productLabel) {
        _productLabel = [UILabel new];
        _productLabel.font = [YLZFont regular:14];
        _productLabel.textColor = YLZColorTitleOne;
        _productLabel.text = @"易联众（民生）框架";
    }
    return _productLabel;
}

- (UILabel *)bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = [UILabel new];
        _bottomLabel.font = [YLZFont regular:14];
        _bottomLabel.textColor = YLZColorTitleThree;
        _bottomLabel.text = @"Power By 许久_";
    }
    return _bottomLabel;
}

@end
