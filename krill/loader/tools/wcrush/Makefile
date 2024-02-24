
all: wca/wca wcrush/wcrush

wca/wca: wca/main.cpp
	gcc -O3 -o wca/wca wca/main.cpp

wcrush/wcrush: wcrush/main.cpp
	gcc -O3 -o wcrush/wcrush wcrush/main.cpp

clean:
	rm -rf wca/wca
	rm -rf wcrush/wcrush