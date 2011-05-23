//
//  Evento.h
//  Agendatech
//
//  Created by andersonleite on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Evento : NSObject {

	NSString *nome;
	NSString *descricao;
	NSString *data;
	
}

@property(nonatomic, retain) NSString *nome;
@property(nonatomic, retain) NSString *descricao;
@property(nonatomic, retain) NSString *data;

- (id)initWithName:(NSString*)n descricao:(NSString*)desc data:(NSString*)d;


@end
