MY_UID=jdoe12

zip:
	zip -FSr ${MY_UID}.zip ./project_report ./rtl/*.v ./synthesis/*.tcl ./synthesis/gl/*.v ./synthesis/*.log ./synthesis/logs/*.log ./synthesis/reports/* ./run/transcript

unzip:
	unzip -o ${MY_UID}.zip
all: test random

test:
	rm -rf inputs
	mkdir -p inputs/input1 inputs/input2 inputs/input3 inputs/input4 inputs/output1 inputs/output2 inputs/output3 inputs/output4
	python3 scripts/input_gen.py -i inputs/input1 -o inputs/output1 -q "4 4 4 4" -m "4 4 4 4"
	python3 scripts/input_gen.py -i inputs/input2 -o inputs/output2 -q "4 4 4 4 4 4 4 4" -m "4 4 4 4 4 4 4 4"
	python3 scripts/input_gen.py -i inputs/input3 -o inputs/output3 -q "2 5 4 6 1 4" -m "10 8 4 2 1 3"
	python3 scripts/input_gen.py -i inputs/input4 -o inputs/output4 -q "6 2 1 8 4 5 3" -m "4 5 20 4 2 8 5"

random:
	mkdir -p  inputs/input5 inputs/input6  inputs/output5 inputs/output6
	python3 scripts/input_gen.py -i inputs/input5 -o inputs/output5 -q "6 2 1 8 4 5 3" -m "4 5 20 4 2 8 5"
	python3 scripts/input_gen.py -i inputs/input6 -o inputs/output6 -q "6 2 1 8 4 5 3" -m "4 5 20 4 2 8 5"
