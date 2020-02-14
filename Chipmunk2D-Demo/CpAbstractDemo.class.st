Class {
	#name : #CpAbstractDemo,
	#superclass : #Object,
	#instVars : [
		'space'
	],
	#category : #'Chipmunk2D-Demo'
}

{ #category : #'as yet unclassified' }
CpAbstractDemo >> draw [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
CpAbstractDemo >> freeSpace [
	self flag: #todo. "free children"
	CpSpace ffi_cpSpaceFree: space handle 
]

{ #category : #'as yet unclassified' }
CpAbstractDemo >> initializeSpace [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
CpAbstractDemo >> prepare [
	space := CpSpace new.
	self initializeSpace
]

{ #category : #'as yet unclassified' }
CpAbstractDemo >> update [
	self subclassResponsibility
]
