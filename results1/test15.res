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
7    2    reserved keyword    VAR
7    6    identifier          J
7    8    delimiter           :
7    10   identifier          INTEGER
7    18   operator            :=
7    21   integer             0
7    22   delimiter           ;
8    2    reserved keyword    PROCEDURE
8    12   identifier          OKAY
8    16   delimiter           (
8    17   delimiter           )
8    19   reserved keyword    IS
9    6    reserved keyword    VAR
9    10   identifier          CONSTANT
9    19   delimiter           :
9    21   identifier          INTEGER
9    29   operator            :=
9    32   integer             0
9    33   delimiter           ;
10   2    reserved keyword    BEGIN
11   6    identifier          CONSTANT
11   15   operator            :=
11   18   integer             1
11   19   delimiter           ;
12   6    identifier          J
12   8    operator            :=
12   11   identifier          J
12   13   operator            +
12   15   identifier          CONSTANT
12   23   delimiter           ;
13   2    reserved keyword    END
13   5    delimiter           ;
14   5    reserved keyword    BEGIN
15   2    identifier          J
15   4    operator            :=
15   7    identifier          I
15   8    delimiter           ;
16   2    identifier          OKAY
16   6    delimiter           (
16   7    delimiter           )
16   8    delimiter           ;
17   2    identifier          I
17   4    operator            :=
17   7    identifier          J
17   8    delimiter           ;
18   5    reserved keyword    END
18   8    delimiter           ;
19   1    reserved keyword    BEGIN
20   5    identifier          I
20   7    operator            :=
20   10   integer             0
20   11   delimiter           ;
21   5    reserved keyword    WRITE
21   10   delimiter           (
21   11   string              "I = "
21   17   delimiter           ,
21   19   identifier          I
21   20   delimiter           ,
21   22   string              " (SHOULD BE 0)"
21   38   delimiter           )
21   39   delimiter           ;
22   5    identifier          ADDONE
22   11   delimiter           (
22   12   delimiter           )
22   13   delimiter           ;
23   5    reserved keyword    WRITE
23   10   delimiter           (
23   11   string              "I = "
23   17   delimiter           ,
23   19   identifier          I
23   20   delimiter           ,
23   22   string              " (SHOULD BE 1)"
23   38   delimiter           )
23   39   delimiter           ;
24   5    identifier          ADDONE
24   11   delimiter           (
24   12   delimiter           )
24   13   delimiter           ;
25   5    reserved keyword    WRITE
25   10   delimiter           (
25   11   string              "I = "
25   17   delimiter           ,
25   19   identifier          I
25   20   delimiter           ,
25   22   string              " (SHOULD BE 2)"
25   38   delimiter           )
25   39   delimiter           ;
26   5    reserved keyword    WRITE
26   10   delimiter           (
26   11   string              "ALL DONE!"
26   22   delimiter           )
26   23   delimiter           ;
27   1    reserved keyword    END
27   4    delimiter           ;

108 token(s), 0 error(s) found.
