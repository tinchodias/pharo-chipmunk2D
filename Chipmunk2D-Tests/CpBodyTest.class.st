"
A CpBodyTest is a test class for testing the behavior of CpBody
"
Class {
	#name : #CpBodyTest,
	#superclass : #TestCase,
	#instVars : [
		'space',
		'body'
	],
	#category : #'Chipmunk2D-Tests-Model'
}

{ #category : #running }
CpBodyTest >> setUp [
	space := CpSpace ffi_cpSpaceNew.
	body := CpBody
		newMass: 1
		moment:
			(CpLibrary uniqueInstance momentForBoxWithMass: 1 width: 30 height: 30)
]

{ #category : #running }
CpBodyTest >> tearDown [
	"First, free space children"
	(body isNotNil and: [ body handle isNotNil ])
		ifTrue: [ CpBody ffi_cpBodyFree: body handle ].

	"Free space"
	(space isNotNil and: [ space handle isNotNil ])
		ifTrue: [ CpSpace ffi_cpSpaceFree: space handle ].

]

{ #category : #tests }
CpBodyTest >> testPosition [
	"Default value"
	self assert: body position equals: 0@0.

	body position: 10.5 @ 40.
	self assert: body position equals: 10.5 @ 40.

]
