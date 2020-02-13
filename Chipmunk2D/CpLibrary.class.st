Class {
	#name : #CpLibrary,
	#superclass : #FFILibrary,
	#pools : [
		'CpTypeAlias'
	],
	#category : #'Chipmunk2D-Core'
}

{ #category : #'accessing platform' }
CpLibrary >> macModuleName [
	^ (FileLocator imageDirectory / 'Chipmunk2D' / 'src' / 'libchipmunk.dylib') fullName
]
