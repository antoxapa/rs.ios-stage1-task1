#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if (sadArray == [NSArray array]) {
        return sadArray;
    }
    
    NSMutableArray* reversedArray = [[[sadArray reverseObjectEnumerator] allObjects] mutableCopy];
    
    for (int i = 1; i < reversedArray.count - 1; i++) {
        if ([reversedArray[i] intValue] > [reversedArray[i+1] intValue] + [reversedArray[i-1] intValue]) {
            [reversedArray removeObjectAtIndex:i];
             i --;
        }
    }
    return [[[reversedArray reverseObjectEnumerator] allObjects]mutableCopy];
}

@end

