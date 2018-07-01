# Spec2
Redesigned Spec UI framework

To install project in Pharo 7 use following script:
```Smalltalk
Metacello new
		baseline: 'Spec2';
		repository: 'github://dionisiydk/Spec2:dev';
		onConflict: [ :err | err useIncoming ]; 
		load.
```
