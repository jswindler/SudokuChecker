//
//  TwoDimensionalIntArrayTests.m
//  SudukoChecker
//
//  Created by Joe Swindler on 9/29/15.
//  Copyright © 2015 Joe Swindler. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TwoDimensionalIntArray.h"

#define kRowCount 3
#define kColumnCount 3

@interface TwoDimensionalIntArrayTests : XCTestCase

@property (nonatomic, strong) TwoDimensionalIntArray *twoDArray;
@property (nonatomic, strong) NSMutableArray *inputArray;

@end

@implementation TwoDimensionalIntArrayTests

- (void)setUp {
  [super setUp];

  // Put setup code here. This method is called before the invocation of each test method in the class.
  self.twoDArray = [[TwoDimensionalIntArray alloc] initWithRowCount:kRowCount columnCount:kColumnCount];

  // init with all zeros
  self.inputArray = [NSMutableArray array];
  for (int i = 0; i < kRowCount * kColumnCount; i++) {
    [self.inputArray addObject:@0];
  }
}

- (void)tearDown {
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  self.twoDArray = nil;
  self.inputArray = nil;
  
  [super tearDown];
}

- (void)testCheckSize {
  XCTAssertEqual(kColumnCount, self.twoDArray.columnCount);
  XCTAssertEqual(kRowCount, self.twoDArray.rowCount);
  XCTAssertEqual(self.twoDArray.count, self.twoDArray.rowCount * self.twoDArray.columnCount);
}

- (void)testCheckSizeLimit {
  // out of row bounds test
  [self testCheckSize];
  [self.twoDArray setValue:5 forRow:self.twoDArray.rowCount + 1 andColumn:0];
  [self testCheckSize];

  // out of column bounds test
  [self testCheckSize];
  [self.twoDArray setValue:5 forRow:0 andColumn:self.twoDArray.columnCount + 1];
  [self testCheckSize];
}

- (void)testSetEachValue {
  NSInteger setValue = 3;
  for (int row = 0; row < self.twoDArray.rowCount; row++) {
    for (int column = 0; column < self.twoDArray.columnCount; column++) {
      XCTAssertEqual([self.twoDArray valueForRow:row column:column], 0);
      [self.twoDArray setValue:setValue forRow:row andColumn:column];
      XCTAssertEqual([self.twoDArray valueForRow:row column:column], setValue);
    }
  }
}

@end
