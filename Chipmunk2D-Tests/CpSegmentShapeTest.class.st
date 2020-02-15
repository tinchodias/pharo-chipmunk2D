Class {
	#name : #CpSegmentShapeTest,
	#superclass : #CpShapeTest,
	#category : #'Chipmunk2D-Tests-Model'
}

{ #category : #running }
CpSegmentShapeTest >> newShape [
	^ CpSegmentShape
		newSegmentBody: space staticBody
		a: self segmentA
		b: self segmentB
		radius: self segmentRadius
]

{ #category : #running }
CpSegmentShapeTest >> segmentA [
	^ -32 @ -24
]

{ #category : #running }
CpSegmentShapeTest >> segmentB [
	^ -32 @ 24
]

{ #category : #running }
CpSegmentShapeTest >> segmentRadius [
	^ 0.0
]

{ #category : #tests }
CpSegmentShapeTest >> testA [
	shape := self newShape.

	self assert: shape a closeTo: self segmentA.

]

{ #category : #tests }
CpSegmentShapeTest >> testB [
	shape := self newShape.

	self assert: shape b closeTo: self segmentB.

]

{ #category : #tests }
CpSegmentShapeTest >> testRadius [
	shape := self newShape.

	self assert: shape radius closeTo: self segmentRadius.

]
