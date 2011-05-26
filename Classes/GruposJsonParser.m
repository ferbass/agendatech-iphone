//
//  GruposJsonParser.m
//  Agendatech
//
//  Created by Fernando Ribeiro on 23/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GruposJsonParser.h"
#import "NSDictionary_JSONExtensions.h"
#import "Grupo.h"

@implementation GruposJsonParser

-(NSArray*)gruposParser:(NSString*)request{
	NSError *theError = NULL;
	NSDictionary *dic = [NSDictionary dictionaryWithJSONString:request error:&theError];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (NSDictionary *_grupo in dic)
        {
		Grupo *grupo = [[Grupo alloc] initWithName:[[_grupo objectForKey:@"grupo"] valueForKey:@"nome"] site:[[_grupo objectForKey:@"grupo"] valueForKey:@"site"] logo:[[_grupo objectForKey:@"grupo"] valueForKey:@"logo"]];
		[arr addObject:grupo];
        }
    [dic release];
	return arr;
}

@end
