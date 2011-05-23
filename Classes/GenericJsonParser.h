//
//  GenericJsonParser.h
//  Agendatech
//
//  Created by Fernando Ribeiro on 5/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GenericJsonParser : NSObject {

}

-(NSDictionary*)eventosParser:(NSString*)request;
@end
