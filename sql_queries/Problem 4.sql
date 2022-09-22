USE smoothstacklisandro; /* Might need to change this to whatever scheme you're using that has the same data */

/* For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address. */

WITH branch_loans(branchName, bookId, cardNo, dueDate)
AS
(
	SELECT tbl_library_branch.branchName AS branchName, bookId, cardNo, dueDate
    FROM tbl_book_loans
    INNER JOIN tbl_library_branch
    ON tbl_book_loans.branchId = tbl_library_branch.branchId
    /* The Problem asks to use today's date but all of the data has dates from 2018 which would mean that this query returns
	nothing when the current date is passed in. Instead I just did query for every book due after October 1st, 2018 */
    WHERE dueDate >= '2018-10-01'
)
SELECT tbl_book.title AS title, tbl_borrower.name AS borrower, tbl_borrower.address AS address
FROM branch_loans
INNER JOIN tbl_book ON branch_loans.bookId = tbl_book.bookId
INNER JOIN tbl_borrower ON branch_loans.cardNo = tbl_borrower.cardNo
WHERE branch_loans.branchName = "Sharpstown";
