//
//  TwoDimensionalIntArray.m
//  SudukoChecker
//
//  Created by Joe Swindler on 9/29/15.
//  Copyright © 2015 Joe Swindler. All rights reserved.
//

#import "TwoDimensionalIntArray.h"

@interface TwoDimensionalIntArray()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation TwoDimensionalIntArray

- (id)initWithRowCount:(NSInteger)rows columnCount:(NSInteger)columns {
  if (self = [super init]) {
    self.rowCount = rows;
    self.columnCount = columns;
    NSInteger capacity = rows * columns;
    self.dataArray = [NSMutableArray arrayWithCapacity:capacity];
    for (int i = 0; i < capacity; i++) {
      self.dataArray[i] = @0;
    }
  }
  
  return self;
}

- (BOOL)setValue:(NSInteger)value forRow:(NSInteger)row andColumn:(NSInteger)column {
  NSInteger adjustedIndex = [self indexFromRow:row column:column];
  if (adjustedIndex <= self.dataArray.count) {
    [self.dataArray replaceObjectAtIndex:adjustedIndex withObject:[NSNumber numberWithInteger:value]];
  }
  else {
    // out of bounds
    return YES;
  }
  
  return NO;
}

- (NSInteger)valueForRow:(NSInteger)row column:(NSInteger)column {
  NSInteger adjustedIndex = [self indexFromRow:row column:column];
  if (adjustedIndex >= self.dataArray.count) {
    // Could throw an exception here but I'd rather check this case with a unit test.
    return 0;
  }

  NSNumber *value = [self.dataArray objectAtIndex:adjustedIndex];
  return [value integerValue];
}

- (void)setValuesFromArray:(NSArray *)sourceArray {
  NSRange range;
  range.location = 0;
  NSInteger replaceCount = sourceArray.count;
  if (replaceCount > self.dataArray.count) {
    replaceCount = self.dataArray.count;
  }
  range.length = replaceCount;
  [self.dataArray replaceObjectsInRange:range withObjectsFromArray:sourceArray];
}

- (NSInteger)count {
  return self.dataArray.count;
}

- (NSInteger)indexFromRow:(NSInteger)row column:(NSInteger)column {
  return row * self.columnCount + column;
}

- (void)hi {
  NSString *hi;
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:values.count];
  fprintf(stdout, "%s", [myString cString]);
  
//  NSNumber *go = [NSNumber numberF
  NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
  [dictionary setObject:[NSNumber numberWithBool:YES] forKey:hi];
}

@end
