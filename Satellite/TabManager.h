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

+(TabManager*)Tabs;
-(Tab)currentTab;
-(NSMutableArray *)allTabs;

@end
