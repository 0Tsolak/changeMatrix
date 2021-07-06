#include "change.hpp"


int main() {
	// Initializing a matrix
	int a[row][col] = {{1,2,3,4,5}, {5,6,15,8,2}, {9,5,2,1,8}, {3,1,5,6,0}, {4,0,21,5,9}};
	
	// Printing Given matrix
	std::cout << "Given matix\n\n";
	printMatrix(a);
	
	// Calling this function to make changes in the matrix
	change(a);

	// Printing already changed matrix
	std::cout << "\nCanged matrix\n\n";
	printMatrix(a);

	return 0;
}
