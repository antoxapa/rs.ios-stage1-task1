#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSMutableArray* sumArray = [[NSMutableArray alloc]initWithArray:array];
    NSMutableArray* resultArray = [NSMutableArray array];

    for (int i = 0; i<array.count; i++) {
        NSNumber * objectToRemove = sumArray[i];
        [sumArray removeObject:objectToRemove];
        NSNumber *sum = [sumArray valueForKeyPath:@"@sum.self"];
        [resultArray addObject:sum];
        [sumArray insertObject:objectToRemove atIndex:i];
    }
    NSNumber *minElemet = [resultArray valueForKeyPath:@"@min.self"];
    NSNumber *maxElemet = [resultArray valueForKeyPath:@"@max.self"];
    return @[minElemet, maxElemet];
}

@end
