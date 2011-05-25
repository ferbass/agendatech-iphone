//
//  EventoViewController.h
//  Agendatech
//
//  Created by andersonleite on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Evento.h"

@interface EventoViewController : UIViewController <UIScrollViewDelegate>{
	Evento *evento;
	IBOutlet UILabel *nome;
	IBOutlet UILabel *data;
	IBOutlet UIWebView *descricao;
    IBOutlet UIScrollView *scroll;
}

@property(nonatomic, retain) Evento *evento;

@end
