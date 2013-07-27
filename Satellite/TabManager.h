//
//  TabManager.h
//  Satellite
//
//  Created by Benjamin Gordon on 7/27/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tab.h"

@interface TabManager : NSObject

@property (nonatomic, retain) NSMutableArray *allTabs;
@property (nonatomic, retain) Tab *currentTab;

+(TabManager*)Tabs;
-(void)addTab:(Tab *)aTab;
-(void)killTab:(Tab *)kTab;

@end
