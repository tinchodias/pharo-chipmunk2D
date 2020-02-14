Class {
	#name : #CpObject,
	#superclass : #FFIExternalObject,
	#traits : 'CpTLibrary',
	#classTraits : 'CpTLibrary classTrait',
	#pools : [
		'CpTypeAlias'
	],
	#category : #'Chipmunk2D-Model'
}

{ #category : #finalization }
CpObject class >> doFreeUsingFFI: handle [
	self subclassResponsibility
]

{ #category : #finalization }
CpObject class >> finalizeResourceData: handle [
	(handle isNil or: [ handle isNull ])
		ifTrue: [ ^ self ].

	"Logging the handle in the transcript for information"
	('Free: {1} {2}' format: { self className. handle }) traceCr.

	self doFreeUsingFFI: handle.
	handle beNull
]

{ #category : #'initialize-release' }
CpObject >> free [
	self class finalizeResourceData: handle
]

{ #category : #'initialize-release' }
CpObject >> initialize [
	self flag: #fix. 
	"--> Intentionally not super initializing because it overrides handle!"


]
