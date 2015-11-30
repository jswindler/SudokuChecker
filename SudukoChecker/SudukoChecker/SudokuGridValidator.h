//
//  SudokuGridValidator.h
//  SudukoChecker
//
//  Created by Joe Swindler on 9/30/15.
//  Copyright © 2015 Joe Swindler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwoDimensionalIntArray.h"

@interface SudokuGridValidator : NSObject

@property (nonatomic, strong) TwoDimensionalIntArray *sudokuGrid;

// Returns whether the given file is a valid sudoku grid
- (BOOL)isValidGridFile:(NSString *)filename;

// Loads the given sudoku grid file into memory. Returns YES on success or NO on error.
- (BOOL)loadGridFile:(NSString *)filename;

@end
