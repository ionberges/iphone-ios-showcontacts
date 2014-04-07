//
//  ListaContactosViewController.m
//  Contactos
//
//  Created by Macbook on 27/03/14.
//  Copyright (c) 2014 Macbook. All rights reserved.
//

#import "ListaContactosViewController.h"



@interface ListaContactosViewController ()

@end

@implementation ListaContactosViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [_nombres count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
  
	cell.textLabel.text = [self.nombres objectAtIndex:indexPath.row];
	cell.detailTextLabel.text = [self.phones objectAtIndex:indexPath.row];
	
    
    return cell;
}



@end
