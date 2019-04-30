//
//  ContactList.m
//  Contact_List_Assignment
//
//  Created by Luiz on 4/30/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList
- (instancetype)init
{
    self = [super init];
    if (self) {
        _list = [[NSMutableArray alloc]init];
    }
    return self;
}
-(void)addContact:(Contact *)newContact{
    
    [_list addObject: newContact];
    NSInteger index = [_list indexOfObject:newContact];
    NSLog(@"Your new contact\n name: %@\n Created", [_list[index] name]);
}
-(void)listContact{
    NSMutableString *contactList = [NSMutableString string];
    [_list enumerateObjectsUsingBlock:^(Contact * contact, NSUInteger idx, BOOL * stop) {
        
        [contactList appendFormat: @"\r%lu :", idx];
        NSString *name = [contact name];
        [contactList appendFormat: @"%@ \n", name];
    }];
    NSLog(@"Your contact list is: \n %@", contactList);
}

-(void)showContactWithNumber: (NSInteger) contactId{
    if (contactId < _list.count) {
        Contact *contact = [_list objectAtIndex: contactId];
        NSLog(@"%@", contact);
    }
}

-(void)findContactWithName: (NSString*) contactName{
    for (Contact *contact in _list) {
        if([contact containName: contactName]){
            NSLog(@"%@", contact);
        }
    }
}

- (BOOL) contactAlredyExistWithEmail: (NSString*) email{
    for (Contact *contact in _list) {
        if([[contact email] isEqualToString: email]){
            return YES;
        }
    }
    return NO;
}
@end
