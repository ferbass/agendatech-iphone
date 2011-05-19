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
	
}

@property(nonatomic, copy) NSString *nome;
@property(nonatomic, copy) NSString *descricao;

- (id)initWithName:(NSString*)n descricao:(NSString*)desc;


@end
