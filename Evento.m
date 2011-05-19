//
//  Evento.m
//  Agendatech
//
//  Created by andersonleite on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Evento.h"


@implementation Evento
@synthesize nome,descricao;
- (id)initWithName:(NSString*)n descricao:(NSString*)desc {
	self.nome = n;
	self.descricao = desc;
	return self;
}

@end
