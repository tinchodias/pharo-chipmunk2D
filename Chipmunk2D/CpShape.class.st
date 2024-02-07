"
I represent FFI bindings to the 'cpShape' structure in the Chipmunk2D library.

I represent the common behavior and state of any rigid body's shape.

See: include/chipmunk/cpShape.h
"
Class {
	#name : #CpShape,
	#superclass : #CpObject,
	#category : #'Chipmunk2D-Model'
}

{ #category : #finalization }
CpShape class >> doFreeUsingFFI: handle [

	self ffiCall: #(void cpShapeFree #(void * handle))
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
