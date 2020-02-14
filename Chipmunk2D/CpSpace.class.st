Class {
	#name : #CpSpace,
	#superclass : #CpObject,
	#instVars : [
		'shapes',
		'bodies'
	],
	#category : #'Chipmunk2D-Model'
}

{ #category : #finalization }
CpSpace class >> doFreeUsingFFI: handle [
	"Note: This doesn't free children (e.g. shapes, bodies, etc.)"

	self ffi_cpSpaceFree: handle
]

{ #category : #resources }
CpSpace class >> ffi_cpSpaceFree: handle [
	self ffiCall: #( void cpSpaceFree(cpSpace *handle) )

]

{ #category : #resources }
CpSpace class >> ffi_cpSpaceNew [
	^ self ffiCall: #( cpSpace* cpSpaceNew() )
]

{ #category : #resources }
CpSpace class >> new [
	"Answer a new instance of this class, using the library API.
	The instance leaves in C heap and must be released explicitely sending #free."

	^ self ffi_cpSpaceNew
		initialize;
		yourself
]

{ #category : #accessing }
CpSpace >> addBody: aCpBody [ 
	^ self ffiCall: #(
cpBody *
cpSpaceAddBody(cpSpace *self, cpBody *aCpBody)
)
]

{ #category : #accessing }
CpSpace >> addShape: shape [
	^ self ffiCall: #(
cpShape *
cpSpaceAddShape(cpSpace *self, cpShape *shape)
)
]

{ #category : #accessing }
CpSpace >> bodies [
	^ bodies
]

{ #category : #accessing }
CpSpace >> collisionSlop [
	^ self ffiCall:
		#(cpFloat cpSpaceGetCollisionSlop #(const cpSpace * self))
]

{ #category : #accessing }
CpSpace >> collisionSlop: collisionSlop [
	self ffiCall:
		#(void cpSpaceSetCollisionSlop #(cpSpace * self, cpFloat collisionSlop))
]

{ #category : #accessing }
CpSpace >> ffi_cpSpaceAddBody: aCpBody [ 
	^ self ffiCall: #(
cpBody *
cpSpaceAddBody(cpSpace *self, cpBody *aCpBody)
)
]

{ #category : #accessing }
CpSpace >> ffi_cpSpaceAddShape: shape [
	^ self ffiCall: #(
cpShape *
cpSpaceAddShape(cpSpace *self, cpShape *shape)
)
]

{ #category : #accessing }
CpSpace >> ffi_cpSpaceGetGravity [
	 ^ self ffiCall: #(cpVect cpSpaceGetGravity(const cpSpace *self) )
]

{ #category : #ffi }
CpSpace >> ffi_cpSpaceSetGravity: gravity [
	self ffiCall: #( void cpSpaceSetGravity(cpSpace *self, cpVect gravity) )
]

{ #category : #accessing }
CpSpace >> ffi_cpSpaceStep: dt [
	self ffiCall: #(
void
cpSpaceStep(cpSpace *self, cpFloat dt)
)
]

{ #category : #'initialize-release' }
CpSpace >> freeWithChildren [
	"Free children, before."
	bodies do: #free.
	shapes do: #free.
	self free.
]

{ #category : #accessing }
CpSpace >> gravity [
	 ^ self ffiCall: #(cpVect cpSpaceGetGravity(const cpSpace *self) )
]

{ #category : #accessing }
CpSpace >> gravity: anObject [
	self ffi_cpSpaceSetGravity: anObject asCpVector
	
]

{ #category : #initialization }
CpSpace >> initialize [
	super initialize.
	
	shapes := OrderedCollection new.
	bodies := OrderedCollection new.
]

{ #category : #accessing }
CpSpace >> iterations [
	^ self ffiCall: #( int cpSpaceGetIterations(const cpSpace *self) )
]

{ #category : #accessing }
CpSpace >> iterations: iterations [ 
	self ffiCall: #( void cpSpaceSetIterations(cpSpace *self, int iterations) )

]

{ #category : #accessing }
CpSpace >> shapes [
	^ shapes
]

{ #category : #accessing }
CpSpace >> sleepTimeThreshold [
	^ self ffiCall: #( cpFloat cpSpaceGetSleepTimeThreshold(const cpSpace *self) )
]

{ #category : #accessing }
CpSpace >> sleepTimeThreshold: sleepTimeThreshold [
	self
		ffiCall:
			#(void cpSpaceSetSleepTimeThreshold #(cpSpace * self , cpFloat sleepTimeThreshold))
]

{ #category : #accessing }
CpSpace >> staticBody [
	^ self ffiCall: #( cpBody * cpSpaceGetStaticBody(const cpSpace *self) )
]

{ #category : #accessing }
CpSpace >> step: aNumber [
	self ffi_cpSpaceStep: aNumber asFloat
]
