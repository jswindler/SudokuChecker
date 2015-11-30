//
//  SudokuGridValidator.m
//  SudukoChecker
//
//  Created by Joe Swindler on 9/30/15.
//  Copyright © 2015 Joe Swindler. All rights reserved.
//

#import "SudokuGridValidator.h"

#define kSudokuRowTotal 9

@interface SudokuGridValidator()

@end

@implementation SudokuGridValidator

- (id)init {
  if (self = [super init]) {
  }
  
  return self;
}

- (BOOL)isValidGridFile:(NSString *)filename {
  NSLog(@"\n\nOpening file %@", filename);
  if ([self loadGridFile:filename]) {
    // File was loaded so check the size and see if each row, column, and subgrid
    // look valid according to sudoku rules.
    if ((self.sudokuGrid.rowCount == kSudokuRowTotal) &&
        (self.sudokuGrid.columnCount == kSudokuRowTotal) &&
        [self hasValidRows] &&
        [self hasValidColumns] &&
        [self hasValidSubGrids]) {
      NSLog(@"Valid Sudoku grid!");
      return YES;
    }
  }

  return NO;
}

- (BOOL)hasValidRows {
  for (int i = 0; i < self.sudokuGrid.rowCount; i++) {
    if (![self isValidRow:i]) {
      NSLog(@"Invalid row %d", i);
      return NO;
    }
  }
  
  return YES;
}

- (BOOL)isValidRow:(NSInteger)row {
  NSMutableArray *found = [self createArrayOfZeros];
  for (int column = 0; column < self.sudokuGrid.columnCount; column++) {
    [self setArrayValue:found fromRow:row andColumn:column];
  }
  
  return [self hasCorrectValues:found];
}

- (BOOL)hasValidColumns {
  for (int i = 0; i < self.sudokuGrid.columnCount; i++) {
    if (![self isValidColumn:i]) {
      NSLog(@"Invalid column %d", i);
      return NO;
    }
  }

  return YES;
}

- (BOOL)isValidColumn:(NSInteger)column {
  NSMutableArray *found = [self createArrayOfZeros];
  for (int row = 0; row < self.sudokuGrid.rowCount; row++) {
    [self setArrayValue:found fromRow:row andColumn:column];
  }
  
  return [self hasCorrectValues:found];
}

- (BOOL)hasValidSubGrids {
  for (int row = 0; row < self.sudokuGrid.rowCount; row += 3) {
    for (int column = 0; column < self.sudokuGrid.columnCount; column += 3) {
      if (![self isValidSubGridForRow:row column:column]) {
        NSLog(@"Invalid subgrid at row %d, column %d", row, column);
        return NO;
      }
    }
  }
  
  return YES;
}

// Pass in the top left slot of each sub grid
- (BOOL)isValidSubGridForRow:(NSInteger)firstSubgridRow column:(NSInteger)firstSubgridColumn {
  NSMutableArray *found = [self createArrayOfZeros];
  for (NSInteger row = firstSubgridRow; row < firstSubgridRow + 3; row++) {
    for (NSInteger column = firstSubgridColumn; column < firstSubgridColumn + 3; column++) {
      [self setArrayValue:found fromRow:row andColumn:column];
    }
  }
  
  return [self hasCorrectValues:found];
}

- (NSMutableArray *)createArrayOfZeros {
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:kSudokuRowTotal];
  for (NSInteger i = 0; i < kSudokuRowTotal; i++) {
    array[i] = @0;
  }
  
  return array;
}

- (void)setArrayValue:(NSMutableArray *)array fromRow:(NSInteger)row andColumn:(NSInteger)column {
  NSInteger value = [self.sudokuGrid valueForRow:row column:column];
  array[value - 1] = @1;
}

- (BOOL)hasCorrectValues:(NSArray *)values {
  for (NSInteger i = 0; i < values.count; i++) {
    if (((NSNumber *)[values objectAtIndex:i]).integerValue != 1) {
      return NO;
    }
  }
  
  return YES;
}

- (BOOL)loadGridFile:(NSString *)filename {
  NSString *path = [[NSBundle mainBundle] pathForResource:[filename stringByDeletingPathExtension] ofType:[filename pathExtension]];
  NSData* fileData = [NSData dataWithContentsOfFile:path];
  NSError* error = nil;
  NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:fileData
                                                      options:kNilOptions
                                                        error:&error];
  if (error != nil) {
    NSLog(@"Error loading file.");
    return NO;
  }
  
  NSArray *dataArray = [jsonDict objectForKey:@"items"];
  if (dataArray == nil || dataArray.count == 0) {
    NSLog(@"Invalid grid size.");
    return NO;
  }
  
  // get number of rows & columns
  NSInteger rows = dataArray.count;
  NSInteger columns = ((NSArray *)dataArray.firstObject).count;
  self.sudokuGrid = [[TwoDimensionalIntArray alloc] initWithRowCount:rows columnCount:columns];
  
  int row = 0;
  for (NSArray *rowArray in dataArray) {
    int column = 0;
    for (NSNumber *value in rowArray) {
      [self.sudokuGrid setValue:value.integerValue forRow:row andColumn:column];
      column++;
    }
    row++;
  }
  
  return YES;
}

@end
