//
//  RootViewController.h
//  Agendatech
//
//  Created by andersonleite on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventoViewController.h"

@interface RootViewController : UITableViewController {
	EventoViewController *eventoView;
	NSDictionary *eventos;
}

@end
