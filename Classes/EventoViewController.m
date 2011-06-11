//
//  EventoViewController.m
//  Agendatech
//
//  Created by andersonleite on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventoViewController.h"

@interface EventoViewController()
-(void)popularDados;
-(void)popularScrollView;
@end


@implementation EventoViewController
@synthesize	evento;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *barItem = [[[UIBarButtonItem alloc] initWithTitle:@"voltar" style:UIBarButtonItemStylePlain target:self action:@selector(voltar:)] autorelease];
	self.navigationItem.backBarButtonItem = barItem;
	[self popularDados];
}

-(void)voltar:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)popularDados{
	[nome setText:evento.nome];
	[data setText:evento.data];
	[descricao loadHTMLString:evento.descricao baseURL:nil];
    [self popularScrollView];
}

-(void)popularScrollView{
    for (int i = 0; i < [evento.euVou count]; i++){
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user.png"]];
        imageView.frame = CGRectMake(i*44, 0, 44, 44);
        [scroll addSubview:imageView];
        [imageView release];
    }
    scroll.contentSize = CGSizeMake(44 * [evento.euVou count],44);
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [scroll release];
    scroll = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[nome release];
	[descricao release];
    [scroll release];
    [super dealloc];
}


@end
