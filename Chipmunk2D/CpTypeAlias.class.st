"
I define mappings from the native Chipmunk types to NativeBoost / Smalltalk types.
"
Class {
	#name : #CpTypeAlias,
	#superclass : #SharedPool,
	#classVars : [
		'cpArbiter',
		'cpArray',
		'cpBB',
		'cpBody',
		'cpBodyPositionFunc',
		'cpBodyVelocityFunc',
		'cpBool',
		'cpCollisionType',
		'cpConstraint',
		'cpContactBufferHeader',
		'cpDataPointer',
		'cpFloat',
		'cpGroup',
		'cpHashSet',
		'cpHashValue',
		'cpLayers',
		'cpShape',
		'cpShapeClass',
		'cpSpace',
		'cpSpatialIndex',
		'cpTimestamp',
		'cpVect'
	],
	#classInstVars : [
		'cpCircleShape',
		'cpSegmentShape',
		'cpPolyShape'
	],
	#category : #'Chipmunk2D-Core'
}

{ #category : #'pool initialization' }
CpTypeAlias class >> initialize [
"	cpBool := #bool."
	cpFloat := #double.
"	cpTimestamp := #uint.
	cpHashValue := #uint.
	cpLayers := #uint.
	cpGroup := #uint.
	cpCollisionType := #uint."
		
	"Translating to pointer"
"	cpDataPointer := #ulong.
	cpShapeClass := #ulong.
	cpArray := #ulong.
	cpSpatialIndex := #ulong.
	cpContactBufferHeader := #ulong.
	cpHashSet := #ulong.
	cpBodyVelocityFunc := #ulong.
	cpBodyPositionFunc := #ulong.
	cpArbiter := #ulong.
	cpConstraint := #ulong."
	
	"Translating to inner classes"
	cpVect := #CpVector.
	cpSpace := #CpSpace.
	cpBody := #CpBody.
	cpShape := #CpShape.
	cpCircleShape := #CpCircleShape.
	cpSegmentShape := #CpSegmentShape.
	cpPolyShape := #CpPolyShape.
"	cpBB := #CpBoundingBox."
]
