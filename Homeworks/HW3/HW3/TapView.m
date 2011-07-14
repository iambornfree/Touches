//
//  View.m
//  Tap
//
//  Created by PANCHAM GUPTA on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TapView.h"


@implementation TapView


- (id) initWithFrame: (CGRect) frame {
	if ((self = [super initWithFrame: frame]) != nil) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		tapCount = 0;
		wearOff = 2;
        maxTapGap = 0.3;
	}
	return self;
}


- (void) noTap {	//called when no tap is currently being received
	tapCount = 0;
	[self setNeedsDisplay];
}


- (void) singleTap {	//called when a single tap is received.
	tapCount = 1;
	[self setNeedsDisplay];
    
	//After a few seconds, the single tap wears off.
	[self performSelector: @selector(noTap) withObject: nil
               afterDelay: wearOff];
}


- (void) doubleTap {	//called when a double tap is received
	tapCount = 2;
	[self setNeedsDisplay];
    
	//After a few seconds, the double tap wears off.
	[self performSelector: @selector(noTap) withObject: nil
               afterDelay: wearOff];
}

- (void) tripleTap {	//called when a tripl3 tap is received
	tapCount = 3;
	[self setNeedsDisplay];
    
	//After a few seconds, the triple tap wears off.
	[self performSelector: @selector(noTap) withObject: nil
               afterDelay: wearOff];
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	NSAssert1(touches.count > 0,
              @"touchesBegan: touches.count == %u", touches.count);
	
	UITouch *t = [touches anyObject];
	
	if (t.tapCount == 1) {
		[self performSelector: @selector(singleTap) withObject: nil
                   afterDelay: 0.3 * 2];
	} else if (t.tapCount == 2) {
		[self performSelector: @selector(doubleTap) withObject: nil
                   afterDelay: 0.3];
	} else if (t.tapCount == 3) {
        [self tripleTap];
    }
}


- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	NSAssert1(touches.count > 0,
              @"touchesBegan: touches.count == %u", touches.count);
	
	UITouch *t = [touches anyObject];
	
	if (t.tapCount == 3) {
        // cancel the double tap selector
		[NSObject cancelPreviousPerformRequestsWithTarget: self];
	} else if (t.tapCount == 2) {
        // cancel the single tap selector
        [NSObject cancelPreviousPerformRequestsWithTarget: self];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect {
	// Drawing code
	NSString *s = [NSString stringWithFormat: @"%u", tapCount];
	UIFont *f = [UIFont systemFontOfSize: 6 * 72];
	CGSize size = [s sizeWithFont: f];
	
	CGRect b = self.bounds;
	CGFloat x = b.origin.x + (b.size.width - size.width) / 2;
	CGFloat y = b.origin.y + (b.size.height - size.height) / 2;
	[s drawAtPoint: CGPointMake(x, y) withFont: f];
}


- (void) dealloc {
	[super dealloc];
}

@end