"
A CpSpaceTest is a test class for testing the behavior of CpSpace
"
Class {
	#name : #CpSpaceTest,
	#superclass : #CpObjectTest,
	#category : #'Chipmunk2D-Tests-Model'
}

{ #category : #running }
CpSpaceTest >> testAddBody [
	| body |
	body := CpBody
		newMass: 1
		moment:
			(CpLibrary uniqueInstance momentForBoxWithMass: 1 width: 30 height: 30).
	space addBody: body.
	self assert: (space bodies includes: body)
]

{ #category : #running }
CpSpaceTest >> testAddShape [
	| shape |
	shape := CpSegmentShape
		newSegmentBody: space staticBody
		a: 20 @ 40
		b: 30 @ 50
		radius: 0.0.
	space addShape: shape.
	self assert: (space shapes includes: shape)
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
	self assert: space gravity asPoint equals: 0@0.
	space gravity: 50@50.
	self assert: space gravity asPoint equals: 50@50.
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

{ #category : #running }
CpSpaceTest >> testStep [
	space step: 0.5.
	self flag: #todo "assert!"
]
