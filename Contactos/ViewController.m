//
//  ViewController.m
//  Contactos
//
//  Created by Macbook on 26/03/14.
//  Copyright (c) 2014 Macbook. All rights reserved.
//

#import "ViewController.h"
#import "ListaContactosViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
   

   [self myMethod:^(NSArray *data) {
        
        self.enviado=[[NSArray alloc]initWithArray:data];
         [self performSegueWithIdentifier:@"mostrarlista" sender:self];
    }];
  
   
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showPicker:(UIButton *)sender {
    
}



-(void) myMethod:(myCompletion) compblock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^{
                       
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
                           
                           [names addObject:firstName];
                           
                           ABMultiValueRef phoneNumbers = ABRecordCopyValue(person, kABPersonPhoneProperty);
                           for (CFIndex i = 0; i < 1; i++) {
                             
                               NSString *phoneNumber = (__bridge_transfer NSString *) ABMultiValueCopyValueAtIndex(phoneNumbers, i);
                            
                               [numbers addObject:phoneNumber];
                               
                           }
                           
                      
                           
                       }
                     
                       
                       NSArray *scnArray = [[NSArray alloc] initWithObjects:names,numbers, nil];
                       
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^{
                                  
                                          compblock(scnArray);
                                      }
                                      );
                   }
                   );

}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  
 
    if([[segue identifier] isEqualToString:@"mostrarlista"])
    {
  
       
            ListaContactosViewController *lista = [segue destinationViewController];
            lista.nombres=self.enviado[0];
            lista.phones=self.enviado[1];
            
  
    }
  
}



-(void)displayData
{
    
        NSMutableArray *allContacts = [[NSMutableArray alloc] init];
    
    // Build a predicate that searches for contacts with at least one phone number starting with (408).
    NSPredicate* predicate = [NSPredicate predicateWithBlock: ^(id record, NSDictionary* bindings) {
        ABMultiValueRef phoneNumbers = ABRecordCopyValue( (__bridge ABRecordRef)record, kABPersonPhoneProperty);
        BOOL result = NO;
      
        
        for (CFIndex i = 0; i < ABMultiValueGetCount(phoneNumbers); i++) {
            NSString* phoneNumber = (__bridge_transfer NSString*) ABMultiValueCopyValueAtIndex(phoneNumbers, i);
            
            NSLog(@"num:");
          
        }
        
        CFRelease(phoneNumbers);
        return result;
    }];
    NSArray* filteredContacts = [allContacts filteredArrayUsingPredicate:predicate];
    NSLog(@"array %@",filteredContacts);
    
    
}




- (void)peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker
{
    [self dismissModalViewControllerAnimated:YES];
}


- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person {
    
  
    [self dismissModalViewControllerAnimated:YES];
    
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
