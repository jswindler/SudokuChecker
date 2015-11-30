//
//  SudokuGridValidatorTests.m
//  SudukoChecker
//
//  Created by Joe Swindler on 9/30/15.
//  Copyright © 2015 Joe Swindler. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SudokuGridValidator.h"

@interface SudokuGridValidatorTests : XCTestCase

@property (nonatomic, strong) SudokuGridValidator *gridValidator;

@end

@implementation SudokuGridValidatorTests

- (void)setUp {
  [super setUp];

  // Put setup code here. This method is called before the invocation of each test method in the class.
  self.gridValidator = [[SudokuGridValidator alloc] init];
}

- (void)tearDown {
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  self.gridValidator = nil;
  
  [super tearDown];
}

- (void)testFileLoad {
  XCTAssertTrue([self.gridValidator loadGridFile:@"grid-3x3.json"]);

  XCTAssertEqual([self.gridValidator.sudokuGrid valueForRow:0 column:0], 1);
  XCTAssertEqual([self.gridValidator.sudokuGrid valueForRow:0 column:1], 2);
  XCTAssertEqual([self.gridValidator.sudokuGrid valueForRow:0 column:2], 3);

  XCTAssertEqual([self.gridValidator.sudokuGrid valueForRow:1 column:0], 3);
  XCTAssertEqual([self.gridValidator.sudokuGrid valueForRow:1 column:1], 1);
  XCTAssertEqual([self.gridValidator.sudokuGrid valueForRow:1 column:2], 2);

  XCTAssertEqual([self.gridValidator.sudokuGrid valueForRow:2 column:0], 2);
  XCTAssertEqual([self.gridValidator.sudokuGrid valueForRow:2 column:1], 3);
  XCTAssertEqual([self.gridValidator.sudokuGrid valueForRow:2 column:2], 1);
}

- (void)testValidGrids {
  XCTAssertTrue([self.gridValidator isValidGridFile:@"grid-valid.json"]);
}

- (void)testInvalidGrids {
  XCTAssertFalse([self.gridValidator isValidGridFile:@"grid-3x3.json"]);
  XCTAssertFalse([self.gridValidator isValidGridFile:@"grid-invalid.json"]);
  XCTAssertFalse([self.gridValidator isValidGridFile:@"grid-invalid2.json"]);
  XCTAssertFalse([self.gridValidator isValidGridFile:@"grid-invalid3.json"]);
}

@end
