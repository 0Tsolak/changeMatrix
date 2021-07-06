#include "change.hpp"

// This function calculates amount of digits in number
int length(int number) {

	int len = 0;
	while(number) {
		++len;
		number /= 10;
	}
	return len;
}
