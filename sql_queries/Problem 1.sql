USE smoothstacklisandro; /* Might need to change this to whatever scheme you're using that has the same data */

/* How many copies of the book titled The Lost Tribe are owned by the library branch whose name is "Sharpstown"? */

/* CTE to create tbl_book_to_branch which is a join between tbl_book_copies and tbl_library_branch */
WITH tbl_book_to_branch (bookId, branchName, copiesOwned)
AS
(
	SELECT branchName, tbl_book_copies.noOfCopies, tbl_book_copies.bookId
    FROM tbl_library_branch
    INNER JOIN tbl_book_copies ON tbl_library_branch.branchId = tbl_book_copies.branchId
    WHERE branchName = "Sharpstown"
)
/* SELECT using a LEFT JOIN so that the book title will still show despite there not being a branch with that book*/
SELECT title,  IFNULL(tbl_book_to_branch.branchName, "N/A (Not owned by this branch)") AS branch, IFNULL(tbl_book_to_branch.copiesOwned, 0) AS owned
FROM tbl_book
LEFT JOIN tbl_book_to_branch
ON tbl_book.bookId = tbl_book_to_branch.bookId
WHERE title = "The Lost Tribe";

