"
A CpSpaceTest is a test class for testing the behavior of CpSpace
"
Class {
	#name : #CpSpaceTest,
	#superclass : #TestCase,
	#instVars : [
		'space'
	],
	#category : #'Chipmunk2D-Tests-Model'
}

{ #category : #running }
CpSpaceTest >> setUp [
	space := CpSpace ffi_cpSpaceNew
]

{ #category : #running }
CpSpaceTest >> tearDown [
	(space isNotNil and: [ space handle isNotNil ])
		ifTrue: [ CpSpace ffi_cpSpaceFree: space handle ]
]

{ #category : #running }
CpSpaceTest >> testSetAndGetIterations [
	space iterations: 30.
	self assert: space iterations equals: 30.
	space iterations: 31.
	self assert: space iterations equals: 31.
]
