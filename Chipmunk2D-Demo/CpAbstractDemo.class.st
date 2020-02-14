Class {
	#name : #CpAbstractDemo,
	#superclass : #Object,
	#instVars : [
		'space'
	],
	#category : #'Chipmunk2D-Demo'
}

{ #category : #releasing }
CpAbstractDemo >> freeSpace [
	space freeWithChildren
]

{ #category : #initialization }
CpAbstractDemo >> initialize [
	space := CpSpace new.
	self initializeSpace
]

{ #category : #initialization }
CpAbstractDemo >> initializeSpace [
	self subclassResponsibility
]

{ #category : #accessing }
CpAbstractDemo >> space [
	^ space
]

{ #category : #stepping }
CpAbstractDemo >> step [
	self updateAfter: self timeStep.
]

{ #category : #stepping }
CpAbstractDemo >> timeStep [
	^ 1.0 / 180.0
]

{ #category : #accessing }
CpAbstractDemo >> title [
	self subclassResponsibility
]

{ #category : #stepping }
CpAbstractDemo >> updateAfter: dt [
	space step: dt
]
