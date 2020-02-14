"
A CpShapeTest is a test class for testing the behavior of CpShape
"
Class {
	#name : #CpShapeTest,
	#superclass : #TestCase,
	#instVars : [
		'space',
		'shape'
	],
	#category : #'Chipmunk2D-Tests-Model'
}

{ #category : #tests }
CpShapeTest >> setUp [
	| source target |
	space := CpSpace ffi_cpSpaceNew.
	source := -320 @ -240.
	target := -320 @ 240.
	shape := CpShape
		newSegmentBody: space staticBody
		from: source
		to: target
		radius: 0.0.
	shape elasticity: 1.0
]

{ #category : #tests }
CpShapeTest >> tearDown [
	(space isNotNil and: [ space handle isNotNil ])
		ifTrue: [ CpSpace ffi_cpSpaceFree: space handle ].
"	(shape isNotNil and: [ shape handle isNotNil ])
		ifTrue: [ CpShape ffi_cpShapeFree: shape handle ]."
]

{ #category : #tests }
CpShapeTest >> testElasticity [
	"Default value is 1.0"
	self assert: shape elasticity closeTo: 1.0.

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
