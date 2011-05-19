//
//  EventoViewController.h
//  Agendatech
//
//  Created by andersonleite on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EventoViewController : UIViewController {
	IBOutlet UITextView *eventoDescricao;
	IBOutlet UITextView *eventoNome;
}
@property(nonatomic, retain) IBOutlet UITextView *eventoDescricao;
@property(nonatomic, retain) IBOutlet UITextView *eventoNome;

@end
