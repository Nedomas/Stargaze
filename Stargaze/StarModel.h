#import "Vector3.h" 
#import "Matrix33.h"
#import "Position.h"

@interface StarModel : NSObject {
	float fieldOfView;
	static final Vector3 AXIS_OF_EARTH_ROTATION = [[Vector3 alloc] initWithValues:0 y:0 z:1];
	static final Vector3 SCREEN_UP_IN_PHONE_COORDS = [[Vector3 alloc] initWithValues:0 y:1 z:0];
	static final Vector3 POINTING_DIR_IN_PHONE_COORDS = [[Vector3 alloc] initWithValues:0 y:0 z:-1];
	struct Pos location;
	//Dar reikia laika kaskaiptais gauti
	//ciuju coordinates patogiausia bus naudoti per struct Pos
	//reikia kaskaip zinoti kada koordinates apsideitina
	//taipat reikia zinot priejimo prie view kaskokio nu pvz kad bent butu
	//taipat reiktu gal viska refoktorint. 

}

@end