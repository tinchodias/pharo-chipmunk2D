Class {
	#name : #CpBoxShapeTest,
	#superclass : #CpShapeTest,
	#category : #'Chipmunk2D-Tests-Model'
}

{ #category : #running }
CpBoxShapeTest >> newShape [
	^ CpShape
		newBoxBody: space staticBody
		from: 30
		to: 30
		radius: 0.5
]
