USE smoothstacklisandro; /* Might need to change this to whatever scheme you're using that has the same data */

/* Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. */

/* Using a CTE to get a table of all borrowers and the amount of books checked out */
WITH borrower_to_checked_out(borrowerName, borrowerAddress, checkedOut)
AS
(
SELECT name AS borrowerName, address AS borrowerAddress, COUNT(*) AS checkedOut
FROM tbl_borrower
INNER JOIN tbl_book_loans
ON tbl_borrower.cardNo = tbl_book_loans.cardNo
GROUP BY tbl_borrower.cardNo
)
/* Now we retrieve the records with more than 5 books checkedOut */
SELECT *
FROM borrower_to_checked_out
WHERE checkedOut > 5;
