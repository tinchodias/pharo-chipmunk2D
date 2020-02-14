Class {
	#name : #CpSegmentShapeTest,
	#superclass : #CpShapeTest,
	#category : #'Chipmunk2D-Tests-Model'
}

{ #category : #running }
CpSegmentShapeTest >> newShape [
	^ CpShape
		newSegmentBody: space staticBody
		from: -32 @ -24
		to:  -32 @ 24
		radius: 0.0
]
