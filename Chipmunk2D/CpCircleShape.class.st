"
I represent FFI bindings to the 'cpCircleShape' structure in the Chipmunk2D library.

I am the circular shape of a rigid body, with a radius and an offset.

See: include/chipmunk/cpShape.h
"
Class {
	#name : #CpCircleShape,
	#superclass : #CpShape,
	#category : #'Chipmunk2D-Model'
}

{ #category : #'instance creation' }
CpCircleShape class >> newCircleBody: aCpBody radius: radius offset: aPoint [

	^ (self
			unownedNewCircleShapeNew: aCpBody
			radius: radius asFloat
			offset: aPoint asCpVector)
		initialize;
		yourself
]

{ #category : #'instance creation' }
CpCircleShape class >> unownedNewCircleShapeNew: aCpBody radius: radius offset: offset [

	^ self ffiCall: #(
		CpCircleShape
		cpCircleShapeNew(CpBody aCpBody, cpFloat radius, cpVect offset)
		)
]

{ #category : #accessing }
CpCircleShape >> offset [

	^ self offsetAsCpVector asPoint
]

{ #category : #accessing }
CpCircleShape >> offsetAsCpVector [

	^ self ffiCall: #(
		cpVect cpCircleShapeGetOffset(CpCircleShape self)
		)
]

{ #category : #accessing }
CpCircleShape >> radius [

	^ self ffiCall: #(
		cpFloat cpCircleShapeGetRadius(CpShape self)
		)
]
