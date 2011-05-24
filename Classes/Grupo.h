//
//  Grupo.h
//  Agendatech
//
//  Created by Fernando Ribeiro on 23/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Grupo : NSObject {
    NSString *nome;
	NSString *site;
	NSString *logo;
}

@property(nonatomic, retain) NSString *nome;
@property(nonatomic, retain) NSString *site;
@property(nonatomic, retain) NSString *logo;

- (id)initWithName:(NSString*)n site:(NSString*)s logo:(NSString*)l;

@end
