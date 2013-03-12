#import "Matrix33.h"


@implementation Matrix33

-(id) initWithZeros {
	Vector3 *tmp = [[Vector3 alloc] initWithZeros];
	return [self initWithVectors:tmp y:tmp z:tmp]; 
}
-(id) init {
	return [self initWithValues:0 xy:0 xz:0 yx:0 yy:0 yz:0 zx:0 zy:0 zz:0];
}
//nu toks tai *!&%$
-(id) initWithValues:(float) _xx xy:(float)_xy xz:(float)_xz
                     yx:(float) _yx yy:(float)_yy yz:(float)_yz
                     zx:(float) _zx zy:(float)_zy zz:(float)_zz {
    xx = _xx;
    xy = _xy;
    xz = _xz;
    yx = _yx;
    yy = _yy;
    yz = _yz;
    zx = _zx;
    zy = _zy;
    zz = _zz;
    return self;
}
-(id) initWithVectors:(Vector3 *) x y:(Vector3 *) y z:(Vector3 *) z {
	xx = x.getX;
	xy = x.getY;
	xz = x.getZ;
	yx = y.getX;
	yy = y.getY;
	yz = y.getZ;
	zx = z.getX;
	zy = z.getY;
	zz = z.getZ;
	return self;
}
-(float) getDeterminant {
	return xx*yy*zz + xy*yz*zx + xz*yx*zy - xx*yz*zy - yy*zx*xz - zz*xy*yx;
}
-(Matrix33*) getInverse {
	float det = [self getDeterminant];
	if (det == 0.0) return nil;
	///erroras:
	return [[Matrix33 alloc] initWithValues:(yy*zz - yz*zy) / det xy:(xz*zy - xy*zz) / det xz: (xy*yz - xz*yy) / det
		                         yx:(yz*zx - yx*zz) / det yy:(xx*zz - xz*zx) / det yz: (xz*yx - xx*yz) / det
                                 zx:(yx*zy - yy*zx) / det zy:(xy*zx - xx*zy) / det zz: (xx*yy - xy*yx) / det];
	///end erroras
}

-(void) transpose {
	float tmp;
    tmp = xy;
    xy = yx;
    yx = tmp;

    tmp = xz;
    xz = zx;
    zx = tmp;

    tmp = yz;
    yz = zy;
    zy = tmp;
}
@end