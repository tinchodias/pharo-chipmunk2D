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

	"Fix points when issue is fixed"
	self assert: (shape vertexAt: 1) equals: 0@0.
	self assert: (shape vertexAt: 2) equals: 0@0.
	self assert: (shape vertexAt: 3) equals: 0@0.
	self assert: (shape vertexAt: 4) equals: 0@0.
]

{ #category : #tests }
CpBoxShapeTest >> testVertexCount [
	shape := self newShape.

	self assert: shape vertexCount equals: 4.

]
