#include "change.hpp"

// This function gets a decimal number as an argument
// and converts it to binary and returns the value 
int DecimalToBinary ( int number ) {
	
	int BinaryNumber = 0, i = 1;
	
	while ( number > 0 ) {
		int remainder = number % 2;
		BinaryNumber += remainder * i;
		number /= 2;
		i *= 10;
     	}

	return BinaryNumber;
}
