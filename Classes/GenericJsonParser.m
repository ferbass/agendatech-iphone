//
//  GenericJsonParser.m
//  Agendatech
//
//  Created by Fernando Ribeiro on 5/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GenericJsonParser.h"
#import "NSDictionary_JSONExtensions.h"

@implementation GenericJsonParser

-(NSDictionary*)eventosParser:(NSString*)request{
	NSString *response = request;
	NSError *theError = NULL;
	NSDictionary *eventos = [NSDictionary dictionaryWithJSONString:response error:&theError];
	return eventos;
}

@end
