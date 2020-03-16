#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    NSMutableArray *arrayForSum = [[[NSArray alloc] initWithArray:bill] mutableCopy];
    [arrayForSum removeObjectAtIndex:index];
    NSNumber *correctSum = [arrayForSum valueForKeyPath:@"@sum.self"];
    int split = correctSum.intValue / 2;
    
    if (split == sum.intValue) {
        return @"Bon Appetit";
    }
    return [NSString stringWithFormat:@"%i", sum.intValue - (correctSum.intValue / 2)];;
}

@end
