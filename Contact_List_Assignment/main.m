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
        NSString static *menuScreen = @"What would you like do next?\n" "new - Create a new contact\n" "list - List all contacts\n" "show - Show detail of contact\n" "find - Find contact with a name\n" "quit - Exit Application > ";
        Contact *test = [[Contact alloc]initWithName:@"test" andPhone:@"6786"];
        NSLog(@"%@", test);
        
        BOOL keepON = YES;
        ContactList *agenda = [[ContactList alloc] init];
        
        Contact *contact1 = [[Contact alloc] initWithName:@"Paul" andPhone:@"678686868" Email: @"paul_luiz@gmail.com"];
        Contact *contact2 = [[Contact alloc] initWithName:@"Luiz" andPhone:@"7897979" Email: @"luiz_paul@gmail.com"];
        Contact *contact3 = [[Contact alloc] initWithName:@"Ted" andPhone:@"678686" Email:@"ted@gmail.com"];
        [agenda addContact:contact1];
        [agenda addContact:contact2];
        [agenda addContact:contact3];
        
        while (keepON) {
            NSString *option = [InputCollector inputForPrompt:menuScreen];
            
            if ([option isEqualToString: @"quit"]) {
                keepON = NO;
                NSLog(@"%@", @"Hasta la vista!");
            } else if([option isEqualToString: @"new"]){
                
                NSString *email = [InputCollector inputForPrompt:@"Email"];
                if( [agenda contactAlredyExistWithEmail: email]){
                    NSLog(@"%@", @"Contact alredy exists!!");
                    continue;
                }
                NSString *name = [InputCollector inputForPrompt:@"Name: "];
                NSString *phone = [InputCollector inputForPrompt:@"Phone: "];
             
                Contact *contact = [[Contact alloc]initWithName:name andPhone:phone Email: email];
                [agenda addContact:contact];
                
                
            } else if ([option isEqualToString:@"list"]){
                
                [agenda listContact];
            } else if ([option isEqualToString:@"show"]){
                NSString *inputId = [InputCollector inputForPrompt: @"Type the contact id:"];
                NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
                NSNumber *id = [formatter numberFromString:inputId];
                if (id != nil) {
                   
                    [agenda showContactWithNumber:  [id integerValue]];
                } else {
                    NSLog(@"%@", @"It's not a valid number id");
                }
            } else if ([option isEqualToString:@"find"]){
                NSString *name = [InputCollector inputForPrompt: @"Type the contact name:"];
                [agenda findContactWithName: name];
                
            }
        }

    }
    return 0;
}
