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

@interface RootViewController()
- (void)requestEvents;
- (void)requestDone:(ASIHTTPRequest *)request;
- (void)requestWentWrong:(ASIHTTPRequest *)request;
@end
@implementation RootViewController

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Agendatech";
	[self requestEvents];
}

- (void)requestEvents{
	NSURL *url = [NSURL URLWithString:EVENTOS_BASE_URL];
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
	[request setDelegate:self];
	[request setDidFinishSelector:@selector(requestDone:)];
	[request setDidFailSelector:@selector(requestWentWrong:)];
	[request startAsynchronous];
}

- (void)requestDone:(ASIHTTPRequest *)request
{
	genericJsonParser = [[GenericJsonParser alloc] init];
	eventos = [[NSMutableArray alloc] init];
	dicEventos = [genericJsonParser eventosParser:[request responseString]];
	
	for (NSDictionary *_evento in dicEventos)
	{
		Evento *evento = [[Evento alloc] initWithName:[[_evento objectForKey:@"evento"] valueForKey:@"nome"] descricao:[[_evento objectForKey:@"evento"] valueForKey:@"descricao"]];	
		NSLog(@"%@", evento.nome);
		[eventos addObject:evento];
	}
	[table reloadData];
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
	return [eventos count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	Evento *_evento = [eventos objectAtIndex:indexPath.row];
	NSLog(@"EVENTO %@", _evento.nome);
	[[cell textLabel] setText:_evento.nome];
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
	[dicEventos release];
	[eventos release];
	[genericJsonParser release];
    [super dealloc];
}


@end

