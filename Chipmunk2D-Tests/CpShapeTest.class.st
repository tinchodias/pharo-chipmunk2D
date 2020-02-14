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

{ #category : #testing }
CpShapeTest class >> isAbstract [ 
	^ self = CpShapeTest
]

{ #category : #running }
CpShapeTest >> newShape [
	"Answer the instance of a shape to be tested."

	^ self subclassResponsibility
]

{ #category : #tests }
CpShapeTest >> testElasticity [
	shape := self newShape.

	"Default value is 0.0"
	self assert: shape elasticity closeTo: 0.0.

	shape elasticity: 0.5.
	self assert: shape elasticity closeTo: 0.5.

]

{ #category : #tests }
CpShapeTest >> testFriction [
	shape := self newShape.
	
	"Default value is 0.0"
	self assert: shape friction closeTo: 0.0.

	shape friction: 0.5.
	self assert: shape friction closeTo: 0.5.

]
