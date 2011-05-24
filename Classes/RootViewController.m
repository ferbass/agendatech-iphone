//
//  RootViewController.m
//  Agendatech
//
//  Created by andersonleite on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "AgendatechAppDelegate.h"
#import "ASIHTTPRequest.h"
#import "Evento.h"
#import "Grupo.h"
#import "EventoViewController.h"

@interface RootViewController()
- (void)request:(NSString*)url;
- (void)requestDone:(ASIHTTPRequest *)request;
- (void)requestWentWrong:(ASIHTTPRequest *)request;
- (void)loadItems;
@end
@implementation RootViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	[self request:EVENTOS_BASE_URL];
}

- (void)request:(NSString*)url{
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
	[request setDelegate:self];
	[request setDidFinishSelector:@selector(requestDone:)];
	[request setDidFailSelector:@selector(requestWentWrong:)];
	[request startAsynchronous];
}

- (void)requestDone:(ASIHTTPRequest *)request
{
    switch (menuItem) {
        case 0:
            eventosParser = [[EventosJsonParser alloc] init];
            items = [eventosParser eventosParser:[request responseString]];
            break;
        case 1:
            gruposParser = [[GruposJsonParser alloc] init];
            items = [gruposParser gruposParser:[request responseString]];
            break;
        default:
            break;
    }

    [self loadItems];
}

- (void)loadItems{
	[table reloadData];
	[loadView removeFromSuperview];
}

- (void)requestWentWrong:(ASIHTTPRequest *)request
{
	UIAlertView *err = [[UIAlertView alloc] initWithTitle:@"erro" message:[NSString stringWithFormat:@"erro ao carregar eventos %@", [request error]] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[err show];
	[err release];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [items count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    switch (menuItem) {
        case 0:
        {
            Evento *_evento = [items objectAtIndex:indexPath.row];
            [[cell textLabel] setText:_evento.nome];
        }
            break;
        case 1:
        {
            Grupo *_grupo = [items objectAtIndex:indexPath.row];
            [[cell textLabel] setText:_grupo.nome];
        }
            break;
        default:
            break;
    }
	
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (menuItem) {
        case 0:
        {
        EventoViewController *evento = [[[EventoViewController alloc] init] autorelease];
        evento.evento = [items objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:evento animated:YES];
        }
            break;
        case 1:
        {
        NSLog(@"TODO - Criar View de Grupos");
        }
        default:
            break;
    }

}

#pragma mark - 
#pragma mark Tab bar delegate

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    switch (item.tag) {
        case 0:
            menuItem = 0;
            [self.view addSubview:loadView];
            [self request:EVENTOS_BASE_URL];
            break;
        case 1:
            menuItem = 1;
            [self.view addSubview:loadView];
            [self request:URL_PARA_GRUPOS];
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[eventoView release];
    [gruposParser release];
    [eventosParser release];
	[requestDictionary release];
	[items release];
    [super dealloc];
}


@end

