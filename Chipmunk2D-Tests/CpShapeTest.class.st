"
A CpShapeTest is a test class for testing the behavior of CpShape
"
Class {
	#name : #CpShapeTest,
	#superclass : #CpObjectTest,
	#instVars : [
		'shape'
	],
	#category : #'Chipmunk2D-Tests-Model'
}

{ #category : #tests }
CpShapeTest >> setUp [
	super setUp.
	shape := CpShape
		newSegmentBody: space staticBody
		from: -32 @ -24
		to:  -32 @ 24
		radius: 0.0
]

{ #category : #tests }
CpShapeTest >> testElasticity [
	"Default value is 0.0"
	self assert: shape elasticity closeTo: 0.0.

	shape elasticity: 0.5.
	self assert: shape elasticity closeTo: 0.5.

]

{ #category : #tests }
CpShapeTest >> testFriction [
	"Default value is 0.0"
	self assert: shape friction closeTo: 0.0.

	shape friction: 0.5.
	self assert: shape friction closeTo: 0.5.

]
