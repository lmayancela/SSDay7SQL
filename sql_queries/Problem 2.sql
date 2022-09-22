USE smoothstacklisandro; /* Might need to change this to whatever scheme you're using that has the same data */

/* How many copies of the book titled The Lost Tribe are owned by each library branch? */

/* CTE to create tbl_book_to_copies which is a join between tbl_book_copies and tbl_book */
WITH tbl_book_to_copies(branchId, bookTitle, copiesOwned)
AS
(
	SELECT branchId, tbl_book.title AS bookTitle, noOfCopies
    FROM tbl_book_copies
    INNER JOIN tbl_book
    ON tbl_book_copies.bookId = tbl_book.bookId
)
/* This should return one result since only one branch has this book*/
SELECT tbl_library_branch.branchName AS branchName, bookTitle, IFNULL(copiesOwned, 0) AS copiesOwned
FROM tbl_book_to_copies
INNER JOIN tbl_library_branch
ON tbl_library_branch.branchId = tbl_book_to_copies.branchId
WHERE bookTitle = "The Lost Tribe"; 
