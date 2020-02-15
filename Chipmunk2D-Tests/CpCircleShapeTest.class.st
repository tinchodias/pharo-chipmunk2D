Class {
	#name : #CpCircleShapeTest,
	#superclass : #CpShapeTest,
	#category : #'Chipmunk2D-Tests-Model'
}

{ #category : #running }
CpCircleShapeTest >> circleOffset [
	^ 4 @ 5
]

{ #category : #running }
CpCircleShapeTest >> circleRadius [
	^ 15.0
]

{ #category : #running }
CpCircleShapeTest >> newShape [
	^ CpCircleShape
		newCircleBody: space staticBody
		radius: self circleRadius
		offset: self circleOffset
]

{ #category : #tests }
CpCircleShapeTest >> testOffset [
	shape := self newShape.

	self assert: shape offset closeTo: self circleOffset.

]

{ #category : #tests }
CpCircleShapeTest >> testRadius [
	shape := self newShape.

	self assert: shape radius closeTo: self circleRadius.

]
