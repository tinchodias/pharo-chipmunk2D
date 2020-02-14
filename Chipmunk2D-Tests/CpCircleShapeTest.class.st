Class {
	#name : #CpCircleShapeTest,
	#superclass : #CpShapeTest,
	#category : #'Chipmunk2D-Tests-Model'
}

{ #category : #running }
CpCircleShapeTest >> newShape [
	^ CpShape
		newCircleBody: space staticBody
		radius: 15.0
		offset: CpVector zero
]
