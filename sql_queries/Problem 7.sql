USE smoothstacklisandro; /* Might need to change this to whatever scheme you're using that has the same data */

/* For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central" */

WITH stephen_king_books(bookTitle, bookId, bookAuthor)
AS
(
	SELECT title AS bookTitle, bookId, tbl_author.authorName AS bookAuthor
    FROM tbl_book
    INNER JOIN tbl_author
    ON tbl_book.authId = tbl_author.authorId
    WHERE tbl_author.authorName = "Stephen King"
)
SELECT stephen_king_books.bookTitle AS bookTitle, IFNULL(noOfCopies,0) AS numOwned, IFNULL(branchName, "Book is not at Central Branch") AS branchName
FROM
(
	SELECT bookId, noOfCopies, branchName
    FROM tbl_book_copies
    INNER JOIN tbl_library_branch
    ON tbl_book_copies.branchId = tbl_library_branch.branchId
    WHERE tbl_library_branch.branchName = "Central"
) 
AS bookid_to_branch
RIGHT JOIN stephen_king_books
ON bookid_to_branch.bookId = stephen_king_books.bookId;
/* None of Stephen King's books appear to be at the branch called "Central." Unsure whether or not this was intended. */


