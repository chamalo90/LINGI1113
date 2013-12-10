typedef SparseMatList SparseMatList
struct SparseMatList{
	ListElement *first;
	int size;
}

typedef ListElement
struct ListElement{
	Sparsemat *sparseMatrix;
	ListElement *next;
}

SparseMatList *initList();
SparseMatList *initList(Sparsemat *sparseMat);
void add(SparseMatList *sparseMatList, Sparsemat *sparseMat);
Sparsemat *removeFirst(SparseMatList *sparseMatList);
