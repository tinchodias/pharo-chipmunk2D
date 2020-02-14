"
I am a 2D (x,y) vector with float coordinates.

I wrap the cpVect structure from Chipmunk.
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

{ #category : #'fields description' }
CpVector class >> fieldsDesc [
	^ #(
		cpFloat x;
		cpFloat y;
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
		x: x asFloat;
		y: y asFloat;
		yourself
]

{ #category : #'instance creation' }
CpVector class >> zero [
	^ self x: 0.0 y: 0.0
]

{ #category : #'basic operation' }
CpVector >> + aCmVector [
	^ self class x: self x + aCmVector x y: self y + aCmVector y
]

{ #category : #'basic operation' }
CpVector >> - aCpVector [
	^ self class x: self x - aCpVector x y: self y - aCpVector y
]

{ #category : #converting }
CpVector >> asCpVector [
	^ self
]

{ #category : #converting }
CpVector >> asPoint [
	^ self x @ self y
]

{ #category : #'basic operation' }
CpVector >> rotateBy: aCpVector [
	"Answer a new instance that is the result of rotating myself by aCpVector."

	^ CpVector
		x: self x * aCpVector x - (self y * aCpVector y)
		y: self x * aCpVector y + (self y * aCpVector x)
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
