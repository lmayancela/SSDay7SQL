USE smoothstacklisandro; /* Might need to change this to whatever scheme you're using that has the same data */

/* Retrieve the names of all borrowers who do not have any books checked out */
SELECT name
FROM tbl_borrower
WHERE cardNo NOT IN(SELECT cardNo FROM tbl_book_loans);
