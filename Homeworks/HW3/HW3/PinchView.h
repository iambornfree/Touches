//
//  View.h
//  Pinch
//
//  Created by PANCHAM GUPTA on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface View: UIView {
	//Locations of touches
	CGPoint current0;
	CGPoint current1;
	
	CGPoint previous0;
	CGPoint previous1;
    
    UIView *m_view;
}

@end