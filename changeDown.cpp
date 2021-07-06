#include "change.hpp"

// This function replace the elements of matrix 
// that are under the main diagonal with the digits of the binary number
// which is sum of those elements
void changeDown(int a[][col], int binNum) {

	int len = length(binNum); // Length of binary number
	int index = 0;            // Index of digits of the binary number
	
	for(int i = 1; i < row; ++i) {
		for(int j = 0; j < i; ++j) {
			if(index < len) {    // Checks if the index is smaller than the length
				
				a[i][j] = binNum / pow(10, (len - index - 1));    // Assigns the element of matrix to binary number's digit
				binNum -= a[i][j] * pow(10, (len - index - 1));   // Removes the first digit of binary number
				++index;  // Increment of index
			}
			else {    //  If index is not smaller than length , the element is assigned to 0
				a[i][j] = 0;
			}
		
		}
	
	}
}
