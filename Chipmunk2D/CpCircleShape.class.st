Class {
	#name : #CpCircleShape,
	#superclass : #CpShape,
	#category : #'Chipmunk2D-Model'
}

{ #category : #ffi }
CpCircleShape class >> ffi_cpCircleShapeNew: aCpBody radius: radius offset: offset [
	^self ffiCall: #(
CpCircleShape
cpCircleShapeNew(CpBody aCpBody, cpFloat radius, cpVect offset)
)
]

{ #category : #'instance creation' }
CpCircleShape class >> newCircleBody: aCpBody radius: radius offset: aPoint [
	^ (self
		ffi_cpCircleShapeNew: aCpBody
		radius: radius asFloat
		offset: aPoint asCpVector)
		initialize;
		yourself
]

{ #category : #accessing }
CpCircleShape >> ffi_cpCircleShapeGetOffset [
	^ self ffiCall: #(
cpVect cpCircleShapeGetOffset(CpCircleShape self)
)
]

{ #category : #ffi }
CpCircleShape >> ffi_cpCircleShapeGetRadius [
	^ self ffiCall: #(
cpFloat cpCircleShapeGetRadius(CpShape self)
)
]

{ #category : #accessing }
CpCircleShape >> offset [
	^ (self ffiCall: #(
cpVect cpCircleShapeGetOffset(CpCircleShape self)
)) asPoint
]

{ #category : #accessing }
CpCircleShape >> radius [
	^ self ffi_cpCircleShapeGetRadius
]
