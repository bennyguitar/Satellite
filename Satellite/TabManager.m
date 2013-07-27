//
//  TabManager.m
//  Satellite
//
//  Created by Benjamin Gordon on 7/27/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import "TabManager.h"

@implementation TabManager

static TabManager * _Tabs = nil;

+(TabManager*)Tabs {
	@synchronized([TabManager class]) {
		if (!_Tabs)
            _Tabs  = [[TabManager alloc]init];
		return _Tabs;
	}
	
	return nil;
}



+(id)alloc
{
	@synchronized([TabManager class]) {
		NSAssert(_Tabs == nil, @"Attempted to allocate a second instance of TabManager.");
		_Tabs = [super alloc];
		return _Tabs;
	}
	
	return nil;
}




-(id)init {
	self = [super init];
	if (self != nil) {
        
	}
	
	return self;
}




@end
