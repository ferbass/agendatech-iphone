//
//  RootViewController.h
//  Agendatech
//
//  Created by andersonleite on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventoViewController.h"
#import "EventosJsonParser.h"
#import "GruposJsonParser.h"
@interface RootViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITabBarDelegate> {
	EventoViewController *eventoView;
	NSDictionary *requestDictionary;
	NSArray *items;
	EventosJsonParser *eventosParser;
    GruposJsonParser *gruposParser;
	IBOutlet UITableView *table;
	IBOutlet UIView *loadView;
    int menuItem;
}

@end
