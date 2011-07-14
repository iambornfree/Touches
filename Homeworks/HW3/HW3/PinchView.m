//
//  View.m
//  Pinch
//
//  Created by PANCHAM GUPTA on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View


- (id) initWithFrame: (CGRect) frame {
	if ((self = [super initWithFrame: frame]) != nil) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
        
        CGRect b = self.bounds;
		CGFloat h = 40;	//height and width
		CGFloat w = 2 * h;
        
		//Center the small view in the View.
		CGRect f = CGRectMake(
                              b.origin.x + (b.size.width - w) / 2,
                              b.origin.y + (b.size.height - h) / 2,
                              w,
                              h
                              );
        
		m_view = [[UIView alloc] initWithFrame: f];
		m_view.backgroundColor = [UIColor blackColor];
		[self addSubview: m_view];
        
		self.multipleTouchEnabled = YES;
	}
	return self;
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	if (touches.count == 2) {
		NSArray *a = touches.allObjects;	//Copy the set into an array.
		current0 = [[a objectAtIndex: 0] locationInView: self];
		current1 = [[a objectAtIndex: 1] locationInView: self];
		
		previous0 = [[a objectAtIndex: 0] previousLocationInView: self];
		previous1 = [[a objectAtIndex: 1] previousLocationInView: self];

        CGFloat dx = current0.x - current1.x;
        CGFloat dy = current0.y - current1.y;
        CGFloat currentDistance = hypotf(dx, dy);
        NSLog(@"distance: %g", currentDistance);
		CGFloat xScale = currentDistance/self.bounds.size.width;
        CGFloat yScale = currentDistance/self.bounds.size.height;
        NSLog(@"x,y: %g, %g", xScale, yScale);
		
        m_view.transform = 
            CGAffineTransformMakeScale(xScale, 
                                       yScale);

        [self setNeedsDisplay];
	}
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect {
    // Drawing code
	CGFloat dx = current0.x - current1.x;
	CGFloat dy = current0.y - current1.y;
	CGFloat currentDistance = hypotf(dx, dy);
	
    m_view.transform = CGAffineTransformMakeScale(
                                                currentDistance / 50, currentDistance / 50
                                                );
	dx = previous0.x - previous1.x;
	dy = previous0.y - previous1.y;
	CGFloat previousDistance = hypotf(dx, dy);
	
	NSString *t = nil;
	if (currentDistance > previousDistance) {
		t = @"spread";
	} else if (currentDistance < previousDistance) {
		t = @"pinch";
	} else {
		t = @"neither";
	}
	
	NSString *s = [NSString stringWithFormat: @"%@ %d",
                   t, (int)currentDistance];
	UIFont *f = [UIFont systemFontOfSize: currentDistance / 2];
	CGSize size = [s sizeWithFont: f];
	CGRect b = self.bounds;
	CGFloat x = b.origin.x + (b.size.width - size.width) / 2;
	[s drawAtPoint: CGPointMake(x, 0.0) withFont: f];
}
*/

- (void) dealloc {
    [m_view release];
	[super dealloc];
}


@end