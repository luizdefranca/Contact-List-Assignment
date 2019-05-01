//
//  InputCollector.m
//  Contact_List_Assignment
//
//  Created by Luiz on 4/30/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (instancetype)init
{
    self = [super init];
    if (self) {
        _history = [NSMutableArray array];
    }
    return self;
}

-(NSString *)inputForPrompt:(NSString *)promptString{
    NSLog(@"%@", promptString);
    char inputChar[255];
    
    fgets(inputChar, 255, stdin);
    NSString *response = [[NSString stringWithCString:inputChar
                                             encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceAndNewlineCharacterSet];
    return response;
}



- (void) addHistory: (NSString*) h{
    
    if (_history.count >= 3) {
        [_history removeObjectAtIndex:0];
    }
    [_history addObject: h];
}

-(void) printHistory{
    NSMutableString *h = [NSMutableString string];
    
    for (NSString *log in _history) {
        [h appendFormat:@"\n%@", log ];
    }
    
    NSLog(@"%@", h);
}
@end
