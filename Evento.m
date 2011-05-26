//
//  Evento.m
//  Agendatech
//
//  Created by andersonleite on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Evento.h"


@implementation Evento
@synthesize nome,descricao,data, euVou, logo;
- (id)initWithName:(NSString*)n descricao:(NSString*)desc data:(NSString*)d logo:(NSString *)logo_evento euVou:(NSMutableArray*)eu_vou{
	self.nome = n;
	self.descricao = desc;
	self.data = d;
    self.logo = logo_evento;
    self.euVou = eu_vou;
	return self;
}

@end
