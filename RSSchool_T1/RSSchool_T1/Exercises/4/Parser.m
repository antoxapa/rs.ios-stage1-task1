#import "Parser.h"

//static  NSString *patter = @"<[^>]*>|\\[.*?\\]|\\(.*?\\)";
//static NSString *patter1 = @"\\<.*\\>|\\[.*?\\]|\\(.*?\\)";

//@interface Bracket : NSObject {
//
//}
//@property (nonatomic, assign) NSString *bracket;
//@property (nonatomic, assign) int index;
//@end
//
//@implementation Bracket
//- (id)initWithInfo:(NSString*)bracket andIndex:(int)index {
//    self = [super init];
//    if (self) {
//        _bracket = bracket;
//        _index = index;
//
//    }
//    return self;
//}

//@end

//@interface Result : NSObject {
//
//}
//@property (nonatomic, assign) NSString *value;
//@property (nonatomic, assign) int priority;
//@end
//
//@implementation Result
//- (id)initWithInfo:(NSString*)value lastIndex:(int)priority {
//    self = [super init];
//    if (self) {
//        _value = value;
//        _priority = priority;
//
//    }
//    return self;
//}
//
//@end

@interface Parser ()
//
- (void)cycle:(NSString*)string resultArray:(NSMutableArray*)result;
@end

@implementation Parser



// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
//    NSMutableArray *zaebalo = [[NSArray array]mutableCopy];
////    self.thePassages = [NSMutableArray arrayWithCapacity:0];
//    NSMutableArray *stack = [NSMutableArray array];
//    NSMutableArray <Result*> *resultArray = [NSMutableArray arrayWithCapacity:0];
//    NSMutableDictionary *bracketMap = [[[NSDictionary alloc]initWithObjectsAndKeys:@">", @"<", @")", @"(",@"]",@"[", nil] mutableCopy];
//
////    if ([openBrackets rangeOfString:openBracket].location !=NSNotFound)
//
//    for (NSString *key in bracketMap.allKeys) {
//        NSString *openBracketSymbol = key;
//        NSString *closeBracketSymbol = bracketMap[key];
//        for (int i = 0; i<string.length;i++) {
//
//            NSString *symbol = [string substringWithRange:NSMakeRange(i, 1)];
//
//            if ([symbol isEqualToString:openBracketSymbol]) {
//                int index = i + 1;
//                NSObject *bracket = [[Bracket alloc] initWithInfo:openBracketSymbol andIndex:index];
//                [stack addObject:bracket];
//
//            } else if ([symbol isEqualToString:closeBracketSymbol]) {
//                Bracket *lastObject = stack.lastObject;
//                if ([lastObject.bracket isEqualToString:openBracketSymbol]) {
//                    NSString *resultString = [string substringWithRange:NSMakeRange(lastObject.index, i-lastObject.index)];
//                    Result *result = [[Result alloc]initWithInfo:resultString lastIndex:lastObject.index];
//
//                    [resultArray addObject: result];
////                    if (resultArray.count >= 2) {
////                    }
//                    [stack removeObject:lastObject];
//                }
//            }
//        }
//    }
//    NSArray *arrayToSort = resultArray ;
//                                                NSComparisonResult (^sortBlock)(Result*, Result*) = ^(Result *obj1, Result *obj2)
//                                               {
//                                                   if ([obj1 priority] > [obj2 priority])
//                                                   {
//                                                       return (NSComparisonResult)NSOrderedDescending;
//                                                   }
//                                                   if ([obj1 priority] < [obj2 priority])
//                                                   {
//                                                       return (NSComparisonResult)NSOrderedAscending;
//                                                   }
//                                                   return (NSComparisonResult)NSOrderedSame;
//                                               };
//
//                                               NSArray<Result*> *sorted = [arrayToSort sortedArrayUsingComparator:sortBlock];
//                                                   for (int i=0; i<4;i++) {
//                                                       [zaebalo addObject:sorted[i].value];
//                                                   }
//    return zaebalo;
//}




    NSString *resultString = string;
    NSMutableArray *result = [NSMutableArray array];
    NSUInteger length = string.length;

    NSString *openBrackets = @"<[(";
    //    NSString *closeBrackets = @">])";
    //    NSMutableDictionary *scopes = [[NSMutableDictionary dictionary]mutableCopy];
    for (int i=0;i<length;i++){
        NSString *openBracket = [resultString substringWithRange:NSMakeRange(i, 1)];

        if ([openBrackets rangeOfString:openBracket].location !=NSNotFound) {

            int closeBracketIndex = [self getCloseBrackerIndex:resultString openBracket:openBracket startIndex:i];

            NSRange start = [resultString rangeOfString:openBracket];
            NSRange end = NSMakeRange(closeBracketIndex, 1);

            NSString *stringToAdd = [string substringWithRange:NSMakeRange(start.location+1, end.location - (start.location+1))];
            [result addObject:stringToAdd];

            resultString = [resultString stringByReplacingCharactersInRange:start withString: @" "];
            resultString = [resultString stringByReplacingCharactersInRange:end withString: @" "];
        }
    }
    return result;
}

- (int)getCloseBrackerIndex: (NSString*)string openBracket:(NSString*)openBracket startIndex: (int)startIndex {

    NSString *closeBracket = @"";
               if ([openBracket isEqualToString:@"<"]) {
                   closeBracket = @">";
               } else if ([openBracket isEqualToString:@"["]) {
                   closeBracket = @"]";
               } else if ([openBracket isEqualToString:@"("]) {
                   closeBracket = @")";
               }

    int scopesCount = 0;

    for (int j = startIndex; j<string.length; j++) {

        NSString *currentSymbol = [string substringWithRange:NSMakeRange(j, 1)];

        if ([currentSymbol isEqualToString: openBracket]) {
            scopesCount++;
        } else if ([currentSymbol isEqualToString:closeBracket]) {
            scopesCount--;
        }
        if (scopesCount == 0) {
            return j;
        }
    }
return 0;
}


@end
