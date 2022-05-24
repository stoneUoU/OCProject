//
//  YLZFile.m
//  OCProject
//
//  Created by stone on 2022/2/10.
//

#import "YLZFile.h"

@implementation YLZFile

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.subFiles = [NSMutableArray array];
    }
    
    return self;
}

- (NSArray <YLZFile *> *)allFiles {
    
    NSMutableArray *subFiles = [NSMutableArray array];
    
    [self rootFile:self array:subFiles];
    
    return subFiles;
}

- (void)rootFile:(YLZFile *)file array:(NSMutableArray *)array {
    
    for (YLZFile *subFile in file.subFiles) {
        
        [array addObject:subFile];
        
        if (subFile.isDirectory) {
            
            [self rootFile:subFile array:array];
        }
    }
}

- (NSString *)description {

    return [NSString stringWithFormat:@"<%@ : %p> isDirectory[%@] isHiden[%@] %@",
            [self class],
            self,
            (_isDirectory == YES ? @"Y" : @"N"),
            (_isHiden == YES ? @"Y" : @"N"),
            _fileName];
}

@end

