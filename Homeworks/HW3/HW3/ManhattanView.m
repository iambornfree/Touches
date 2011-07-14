//
//  View.m
//  LongIsland
//
//  Created by PANCHAM GUPTA on 7/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import <CoreLocation/CoreLocation.h>

@implementation View


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	static CLLocationCoordinate2D a[] = {
		{40.72921,      -73.971548},    //East River at East 17th Street
		{40.735519,     -73.974595},    //24
		{40.742998,     -73.971806},    //34
		{40.754767,     -73.96215},     //53
		{40.762146,     -73.954296},    //65
		{40.771474,     -73.946185},    //81
		{40.776154,     -73.942022},    //89
		{40.776154,     -73.942022},    //96
		{40.787008,     -73.93816},     //103
		{40.795326,     -73.929534},    //118
		{40.800946,     -73.929062},    //125
		{40.808775,     -73.934212},    //Harlem River at 132nd Street
		{40.817772,     -73.933868},    //143
		{40.83547,      -73.935113},    //163
		{40.855857,     -73.922195},    //Dyckman Street
		{40.869878,     -73.91078},     //218
		{40.873416,     -73.911767},    //Broadway Bridge
		{40.877018,     -73.922968},    //Henry Hudson Parkway Bridge
		{40.877082,     -73.926916},    //Hudson River
		{40.867379,     -73.933096},    //Riverside Drive
		{40.852417,     -73.943224},    //Hudson River at West 181st Street
		{40.850339,     -73.946786},    //George Washingon Bridge
		{40.850339,     -73.946786},    //168
		{40.834626,     -73.95052},     //155
		{40.827417,     -73.955026},    //144 sewage treatment plant
		{40.828034,     -73.956399},    //144
		{40.82365,      -73.959446},    //137
		{40.822676,     -73.957601},    //137
		{40.771669,     -73.994765},    //57
		{40.769524,     -73.995152},    //54
		{40.763316,     -73.999872},    //44
		{40.762276,     -74.001718},    //42
		{40.754052,     -74.007726},    //29
		{40.749825,     -74.009442},    //23
		{40.748362,     -74.00794},     //21
		{40.740754,     -74.009228},    //Meatpacking District
		{40.739258,     -74.010344},    //Gansevoort Street
		{40.726218,     -74.011545},    //Holland Tunnel
		{40.718315,     -74.013176},    //Battery Park City
		{40.718737,     -74.016609},    //Battery Park City
		{40.706539,     -74.019227},    //South Cove
		{40.70078,      -74.014893},    //Battery Park
		{40.701919,     -74.009314},    //Heliport
		{40.708523,     -73.997984},    //north of Brooklyn Bridge
		{40.710475,     -73.977985},    //Corlears Hook Park
		{40.712752,     -73.976011},    //Grand Street
		{40.720819,     -73.972964}	  //East 6th Street
	};
    
    static CLLocationCoordinate2D rooseveltIsland[] = {
        {40.76871941336385, -73.94228746795272},
        {40.76806937002561, -73.94297411346054},
        {40.76728930962611, -73.9438324203453},
        {40.766769264272725, -73.94417574309921},
        {40.765729161357115, -73.94486238860702},
        {40.76455902611927, -73.94606401824569},
        {40.7635188886122, -73.9467506637535},
        {40.762088672960765, -73.94812395476913},
        {40.76078845020774, -73.94915392303085},
        {40.75935817580278, -73.95052721404647},
        {40.758708040899585, -73.95121385955429},
        {40.75818792839891, -73.9519005050621},
        {40.75727772173063, -73.95258715056991},
        {40.756107437701885, -73.95344545745468},
        {40.755587304854146, -73.95396044158554},
        {40.7551972025478, -73.9548187484703},
        {40.754286954931224, -73.95550539397811},
        {40.75337669485227, -73.95653536223983},
        {40.75220634215301, -73.9577369918785},
        {40.751296053588774, -73.95876696014022},
        {40.75051579632915, -73.9599685897789},
        {40.74986557495201, -73.96099855804061},
        {40.749605484620865, -73.96151354217147},
    };
    
	static size_t count = sizeof a/ sizeof a[0];
	static size_t countRI = sizeof rooseveltIsland/ sizeof rooseveltIsland[0];
    
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGFloat scale = 2000;
	
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM(c, w/2, h/2);
	
	//Longitude and latitude in degrees of the heart of Manhattan,
	//probably somewhere around the Angel of the Waters.
	CGFloat xtranslate = /*-a[0].longitude;*/ 73.965;
	CGFloat ytranslate = /*-a[0].latitude;*/ -40.79;
    CGContextRotateCTM(c, -28.9 * M_PI / 180);
	CGContextScaleCTM(c, scale * cos(ytranslate * M_PI/180), -scale);
	CGContextTranslateCTM(c, xtranslate, ytranslate);
	
	
	CGContextBeginPath (c);
	for (size_t i = 0; i < count; ++i) {
		if (i == 0) {
			CGContextMoveToPoint(c, a[i].longitude, a[i].latitude);
		} else {
			CGContextAddLineToPoint(c, a[i].longitude, a[i].latitude);
		}
	}
	CGContextClosePath(c);
    
    // Central park
    CGContextMoveToPoint(c, -73.97305, 40.764291);		//Grand Army Plaza
	CGContextAddLineToPoint(c, -73.981762, 40.767997);	//Columbus Circle
	CGContextAddLineToPoint(c, -73.958116, 40.800556);	//Frederick Douglass Circle
	CGContextAddLineToPoint(c, -73.949235, 40.796848);	//Frawley Circle
	CGContextClosePath(c);

    // roosevelt island
    for (size_t i = 0; i < countRI; ++i) {
		if (i == 0) {
			CGContextMoveToPoint(c, rooseveltIsland[i].longitude, rooseveltIsland[i].latitude);
		} else {
			CGContextAddLineToPoint(c, rooseveltIsland[i].longitude, rooseveltIsland[i].latitude);
		}
	}
    CGContextClosePath(c);
    
    CGContextSetRGBFillColor(c, 1, 0, 0, 1);
	CGContextFillPath(c);
}


- (void)dealloc {
    [super dealloc];
}


@end
