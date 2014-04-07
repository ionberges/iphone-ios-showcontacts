//
//  ListaContactosViewController.h
//  Contactos
//
//  Created by Macbook on 27/03/14.
//  Copyright (c) 2014 Macbook. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ListaContactosViewController : UITableViewController

@property (strong,nonatomic) NSArray *nombres;
@property (strong,nonatomic) NSArray *phones;
@property (strong,nonatomic) NSArray *enviado;


@end
