//
//  View.h
//  Tap
//
//  Created by PANCHAM GUPTA on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface View : UIView {
 	NSUInteger tapCount; //1 for single tap, 2 for double, 0 for no tap
	NSUInteger wearOff;  //after this number of seconds, a tap wears off  
    NSUInteger maxTapGap; //max number seconds allowed in 2 taps of double tap
}

@end
