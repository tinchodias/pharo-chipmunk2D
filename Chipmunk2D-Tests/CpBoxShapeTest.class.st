Class {
	#name : #CpBoxShapeTest,
	#superclass : #CpShapeTest,
	#category : #'Chipmunk2D-Tests-Model'
}

{ #category : #running }
CpBoxShapeTest >> newShape [

	^ CpPolyShape
		newBoxBody: space staticBody
		width: 30
		height: 30
		radius: 0.5
]

{ #category : #tests }
CpBoxShapeTest >> testVertexAt [
	shape := self newShape.

	self assert: (shape pointAt: 1) equals:  15.0 @ -15.0.
	self assert: (shape pointAt: 2) equals:  15.0 @  15.0.
	self assert: (shape pointAt: 3) equals: -15.0 @  15.0.
	self assert: (shape pointAt: 4) equals: -15.0 @ -15.0.
]

{ #category : #tests }
CpBoxShapeTest >> testVertexCount [
	shape := self newShape.

	self assert: shape vertexCount equals: 4.

]
