--Check whether the given list of values exists in a column, return yes or no accordingly
SELECT
    e1.employee_id,
    e1.job_id,
    column_value id_job,
    CASE
        WHEN e1.job_id IS NULL THEN
            'NO'
        ELSE
            'YES'
    END          AS does_it_exists
FROM
    sys.odcivarchar2list('SA_REP', 'ST_MAN', 'NotValid', 'FI_ACCOUNT') l1
    LEFT JOIN employees;
    
    
=======OUTPUT=====
EMPLOYEE_ID	JOB_ID	    ID_JOB	    DOES_IT_EXISTS
179	        SA_REP	    SA_REP	    YES
120	        ST_MAN	    ST_MAN	    YES
121	        ST_MAN	    ST_MAN	    YES
122	        ST_MAN	    ST_MAN	    YES
123	        ST_MAN	    ST_MAN	    YES
124	        ST_MAN	    ST_MAN	    YES
		                NotValid	NO
109	        FI_ACCOUNT	FI_ACCOUNT	YES
110	        FI_ACCOUNT	FI_ACCOUNT	YES
111	        FI_ACCOUNT	FI_ACCOUNT	YES
