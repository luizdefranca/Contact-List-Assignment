//
//  InputCollector.h
//  Contact_List_Assignment
//
//  Created by Luiz on 4/30/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputCollector : NSObject

@property (nonatomic) NSMutableArray* history;
-(NSString *)inputForPrompt:(NSString *)promptString;
-(void) printHistory;
- (void) addHistory: (NSString*) h;
@end

NS_ASSUME_NONNULL_END
