#import <Foundation/Foundation.h>

@interface Parser : NSObject

- (NSArray <NSString*>*)parseString: (NSString*)string;

@end


//- (void)cycle:(NSString*)string resultArray:(NSMutableArray *)result {
//    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:patter1 options:0 error:nil];
//    NSRange searchedRange = NSMakeRange(0, [string length]);
//
//    NSArray *matches = [regex matchesInString:string options:0 range:searchedRange];
//
//    for (NSTextCheckingResult *match in matches) {
//        NSRange matchRange = [match range];
//
//        NSMutableString *substring1 = [[string substringWithRange:matchRange] mutableCopy];
//        NSMutableString *substringToAdd = [[string substringWithRange:matchRange] mutableCopy];
//
//        NSRange firstElementRange = NSMakeRange(0, 1);
//        NSRange secondElementRange = NSMakeRange([substring1 length]-1, 1);
//        NSRange secondElementRangeToAdd = NSMakeRange([substringToAdd length]-2, 1);
//
//        [substring1 deleteCharactersInRange:secondElementRange];
//        [substringToAdd deleteCharactersInRange:firstElementRange];
//        [substringToAdd deleteCharactersInRange:secondElementRangeToAdd];
//
//       if (![result containsObject:substringToAdd]) {
//            [result addObject:substringToAdd];
//        }
//        [self cycle:substring1 resultArray:result];
//
//    }
//        NSRegularExpression *regex1 = [NSRegularExpression regularExpressionWithPattern:patter options:0 error:nil];
//        NSArray *matches1 = [regex1 matchesInString:string options:0 range:searchedRange];
//        for (NSTextCheckingResult *match in matches1) {
//
//            NSRange matchRange = [match range];
//            NSMutableString *substring2 = [[string substringWithRange:matchRange] mutableCopy];
//            NSRange firstElementRange = NSMakeRange(0, 1);
//            NSRange secondElementRange = NSMakeRange([substring2 length]-2, 1);
//            [substring2 deleteCharactersInRange:firstElementRange];
//            [substring2 deleteCharactersInRange:secondElementRange];
//
//            if (![result containsObject:substring2]) {
//                [result addObject:substring2];
//            }
//            [self cycle:substring2 resultArray:result];
//        }
