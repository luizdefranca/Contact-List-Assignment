//
//  InputCollector.m
//  Contact_List_Assignment
//
//  Created by Luiz on 4/30/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector
+(NSString *)inputForPrompt:(NSString *)promptString{
    NSLog(@"%@", promptString);
    char inputChar[255];
    
    fgets(inputChar, 255, stdin);
    NSString *response = [[NSString stringWithCString:inputChar
                                             encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceAndNewlineCharacterSet];
    return response;
}
@end
