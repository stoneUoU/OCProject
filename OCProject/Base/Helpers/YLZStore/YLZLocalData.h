//
//  YLZLocalData.h
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZLocalData : NSObject

/**
 *  保存到NSUserDefaults
 *
 *  @param object 保存内容
 *  @param key    保存Key
 */
+ (void)setObject:(NSObject *)object forKey:(NSString *)key;
/**
 *  获取保存的NSUserDefaults
 *
 *  @param key 保存的key
 *
 *  @return 保存的内容
 */
+ (id)objectForKey:(NSString *)key;

+ (BOOL)boolForKey:(NSString *)key;
+ (NSInteger)integerForKey:(NSString *)key;
+ (float)floatForKey:(NSString *)key;
+ (double)doubleForKey:(NSString *)key;

+ (void)setArchivedData:(id)data forKey:(NSString *)key;
+ (id)unarchiveObjectForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
