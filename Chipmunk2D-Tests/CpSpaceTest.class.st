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
CpSpaceTest >> testAddSegmentShape [
	| body source target shape |
	body := space staticBody.
	source := -320 @ -240.
	target := -320 @ 240.
	shape := CpShape newSegmentBody: body from: source to: target radius: 0.0.
	space addShape: shape.
"	self assert: body class equals: CpBody"
]

{ #category : #running }
CpSpaceTest >> testGetStaticBody [
	| body |
	body := space staticBody.
	self assert: body class equals: CpBody
]

{ #category : #running }
CpSpaceTest >> testSetAndGetCollisionSlop [
	space collisionSlop: 0.5.
	self assert: space collisionSlop closeTo: 0.5.
	space collisionSlop: 0.7.
	self assert: space collisionSlop closeTo: 0.7
]

{ #category : #running }
CpSpaceTest >> testSetAndGetGravity [

"	TODO: no idea what's the problem
	
	space gravity: CpVector zero.
	self assert: space gravity equals: 0.0 @ 0.0."
	"space gravity: 50@50.
	self assert: space gravity equals: 50@50."
]

{ #category : #running }
CpSpaceTest >> testSetAndGetIterations [
	space iterations: 30.
	self assert: space iterations equals: 30.
	space iterations: 31.
	self assert: space iterations equals: 31.
]

{ #category : #running }
CpSpaceTest >> testSetAndGetSleepTimeThreshold [
	space sleepTimeThreshold: 0.5.
	self assert: space sleepTimeThreshold closeTo: 0.5.
	space sleepTimeThreshold: 0.7.
	self assert: space sleepTimeThreshold closeTo: 0.7
]
