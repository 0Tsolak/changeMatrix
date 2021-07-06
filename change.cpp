#include "change.hpp"

// This function makes changes in Matrix
void change(int a[][col]) {

	int up = sumUp(a);      // Sum of upper elements
	int down = sumDown(a);  // sum of bottom elelments

	int upSumInBinary = DecimalToBinary(up);      // Binary code of 'up'
	int downSumInBinary = DecimalToBinary(down);  // Binary code of 'down'

	changeUp(a, upSumInBinary);      // Changes the upper elements
	changeDown(a, downSumInBinary);  // Changes the bottom elements
}
