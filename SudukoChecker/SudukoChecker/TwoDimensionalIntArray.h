//
//  TwoDimensionalIntArray.h
//  SudukoChecker
//
//  Created by Joe Swindler on 9/29/15.
//  Copyright © 2015 Joe Swindler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwoDimensionalIntArray : NSObject

@property (nonatomic, assign) NSInteger rowCount;
@property (nonatomic, assign) NSInteger columnCount;
@property (nonatomic, readonly) NSInteger count;

- (id)initWithRowCount:(NSInteger)rows columnCount:(NSInteger)columns;

- (NSInteger)valueForRow:(NSInteger)row column:(NSInteger)column;

// Returns YES if the value being set was out of bounds, or NO otherwise.
- (BOOL)setValue:(NSInteger)value forRow:(NSInteger)row andColumn:(NSInteger)column;

- (void)setValuesFromArray:(NSArray *)sourceArray;

@end
