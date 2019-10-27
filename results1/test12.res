Row  Col  Type                Token/Error
4    1    reserved keyword    PROGRAM
4    9    reserved keyword    IS
5    5    reserved keyword    VAR
5    9    identifier          I
5    11   delimiter           :
5    13   identifier          INTEGER
5    21   operator            :=
5    24   integer             0
5    25   delimiter           ;
6    5    reserved keyword    PROCEDURE
6    15   identifier          ADDONE
6    21   delimiter           (
6    22   delimiter           )
6    24   reserved keyword    IS
6    27   reserved keyword    BEGIN
7    2    identifier          I
7    4    operator            :=
7    7    identifier          I
7    9    operator            +
7    11   integer             1
7    12   delimiter           ;
8    5    reserved keyword    END
8    8    delimiter           ;
9    5    reserved keyword    PROCEDURE
9    15   identifier          PASSTHEBUCK
9    26   delimiter           (
9    27   delimiter           )
9    29   reserved keyword    IS
9    32   reserved keyword    BEGIN
9    38   identifier          ADDONE
9    44   delimiter           (
9    45   delimiter           )
9    46   delimiter           ;
9    48   reserved keyword    END
9    51   delimiter           ;
10   1    reserved keyword    BEGIN
11   5    reserved keyword    WRITE
11   10   delimiter           (
11   11   string              "I = "
11   17   delimiter           ,
11   19   identifier          I
11   20   delimiter           ,
11   22   string              " (SHOULD BE 0)"
11   38   delimiter           )
11   39   delimiter           ;
12   5    identifier          PASSTHEBUCK
12   16   delimiter           (
12   17   delimiter           )
12   18   delimiter           ;
13   5    reserved keyword    WRITE
13   10   delimiter           (
13   11   string              "I = "
13   17   delimiter           ,
13   19   identifier          I
13   20   delimiter           ,
13   22   string              " (SHOULD BE 1)"
13   38   delimiter           )
13   39   delimiter           ;
14   5    reserved keyword    WRITE
14   10   delimiter           (
14   11   string              "ALL DONE!"
14   22   delimiter           )
14   23   delimiter           ;
15   1    reserved keyword    END
15   4    delimiter           ;

65 token(s), 0 error(s) found.
