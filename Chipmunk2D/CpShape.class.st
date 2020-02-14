Class {
	#name : #CpShape,
	#superclass : #CpObject,
	#category : #'Chipmunk2D-Model'
}

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
	"Creates a segment shape from a point to another"

	^ self
		ffi_cpSegmentNew: aBody
		from: fromPoint asCpVector
		to: toPoint asCpVector
		radius: aFloat asFloat
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
