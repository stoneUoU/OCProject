//
//  ViewController.h
//  OCProject
//
//  Created by stone on 2021/5/24.
//

#import <UIKit/UIKit.h>
#import "YLZBaseViewController.h"

@interface ViewController : YLZBaseViewController

- (void)createPageViewControllerWithString:(NSString *)str relativeToURL:(NSURL *)url;

@end

