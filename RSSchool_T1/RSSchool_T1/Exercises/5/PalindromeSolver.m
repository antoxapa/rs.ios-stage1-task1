#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    
    NSString *resultString = s;
    NSMutableArray *changedIndexes = [NSMutableArray array];
    
    
    int halfRange = (n.intValue / 2);
    int numberOfChangesLeft = k.intValue;
    
    if (n.intValue % 2 != 0) {
        return @"-1";
    }
    
    for (int i = 0; i < halfRange; i++) {
        int j = n.intValue - i - 1;
        
        int firstHalfItem = [resultString substringWithRange:NSMakeRange(i, 1)].intValue;
        int secondHalfItem = [resultString substringWithRange:NSMakeRange(j, 1)].intValue;
        
        if ([resultString characterAtIndex:i] != [resultString characterAtIndex:j]) {
            if ([resultString characterAtIndex:i] > [resultString characterAtIndex:j]) {
                resultString = [resultString stringByReplacingCharactersInRange:NSMakeRange(j, 1) withString:[@(firstHalfItem) stringValue]];
                numberOfChangesLeft--;
                [changedIndexes addObject:@(j)];
            } else {
                resultString = [resultString stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:[@(secondHalfItem) stringValue]];
                numberOfChangesLeft--;
                [changedIndexes addObject:@(i)];
            }
        }
    }
    if (numberOfChangesLeft < 0) {
        return @"-1";
    }
    
    for (int i = 0; i<halfRange;i++){
        int j = n.intValue - i - 1;
        
        if (numberOfChangesLeft == 1) {
            int firstHalfMin = [[changedIndexes valueForKeyPath:@"@min.self"] intValue];
            int secondHalfMin = n.intValue - firstHalfMin - 1;
            resultString = [resultString stringByReplacingCharactersInRange:NSMakeRange(firstHalfMin, 1) withString:@"9"];
            resultString = [resultString stringByReplacingCharactersInRange:NSMakeRange(secondHalfMin, 1) withString:@"9"];
            return resultString;
        }
        
        if (numberOfChangesLeft == 0) {
            return resultString;
        } else if (numberOfChangesLeft < 0) {
            return @"-1";
        }
        
        int firstHalfItem = [resultString substringWithRange:NSMakeRange(i, 1)].intValue;
        int secondHalfItem = [resultString substringWithRange:NSMakeRange(j, 1)].intValue;
        
        resultString = [resultString stringByReplacingCharactersInRange:NSMakeRange(firstHalfItem, 1) withString:@"9"];
        resultString = [resultString stringByReplacingCharactersInRange:NSMakeRange(secondHalfItem, 1) withString:@"9"];
        numberOfChangesLeft--;
        numberOfChangesLeft--;
    }
    return @"-1";
}

@end
