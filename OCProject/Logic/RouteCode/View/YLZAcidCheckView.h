//
//  YLZAcidCheckView.h
//  OCProject
//
//  Created by stone on 2022/8/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YLZAcidCheckViewDelegate <NSObject>

@optional

- (void)toExcute:(NSInteger )index;
    
@end

@interface YLZAcidCheckView : UIView

@property (nonatomic, strong) UITableView *tableView;
    
@property (nonatomic ,weak) id <YLZAcidCheckViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
