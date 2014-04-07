//
//  Contacts.h
//  Contactos
//
//  Created by Macbook on 28/03/14.
//  Copyright (c) 2014 Macbook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBookUI/AddressBookUI.h>

@interface Contacts : NSObject <ABPeoplePickerNavigationControllerDelegate>



@property (strong,nonatomic) NSArray *namesList;
@property (strong,nonatomic) NSArray *enviado;

typedef void(^myCompletion)(NSArray*);

//typedef void(^cargarFotoCompletion)(NSArray *);

//-(void)cargarFoto: completion:(myCompletion)completion;
-(void) myMethod:(myCompletion) compblock;



@end
