//
//  YLZPlaceHolderTextView.h
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZPlaceHolderTextView : UITextView

@property (nonatomic, strong) NSString *placeholder;

@property (nonatomic, strong) UIColor *placeholderColor;

@property(nonatomic,assign)BOOL isNoInsertLeft;

-(void)textChanged:(NSNotification*)notification;

@end

NS_ASSUME_NONNULL_END
