//
//  YLZVaccineFetchView.h
//  OCProject
//
//  Created by stone on 2022/9/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YLZVaccineFetchViewDelegate <NSObject>

@optional

- (void)toExcute:(NSInteger )index;
    
@end

@interface YLZVaccineFetchView : UIView

@property (nonatomic, strong) UITableView *tableView;
    
@property (nonatomic ,weak) id <YLZVaccineFetchViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
