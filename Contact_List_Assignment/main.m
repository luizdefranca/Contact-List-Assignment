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
        
        NSString *menuScreen = @"What would you like do next?\n"
        "new - Create a new contact\n"
        "list - List all contacts\n"
        "show - Show detail of contact\n"
        "find - Find contact with a name\n"
        "history - Print the 3 last commands\n"
        "quit - Exit Application >";
        InputCollector *input = [[InputCollector alloc]init];
        
        BOOL keepON = YES;
        ContactList *agenda = [[ContactList alloc] init];
        
        NSMutableDictionary *phoneList1 = [NSMutableDictionary dictionaryWithObjects: @[@"899879", @"78979"]forKeys: @[@"mobile", @"home"] ];
        Contact *contact1 = [[Contact alloc] initWithName:@"Paul" andPhone:phoneList1 Email: @"paul_luiz@gmail.com"];
        NSMutableDictionary *phoneList2 = [NSMutableDictionary dictionaryWithObjects: @[@"67868", @"686975", @"678682"]forKeys: @[@"mobile", @"home",  @"work" ]];
        Contact *contact2 = [[Contact alloc] initWithName:@"Luiz" andPhone:phoneList2 Email: @"luiz_paul@gmail.com"];
        NSMutableDictionary *phoneList3 = [NSMutableDictionary dictionaryWithObjects: @[@"123512", @"431", @"43134"]forKeys: @[@"mobile", @"home",  @"work" ]];
        Contact *contact3 = [[Contact alloc] initWithName:@"Ted" andPhone:phoneList3 Email:@"ted@gmail.com"];
        [agenda addContact:contact1];
        [agenda addContact:contact2];
        [agenda addContact:contact3];
        
        while (keepON) {
            NSString *option = [input  inputForPrompt:menuScreen];
            
            if ([option isEqualToString: @"quit"]) {
                keepON = NO;
                NSLog(@"%@", @"Hasta la vista!");
            } else if([option isEqualToString: @"new"]){
                
                NSString *email = [input  inputForPrompt:@"Email"];
                if( [agenda contactAlredyExistWithEmail: email]){
                    NSLog(@"%@", @"Contact alredy exists!!");
                    continue;
                }
                NSString *name = [input  inputForPrompt:@"Name: "];
                
                NSMutableDictionary *phoneList = [NSMutableDictionary dictionary];
                while (true) {
                    NSString *phoneDescription = phoneDescription = [input  inputForPrompt:@"Phone Description: \n Type return to finish"];
                    if([phoneDescription isEqualToString: @""]){
                        break;
                    }
                    NSString *phoneNumber = [input  inputForPrompt: @"Number: "];
                    
                    [phoneList setObject: phoneNumber forKey: phoneDescription];
                }
                
                
                Contact *contact = [[Contact alloc]initWithName:name andPhone:phoneList Email: email];
                [agenda addContact:contact];
                
                [input addHistory: @"new"];
            } else if ([option isEqualToString:@"list"]){
                [agenda listContact];
                [input addHistory:@"list"];
                
            } else if ([option isEqualToString:@"show"]){
                NSString *inputId = [input  inputForPrompt: @"Type the contact id:"];
                NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
                NSNumber *id = [formatter numberFromString:inputId];
                if (id != nil) {
                    
                    [agenda showContactWithNumber:  [id integerValue]];
                } else {
                    NSLog(@"%@", @"It's not a valid number id");
                }
                [input addHistory:@"show"];
                
            } else if ([option isEqualToString:@"find"]){
                NSString *name = [input  inputForPrompt: @"Type the contact name:"];
                [agenda findContactWithName: name];
                [input addHistory:@"find"];
                
            } else if ([option isEqualToString:@"history"]){
                [input printHistory];
            }
            
        }
        
    }
    return 0;
}
