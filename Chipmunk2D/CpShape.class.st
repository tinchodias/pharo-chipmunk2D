Class {
	#name : #CpShape,
	#superclass : #CpObject,
	#category : #'Chipmunk2D-Model'
}

{ #category : #finalization }
CpShape class >> doFreeUsingFFI: handle [
	self ffi_cpShapeFree: handle
]

{ #category : #ffi }
CpShape class >> ffi_cpSegmentNew: body from: a to: b radius: radius [
	^ self ffiCall: #( cpShape* cpSegmentShapeNew(
			cpBody *body,
			cpVect a,
			cpVect b,
			cpFloat radius ) )
]

{ #category : #ffi }
CpShape class >> ffi_cpShapeFree: handle [
	self ffiCall: #(void cpShapeFree #(cpShape * handle))
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
cpShapeGetElasticity(const cpShape *self)
)
]

{ #category : #accessing }
CpShape >> elasticity: elasticity [ 
	self ffiCall: #(
void
cpShapeSetElasticity(cpShape *self, cpFloat elasticity)
)

]

{ #category : #accessing }
CpShape >> friction [
	^ self ffiCall: #(
cpFloat
cpShapeGetFriction(const cpShape *self)
)
]

{ #category : #accessing }
CpShape >> friction: friction [ 
	self ffiCall: #(
void
cpShapeSetFriction(cpShape *self, cpFloat friction)
)

]
