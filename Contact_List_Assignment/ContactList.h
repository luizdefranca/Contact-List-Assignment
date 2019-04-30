//
//  ContactList.h
//  Contact_List_Assignment
//
//  Created by Luiz on 4/30/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
NS_ASSUME_NONNULL_BEGIN

@interface ContactList : NSObject
@property NSMutableArray<Contact*> *list;
- (instancetype)init;
-(void)addContact:(Contact *)newContact;
-(void)listContact;
-(void)showContactWithNumber: (NSInteger) contactNumber;
-(void)findContactWithName: (NSString*) contactName;
@end

NS_ASSUME_NONNULL_END
