Class {
	#name : #CpObjectTest,
	#superclass : #TestCase,
	#instVars : [
		'space'
	],
	#category : #'Chipmunk2D-Tests-Model'
}

{ #category : #running }
CpObjectTest >> setUp [
	space := CpSpace new
]

{ #category : #running }
CpObjectTest >> tearDown [
	space freeWithChildren
]
