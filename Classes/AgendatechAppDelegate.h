//
//  AgendatechAppDelegate.h
//  Agendatech
//
//  Created by andersonleite on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgendatechAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	NSMutableArray *eventos;

	NSMutableData *responseData;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet NSMutableArray *eventos;

@end

