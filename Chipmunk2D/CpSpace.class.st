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

	self ffiCall: #(void cpSpaceFree(void * handle))
]

{ #category : #resources }
CpSpace class >> new [
	"Answer a new instance of this class, using the library API.
	The instance leaves in C heap and must be released explicitely sending #free."

	^ self unownedNew
		initialize;
		yourself
]

{ #category : #resources }
CpSpace class >> unownedNew [

	^ self ffiCall: #(CpSpace cpSpaceNew())
]

{ #category : #accessing }
CpSpace >> addBody: aCpBody [

	bodies add: aCpBody.
	^ self ffi_cpSpaceAddBody: aCpBody
]

{ #category : #accessing }
CpSpace >> addShape: shape [

	shapes add: shape.
	^ self ffi_cpSpaceAddShape: shape
]

{ #category : #accessing }
CpSpace >> bodies [
	^ bodies
]

{ #category : #accessing }
CpSpace >> collisionSlop [

	^ self ffiCall: #(
		cpFloat
		cpSpaceGetCollisionSlop(CpSpace self)
		)
]

{ #category : #accessing }
CpSpace >> collisionSlop: collisionSlop [

	self ffiCall: #(
		void
		cpSpaceSetCollisionSlop(
			CpSpace self,
			cpFloat collisionSlop)
		)
]

{ #category : #private }
CpSpace >> ffi_cpSpaceAddBody: aCpBody [ 

	^ self ffiCall: #(
		CpBody
		cpSpaceAddBody(
			CpSpace self,
			CpBody aCpBody)
		)
]

{ #category : #private }
CpSpace >> ffi_cpSpaceAddShape: shape [

	^ self ffiCall: #(
		CpShape
		cpSpaceAddShape(
			CpSpace self,
			CpShape shape)
		)
]

{ #category : #private }
CpSpace >> ffi_cpSpaceGetGravity [

	 ^ self ffiCall: #(
		cpVect
		cpSpaceGetGravity(CpSpace self)
		)
]

{ #category : #private }
CpSpace >> ffi_cpSpaceSetGravity: gravity [

	self ffiCall: #(
		void
		cpSpaceSetGravity(
			CpSpace self,
			cpVect gravity)
		)
]

{ #category : #private }
CpSpace >> ffi_cpSpaceStep: dt [

	self ffiCall: #(
		void
		cpSpaceStep(
			CpSpace self,
			cpFloat dt)
		)
]

{ #category : #releasing }
CpSpace >> freeWithChildren [
	"Free children, before."

	bodies do: #free.
	shapes do: #free.
	self free.
]

{ #category : #accessing }
CpSpace >> gravity [

	 ^ self ffiCall: #(
		cpVect cpSpaceGetGravity(CpSpace self)
		)
]

{ #category : #accessing }
CpSpace >> gravity: aPoint [

	self ffi_cpSpaceSetGravity: aPoint asCpVector
]

{ #category : #initialization }
CpSpace >> initialize [

	super initialize.
	
	shapes := OrderedCollection new.
	bodies := OrderedCollection new.
]

{ #category : #accessing }
CpSpace >> iterations [

	^ self ffiCall: #(
		int
		cpSpaceGetIterations(CpSpace self)
		)
]

{ #category : #accessing }
CpSpace >> iterations: iterations [

	self ffiCall: #(
		void
		cpSpaceSetIterations(
			CpSpace self,
			int iterations)
		)
]

{ #category : #accessing }
CpSpace >> shapes [
	^ shapes
]

{ #category : #accessing }
CpSpace >> sleepTimeThreshold [

	^ self ffiCall: #(
		cpFloat
		cpSpaceGetSleepTimeThreshold(CpSpace self)
		)
]

{ #category : #accessing }
CpSpace >> sleepTimeThreshold: sleepTimeThreshold [

	self ffiCall: #(
		void
		cpSpaceSetSleepTimeThreshold(
			CpSpace self,
			cpFloat sleepTimeThreshold)
		)
]

{ #category : #accessing }
CpSpace >> staticBody [

	^ self ffiCall: #(
		CpBody
		cpSpaceGetStaticBody(CpSpace self)
		)
]

{ #category : #accessing }
CpSpace >> step: aNumber [

	self ffi_cpSpaceStep: aNumber asFloat
]
