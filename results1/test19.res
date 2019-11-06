Row  Col  Type                Token/Error
3    1    reserved keyword    PROGRAM
3    9    reserved keyword    IS
4    5    reserved keyword    VAR
4    9    identifier          A
4    11   delimiter           :
4    13   identifier          INTEGER
4    21   operator            :=
4    24   integer             0
4    25   delimiter           ;
5    5    reserved keyword    VAR
5    9    identifier          B
5    11   delimiter           :
5    13   identifier          BOOLEAN
5    21   operator            :=
5    24   identifier          FALSE
5    29   delimiter           ;
6    1    reserved keyword    BEGIN
7    5    reserved keyword    WHILE
7    11   reserved keyword    NOT
7    15   identifier          B
7    17   reserved keyword    DO
8    7    identifier          A
8    9    operator            :=
8    12   identifier          A
8    14   operator            +
8    16   integer             1
8    17   delimiter           ;
9    7    identifier          B
9    9    operator            :=
9    12   identifier          A
9    14   operator            >
9    16   integer             100
9    19   delimiter           ;
10   5    reserved keyword    END
11   5    reserved keyword    WRITE
11   11   delimiter           (
11   12   string              "A = "
11   18   delimiter           ,
11   20   identifier          A
11   21   delimiter           ,
11   23   string              " (SHOULD BE 101)"
11   41   delimiter           )
11   42   delimiter           ;
12   1    reserved keyword    END
12   4    delimiter           ;

45 token(s), 0 error(s) found.
