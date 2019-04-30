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
@property NSArray<Contact*> *agenda;
@end

NS_ASSUME_NONNULL_END
