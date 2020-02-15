"
I am a 2D (x,y) vector with float coordinates.

I wrap the cpVect structure from Chipmunk.
"
Class {
	#name : #CpVector,
	#superclass : #CpObject,
	#category : #'Chipmunk2D-Model'
}

{ #category : #finalization }
CpVector class >> doFreeUsingFFI: handle [
	"Nothing to call in this case"
]

{ #category : #'instance creation' }
CpVector class >> ffi_cpVectCreateX: xFloat y: yFloat [
	^ self ffiCall: #(
CpVector
cpVectCreate(cpFloat xFloat, cpFloat yFloat)
)
]

{ #category : #'instance creation' }
CpVector class >> from: anObject [
	^ anObject asCpVector
]

{ #category : #'instance creation' }
CpVector class >> fromPoint: aPoint [
	^ self x: aPoint x y: aPoint y
]

{ #category : #'instance creation' }
CpVector class >> x: x y: y [
	^ self ffi_cpVectCreateX: x asFloat y: y asFloat
]

{ #category : #'instance creation' }
CpVector class >> zero [
	^ self x: 0.0 y: 0.0
]

{ #category : #converting }
CpVector >> asCpVector [
	^ self
]

{ #category : #converting }
CpVector >> asPoint [
	^ self x @ self y
]

{ #category : #'accessing structure variables' }
CpVector >> x [
	^ self ffiCall: #(
cpFloat
cpVectGetX(CpVector self)
)
]

{ #category : #'accessing structure variables' }
CpVector >> y [
	^ self ffiCall: #(
cpFloat
cpVectGetY(CpVector self)
)
]
