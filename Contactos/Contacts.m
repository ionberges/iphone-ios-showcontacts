//
//  Contacts.m
//  Contactos
//
//  Created by Macbook on 28/03/14.
//  Copyright (c) 2014 Macbook. All rights reserved.
//

#import "Contacts.h"

@implementation Contacts





//-(void)cargarFoto: completion:(cargarFotoCompletion)completion
-(void) myMethod:(myCompletion) compblock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^{
                       NSLog(@"ddds");
                       NSMutableArray *names= [[NSMutableArray alloc]init];
                       NSMutableArray *numbers= [[NSMutableArray alloc]init];
                       CFErrorRef *error = NULL;
                       ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
                       CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
                       CFIndex numberOfPeople = ABAddressBookGetPersonCount(addressBook);
                       
                       for(int i = 0; i < numberOfPeople; i++) {
                           
                           ABRecordRef person = CFArrayGetValueAtIndex( allPeople, i );
                           
                           NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonFirstNameProperty));
                           NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonLastNameProperty));
                           NSLog(@"Name:%@ %@", firstName, lastName);
                           //[self.names arrayByAddingObject:firstName];
                           [names addObject:firstName];
                           
                           ABMultiValueRef phoneNumbers = ABRecordCopyValue(person, kABPersonPhoneProperty);
                           for (CFIndex i = 0; i < 1; i++) {
                               // for (CFIndex i = 0; i < ABMultiValueGetCount(phoneNumbers); i++) {
                               NSString *phoneNumber = (__bridge_transfer NSString *) ABMultiValueCopyValueAtIndex(phoneNumbers, i);
                               NSLog(@"phone:%@", phoneNumber);
                               [numbers addObject:phoneNumber];
                               
                           }
                           
                           NSLog(@"=============================================");
                           
                       }
                       NSLog(@"array nombres %@",names);
                       NSLog(@"array phones %@",numbers);
                       
                       NSArray *scnArray = [[NSArray alloc] initWithObjects:names,numbers, nil];
                       
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^{
                                          //  self.fotos= [resultado valueForKey:@"photos"];
                                          compblock(scnArray);
                                      }
                                      );
                   }
                   );
    
}







- (void)peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker
{
    //[self dismissModalViewControllerAnimated:YES];
}


- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person {
    
  //  [self displayPerson:person];
   // [self dismissModalViewControllerAnimated:YES];
    
    return NO;
}

- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier
{
    return NO;
}



@end
