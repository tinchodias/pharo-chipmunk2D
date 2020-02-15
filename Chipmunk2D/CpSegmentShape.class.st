Class {
	#name : #CpSegmentShape,
	#superclass : #CpShape,
	#category : #'Chipmunk2D-Model'
}

{ #category : #ffi }
CpSegmentShape class >> ffi_cpSegmentNew: body from: a to: b radius: radius [
	^ self ffiCall: #(
CpSegmentShape
cpSegmentShapeNew(CpBody body, cpVect a, cpVect b, cpFloat radius)
)
]

{ #category : #'instance creation' }
CpSegmentShape class >> newSegmentBody: aBody a: fromPoint b: toPoint radius: aFloat [
	"Answer a new instance of this class, using the library API.
	The instance leaves in C heap and must be released explicitely sending #free."

	^ (self
		ffi_cpSegmentNew: aBody
		from: fromPoint asCpVector
		to: toPoint asCpVector
		radius: aFloat asFloat)
		initialize;
		yourself
]

{ #category : #accessing }
CpSegmentShape >> a [
	^ self ffi_cpSegmentShapeGetA asPoint
]

{ #category : #accessing }
CpSegmentShape >> b [
	^ self ffi_cpSegmentShapeGetB asPoint
]

{ #category : #ffi }
CpSegmentShape >> ffi_cpSegmentShapeGetA [
	^ self ffiCall: #(
cpVect cpSegmentShapeGetA(CpShape self)
)
]

{ #category : #ffi }
CpSegmentShape >> ffi_cpSegmentShapeGetB [
	^ self ffiCall: #(
cpVect cpSegmentShapeGetB(CpShape self)
)
]

{ #category : #ffi }
CpSegmentShape >> ffi_cpSegmentShapeGetRadius [
	^ self ffiCall: #(
cpFloat cpSegmentShapeGetRadius(CpShape self)
)
]

{ #category : #accessing }
CpSegmentShape >> radius [
	^ self ffi_cpSegmentShapeGetRadius
]
