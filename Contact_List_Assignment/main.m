//
//  main.m
//  Contact_List_Assignment
//
//  Created by Luiz on 4/30/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        NSString static *menuScreen = @"What would you like do next?\n" "new - Create a new contact\n" "list - List all contacts\n" "quit - Exit Application > ";
        
        BOOL keepON = YES;
        
        
        while (keepON) {
            NSString *option = [InputCollector inputForPrompt:menuScreen];
            if ([option isEqualToString: @"quit"]) {
                keepON = NO;
            }
        }

    }
    return 0;
}
