//
//  YLZJsonHelper.m
//  YLZ-Kit-iOS
//
//  Created by stone on 2021/1/7.
//

#import "YLZJsonHelper.h"

@implementation YLZJsonHelper

//解析Json:
+ (NSDictionary * )ylz_loadHostFileWithName:(NSString *)name {
    NSError *error = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSDictionary *jsonDictonary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"read host json failed !!!!!!!!!");
    }
    return jsonDictonary;
}

@end
