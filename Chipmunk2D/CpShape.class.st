Class {
	#name : #CpShape,
	#superclass : #CpObject,
	#category : #'Chipmunk2D-Model'
}

{ #category : #finalization }
CpShape class >> doFreeUsingFFI: handle [
	self ffi_cpShapeFree: handle
]

{ #category : #'instance creation' }
CpShape class >> ffi_cpBoxShapeNew: aBody from: width to: height radius: radius [
	^ self ffiCall: #(
CpPolyShape
cpBoxShapeNew(CpBody aBody, cpFloat width, cpFloat height, cpFloat radius)
)
]

{ #category : #ffi }
CpShape class >> ffi_cpCircleShapeNew: aCpBody radius: radius offset: offset [
	^self ffiCall: #(
CpCircleShape
cpCircleShapeNew(CpBody aCpBody, cpFloat radius, cpVect offset)
)
]

{ #category : #ffi }
CpShape class >> ffi_cpSegmentNew: body from: a to: b radius: radius [
	^ self ffiCall: #(
CpSegmentShape
cpSegmentShapeNew(CpBody body, cpVect a, cpVect b, cpFloat radius)
)
]

{ #category : #ffi }
CpShape class >> ffi_cpShapeFree: handle [
	self ffiCall: #(void cpShapeFree #(void * handle))
]

{ #category : #'instance creation' }
CpShape class >> newBoxBody: aBody from: width to: height radius: radius [
	"Answer a new instance of this class, using the library API.
	The instance leaves in C heap and must be released explicitely sending #free."

	^ (self
		ffi_cpBoxShapeNew: aBody
		from: width asFloat
		to: height asFloat
		radius: radius asFloat)
		initialize;
		yourself
]

{ #category : #'instance creation' }
CpShape class >> newCircleBody: aCpBody radius: radius offset: aPoint [
	^ (self ffi_cpCircleShapeNew: aCpBody radius: radius offset: aPoint)
		initialize;
		yourself
]

{ #category : #'instance creation' }
CpShape class >> newSegmentBody: aBody from: fromPoint to: toPoint radius: aFloat [
	"Answer a new instance of this class, using the library API.
	The instance leaves in C heap and must be released explicitely sending #free."

	^ (self
		ffi_cpSegmentNew: aBody
		from: fromPoint asCpVector
		to: toPoint asCpVector
		radius: aFloat asFloat)
		initialize;
		yourself
]

{ #category : #accessing }
CpShape >> elasticity [
	^ self ffiCall: #(
cpFloat
cpShapeGetElasticity(CpShape self)
)
]

{ #category : #accessing }
CpShape >> elasticity: elasticity [ 
	self ffiCall: #(
void
cpShapeSetElasticity(CpShape self, cpFloat elasticity)
)

]

{ #category : #accessing }
CpShape >> friction [
	^ self ffiCall: #(
cpFloat
cpShapeGetFriction(CpShape self)
)
]

{ #category : #accessing }
CpShape >> friction: friction [ 
	self ffiCall: #(
void
cpShapeSetFriction(CpShape self, cpFloat friction)
)

]
