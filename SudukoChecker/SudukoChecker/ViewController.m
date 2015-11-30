//
//  ViewController.m
//  SudukoChecker
//
//  Created by Joe Swindler on 9/29/15.
//  Copyright © 2015 Joe Swindler. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (NSString *)readFromStdin
{
  NSFileHandle *stdin = [NSFileHandle fileHandleWithStandardInput];
  NSData *data = [NSData dataWithData:[stdin readDataToEndOfFile]];
  NSString *dataString = [[NSString alloc] initWithData:data
                                               encoding:NSUTF8StringEncoding];
  [[NSFileHandle fileHandleWithStandardOutput]
   writeData:[dataString dataUsingEncoding:NSUTF8StringEncoding]];
  
  return dataString;
}

- (BOOL)isValidGrid:(NSString *)dataString
{
  //NSArray *data = [dataString componentsSeparatedByString:@";"];
  //int gridSize = ((NSNumber *)[data objectAtIndex:0]).intValue;
  //int grid[gridSize][gridSize];
  
  return NO;
}
/*
int main(int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    NSString *input = readFromStdin();
    
    
    [pool release];
    return 0;
  }*/

@end
