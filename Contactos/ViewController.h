//
//  ViewController.h
//  Contactos
//
//  Created by Macbook on 26/03/14.
//  Copyright (c) 2014 Macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>


@interface ViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate>


@property (strong,nonatomic) NSArray *namesList;
@property (strong,nonatomic) NSArray *enviado;

- (IBAction)showPicker:(id)sender;
typedef void(^myCompletion)(NSArray*);

-(void) myMethod:(myCompletion) compblock;

@end
