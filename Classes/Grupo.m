//
//  Grupo.m
//  Agendatech
//
//  Created by Fernando Ribeiro on 23/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Grupo.h"

@implementation Grupo

@synthesize nome,site,logo;

- (id)initWithName:(NSString*)n site:(NSString*)s logo:(NSString*)l{
	self.nome = n;
	self.site = s;
	self.logo = l;
	return self;
}

@end
