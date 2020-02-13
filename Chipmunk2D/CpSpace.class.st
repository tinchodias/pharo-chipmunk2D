Class {
	#name : #CpSpace,
	#superclass : #FFIOpaqueObject,
	#traits : 'CpTLibrary',
	#classTraits : 'CpTLibrary classTrait',
	#pools : [
		'CpTypeAlias'
	],
	#category : #'Chipmunk2D-Model'
}

{ #category : #resources }
CpSpace class >> ffiLibrary [
	^ CpLibrary
]

{ #category : #resources }
CpSpace class >> ffi_cpSpaceFree: handle [
	self ffiCall: #( void cpSpaceFree(cpSpace *handle) )

]

{ #category : #resources }
CpSpace class >> ffi_cpSpaceNew [
	^ self ffiCall: #( cpSpace* cpSpaceNew() )
]

{ #category : #accessing }
CpSpace >> iterations [
	^ self ffiCall: #( int cpSpaceGetIterations(const cpSpace *self) )
]

{ #category : #accessing }
CpSpace >> iterations: iterations [ 
	self ffiCall: #( void cpSpaceSetIterations(cpSpace *self, int iterations) )

]
