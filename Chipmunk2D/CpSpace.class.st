Class {
	#name : #CpSpace,
	#superclass : #CpObject,
	#category : #'Chipmunk2D-Model'
}

{ #category : #resources }
CpSpace class >> ffiLibrary [
	^ CpLibrary
]

{ #category : #resources }
CpSpace class >> ffi_cpSpaceFree: handle [
	self ffiCall: #( void cpSpaceFree(cpSpace *handle) )

]

{ #category : #resources }
CpSpace class >> ffi_cpSpaceNew [
	^ self ffiCall: #( cpSpace* cpSpaceNew() )
]

{ #category : #accessing }
CpSpace >> addShape: shape [
	^ self ffiCall:
		#(cpShape * cpSpaceAddShape #(cpSpace * self, cpShape * shape))
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

{ #category : #ffi }
CpSpace >> ffi_cpSpaceSetGravity: gravity [
	self indirectCall: #( void cpSpaceSetGravity(cpSpace *self, cpVect gravity) )
]

{ #category : #accessing }
CpSpace >> gravity [
	 ^ self ffiCall: #(cpVect cpSpaceGetGravity(const cpSpace *self) )
]

{ #category : #accessing }
CpSpace >> gravity: anObject [
	self ffi_cpSpaceSetGravity: anObject asCpVector
	
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
