USE smoothstacklisandro; /* Might need to change this to whatever scheme you're using that has the same data */

/* For each library branch, retrieve the branch name and the total number of books loaned out from that branch. */

SELECT tbl_library_branch.branchName AS branchName, COUNT(*) AS totalLoaned
FROM tbl_library_branch
LEFT JOIN tbl_book_loans
ON tbl_library_branch.branchId = tbl_book_loans.branchId
GROUP BY tbl_library_branch.branchId;