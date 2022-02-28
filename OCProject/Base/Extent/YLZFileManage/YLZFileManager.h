//
//  YLZFileManager.h
//  OCProject
//
//  Created by stone on 2022/2/10.
//

#import <Foundation/Foundation.h>
#import "YLZFile.h"

@interface YLZFileManager : NSObject

/**
 *  Get the file at the related file path.
 *
 *  @param relativeFilePath Relative file path, "~" means sandbox root, "-" means bundle file root.
 *  @param maxTreeLevel     Scan level.
 *
 *  @return File.
 */
+ (YLZFile *)scanRelativeFilePath:(NSString *)relativeFilePath maxTreeLevel:(NSInteger)maxTreeLevel;

/**
 *  Transform related file path to real file path.
 *
 *  @param relativeFilePath Relative file path, "~" means sandbox root, "-" means bundle file root.
 *
 *  @return The real file path.
 */
+ (NSString *)absoluteFilePathFromRelativeFilePath:(NSString *)relativeFilePath;

/**
 *  Get the bundle file path by the bundle file name.
 *
 *  @param name Bundle file name.
 *
 *  @return Bundle file path.
 */
+ (NSString *)bundleFileWithName:(NSString *)name;

/**
 *  To check the file at the given file path exist or not.
 *
 *  @param absoluteFilePath The real file path.
 *
 *  @return Exist or not.
 */
+ (BOOL)fileExistWithAbsoluteFilePath:(NSString *)absoluteFilePath;

@end

/**
 *  Transform related file path to real file path.
 *
 *  @param relativeFilePath Relative file path, "~" means sandbox root, "-" means bundle file root.
 *
 *  @return The real file path.
 */
NS_INLINE NSString *absoluteFilePathFrom(NSString * relativeFilePath) {
    
    return [YLZFileManager absoluteFilePathFromRelativeFilePath:relativeFilePath];
}


