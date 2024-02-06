"
I represent FFI bindings to the cpVect structure in the Chipmunk2D library.

I am a 2D (x,y) vector with float coordinates. 

See: include/chipmunk/cpVect.h
"
Class {
	#name : #CpVector,
	#superclass : #CpStructure,
	#classVars : [
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : #'Chipmunk2D-Model'
}

{ #category : #'instance creation' }
CpVector class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"

	^ #(
		cpFloat x
		cpFloat y
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

	^ self new
		x: x;
		y: y;
		yourself
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
	"This method was automatically generated"
	^handle doubleAt: OFFSET_X
]

{ #category : #'accessing structure variables' }
CpVector >> x: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_X put: anObject
]

{ #category : #'accessing structure variables' }
CpVector >> y [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_Y
]

{ #category : #'accessing structure variables' }
CpVector >> y: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_Y put: anObject
]
