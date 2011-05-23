//
//  RootViewController.h
//  Agendatech
//
//  Created by andersonleite on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventoViewController.h"
#import "GenericJsonParser.h"

@interface RootViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	EventoViewController *eventoView;
	NSDictionary *dicEventos;
	NSMutableArray *eventos;
	GenericJsonParser *genericJsonParser;
	IBOutlet UITableView *table;
}

@end
