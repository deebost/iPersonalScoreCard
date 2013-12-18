//
//  NSString+split.m
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/17/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import "NSString+split.h"

@interface NSString (Split)
-(NSArray *)arrayBySplittingWithMaximumSize:(NSUInteger)size;
@end

@implementation NSString (Split)

-(NSArray *)arrayBySplittingWithMaximumSize:(NSUInteger)size
{
    NSMutableArray *letterArray = [NSMutableArray array];
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:(NSStringEnumerationByComposedCharacterSequences)
                          usingBlock:^(NSString *substring,
                                       NSRange substringRange,
                                       NSRange enclosingRange,
                                       BOOL *stop) {
                              [letterArray addObject:substring];
                          }];


    NSMutableArray *array = [NSMutableArray array];
    [letterArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx%size == 0) {
            [array addObject: [NSMutableString stringWithCapacity:size]];
        }
        NSMutableString *string = [array objectAtIndex:[array count]-1];
        [string appendString:obj];

    }];

    return array;
}

@end