Colmonts Julien - 4163-08-00
Van Ouytsel Vincent - 1989-09-00

READ ME of our project 1 : matrixprod


Launch the program :
To launch the program, you just have to type the "make" command line. A makefile executes the full command for you.
After that, an executable file "matrix_prod" must have been created. Now you can start the execution ; to exectue the executable you have to type "./matrixprod [-n][-d][-o outputFile] inputFile".

The input file is the one that contains matrices that should be multiplied.
The output file is the name of the file were the computation of multiplication will be writen. If no output file name is given, the default name will be used (default_outputmatrixprod.txt).
You can also use the option -n to use the algorithm implemented with the classic integer table data structure to store the matrix.
The option -d is available to execute both structures. The result of 'standard' data structure  will be stored at "Normal Multiplication- "+Output Path. 


When the program starts, it loads all matrix of the file in a list adapted to the chosen data structure.
By the default the program use the sparse matrix data structure. The speciality of this implementation is not to store the zero. This take benefit in the space complexity of the algorithm. But one of the requirement for the project was to make another implementation in which the matrices are implemented in integer table.
Then next step takes the first two matrices in the list, multiply them and then multiply the result matrix with the next one. It do this up to the end of the list.

Going further :
The advantages of our implementation is that we could add easily multithreading. To do this we should launch each time the multiplication of 2 matrices in a thread and put the results in a new list. And then, do it recursively on the newly created list until the moment where the list contains only one matrix.


Known problem of the program :
We still have a problem in the multiplication with two normal matrix (matrix implemented in integer list). We don't know why, but the values in the table are altered by adding them in the list in the function normalMultiply (matrixprod.c).
So the program executes the multiplication but the given result is wrong because of the given values to the multiplication function.
