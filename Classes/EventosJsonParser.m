//
//  EventosJsonParser.m
//  Agendatech
//
//  Created by Fernando Ribeiro on 23/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventosJsonParser.h"
#import "NSDictionary_JSONExtensions.h"
#import "Evento.h"

@implementation EventosJsonParser

-(NSArray*)eventosParser:(NSString*)request{
    NSLog(@"request");
	NSError *theError = NULL;
	NSDictionary *dic = [NSDictionary dictionaryWithJSONString:request error:&theError];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (NSDictionary *_evento in dic)
        {
		Evento *evento = [[Evento alloc] initWithName:[[_evento objectForKey:@"evento"] valueForKey:@"nome"] descricao:[[_evento objectForKey:@"evento"] valueForKey:@"descricao"] data:[[_evento objectForKey:@"evento"] valueForKey:@"data"]];
        NSLog(@"NOME %@", evento.nome);
		[arr addObject:evento];
        }
	return arr;
}

@end
