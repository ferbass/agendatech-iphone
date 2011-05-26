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
    NSString *logo;
    NSMutableArray *euVou;
}

@property(nonatomic, retain) NSString *nome;
@property(nonatomic, retain) NSString *descricao;
@property(nonatomic, retain) NSString *data;
@property(nonatomic, retain) NSString *logo;
@property(nonatomic, retain) NSMutableArray *euVou;
- (id)initWithName:(NSString*)n descricao:(NSString*)desc data:(NSString*)d logo:(NSString *)logo_evento euVou:(NSMutableArray*)eu_vou;


@end
