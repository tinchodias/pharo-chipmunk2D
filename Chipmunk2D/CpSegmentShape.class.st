"
I represent FFI bindings to the 'cpSegmentShape' structure in the Chipmunk2D library.

I am the shape of a rigid body that looks as a thick line segment. 
My endpoints are named A and B. My radius is a parameter to define the thickness of a segment shape.

See: include/chipmunk/cpShape.h
"
Class {
	#name : #CpSegmentShape,
	#superclass : #CpShape,
	#category : #'Chipmunk2D-Model'
}

{ #category : #'instance creation' }
CpSegmentShape class >> newSegmentBody: aBody from: fromPoint to: toPoint radius: aFloat [
	"Answer a new instance of this class, using the library API.
	The instance leaves in C heap and must be released explicitely sending #free."

	^ (self
		unownedNewSegmentBody: aBody
		from: fromPoint asCpVector
		to: toPoint asCpVector
		radius: aFloat asFloat)
		initialize;
		yourself
]

{ #category : #'instance creation' }
CpSegmentShape class >> unownedNewSegmentBody: body from: a to: b radius: radius [

	^ self ffiCall: #(
		CpSegmentShape
		cpSegmentShapeNew(CpBody body, cpVect a, cpVect b, cpFloat radius)
		)
]

{ #category : #accessing }
CpSegmentShape >> a [

	^ self aAsCpVector asPoint
]

{ #category : #accessing }
CpSegmentShape >> aAsCpVector [

	^ self ffiCall: #(
		cpVect
		cpSegmentShapeGetA(CpShape self)
		)
]

{ #category : #accessing }
CpSegmentShape >> b [

	^ self bAsCpVector asPoint
]

{ #category : #accessing }
CpSegmentShape >> bAsCpVector [

	^ self ffiCall: #(
		cpVect cpSegmentShapeGetB(CpShape self)
		)
]

{ #category : #accessing }
CpSegmentShape >> radius [

	^ self ffiCall: #(
		cpFloat cpSegmentShapeGetRadius(CpShape self)
		)
]
