build_preditor: clean
	cp ../wisconsin_data_create_model/Sources/wisconsin_data/wisconsin.mlmodel Sources/wisconsin_data/
	cd Sources/wisconsin_data; xcrun coremlcompiler generate wisconsin.mlmodel --language Swift .
	cd Sources/wisconsin_data; xcrun coremlcompiler compile wisconsin.mlmodel .
	swift build
	swift run

clean:
	rm -rf Sources/wisconsin_data/wisconsin.mlmodel*
	rm -rf Sources/wisconsin_data/wisconsin.swift

