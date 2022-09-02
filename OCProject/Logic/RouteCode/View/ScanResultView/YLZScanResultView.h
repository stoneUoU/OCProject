//
//  YLZScanResultView.h
//  OCProject
//
//  Created by stone on 2022/9/2.
//

#import <UIKit/UIKit.h>

@protocol YLZScanResultViewDelegate <NSObject>

@optional

//声明代理方法
- (void)toExcute:(NSInteger )index;
//核酸检测+疫苗接种：
- (void)toRecord:(NSInteger )index;
//扫一扫：
- (void)toScan;
//点击查询行程卡：
- (void)toProcess;
    
@end
    
@interface YLZScanResultView : UIView {
}

@property (nonatomic, strong) UITableView *tableView;
    
@property (nonatomic ,weak) id <YLZScanResultViewDelegate> delegate;

@property (nonatomic, assign) BOOL isLoading;
    
@end
