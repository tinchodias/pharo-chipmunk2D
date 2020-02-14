"
A CpBodyTest is a test class for testing the behavior of CpBody
"
Class {
	#name : #CpBodyTest,
	#superclass : #CpObjectTest,
	#instVars : [
		'body'
	],
	#category : #'Chipmunk2D-Tests-Model'
}

{ #category : #running }
CpBodyTest >> setUp [
	super setUp.
	body := CpBody
		newMass: 1
		moment:
			(CpLibrary uniqueInstance momentForBoxWithMass: 1 width: 30 height: 30)
]

{ #category : #tests }
CpBodyTest >> testPosition [
	"Default value"
	self assert: body position closeTo: 0@0.

	body position: 10.5 @ 40.
	self assert: body position closeTo: 10.5 @ 40.

]
