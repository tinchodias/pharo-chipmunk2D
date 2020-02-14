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
CpSpaceTest >> testAddBody [
	| body |
	body := CpBody
		newMass: 1
		moment:
			(CpLibrary uniqueInstance momentForBoxWithMass: 1 width: 30 height: 30).
	space addBody: body.
	self flag: #todo	"assert!"
]

{ #category : #running }
CpSpaceTest >> testAddShape [
	| shape |
	shape := CpShape
		newSegmentBody: space staticBody
		from: -320 @ -240
		to: -320 @ 240
		radius: 0.0.
	space addShape: shape.
	self flag: #todo	"assert!"
]

{ #category : #running }
CpSpaceTest >> testCollisionSlop [
	space collisionSlop: 0.5.
	self assert: space collisionSlop closeTo: 0.5.
	space collisionSlop: 0.7.
	self assert: space collisionSlop closeTo: 0.7
]

{ #category : #running }
CpSpaceTest >> testGravity [
	"Default value"
	self assert: space gravity equals: 0@0.
	space gravity: 50@50.
	self assert: space gravity equals: 50@50.
]

{ #category : #running }
CpSpaceTest >> testIterations [
	space iterations: 30.
	self assert: space iterations equals: 30.
	space iterations: 31.
	self assert: space iterations equals: 31.
]

{ #category : #running }
CpSpaceTest >> testSleepTimeThreshold [
	space sleepTimeThreshold: 0.5.
	self assert: space sleepTimeThreshold closeTo: 0.5.
	space sleepTimeThreshold: 0.7.
	self assert: space sleepTimeThreshold closeTo: 0.7
]

{ #category : #running }
CpSpaceTest >> testStaticBody [
	| body |
	body := space staticBody.
	self assert: body class equals: CpBody
]
