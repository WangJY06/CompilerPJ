Row  Col  Type                Token/Error
4    1    reserved keyword    PROGRAM
4    9    reserved keyword    IS
5    5    reserved keyword    VAR
5    9    identifier          I
5    10   delimiter           ,
5    12   identifier          J
5    13   delimiter           ,
5    15   identifier          ANSWER
5    22   delimiter           :
5    24   identifier          INTEGER
5    32   operator            :=
5    35   integer             0
5    36   delimiter           ;
6    5    reserved keyword    PROCEDURE
6    15   identifier          FACTORIAL
6    24   delimiter           (
6    25   delimiter           )
6    27   reserved keyword    IS
7    2    reserved keyword    PROCEDURE
8    11   identifier          FACT
8    15   delimiter           (
8    16   delimiter           )
8    18   reserved keyword    IS
8    21   reserved keyword    BEGIN
9    6    identifier          MULT
9    10   delimiter           (
9    11   delimiter           )
9    12   delimiter           ;
10   6    reserved keyword    IF
10   9    identifier          J
10   11   operator            <>
10   14   identifier          I
10   16   reserved keyword    THEN
10   21   identifier          J
10   23   operator            :=
10   26   identifier          J
10   28   operator            +
10   30   integer             1
10   31   delimiter           ;
10   33   identifier          FACT
10   37   delimiter           (
10   38   delimiter           )
10   39   delimiter           ;
10   41   reserved keyword    END
10   44   delimiter           ;
11   4    reserved keyword    END
11   7    delimiter           ;
12   4    identifier          MULT
12   8    delimiter           (
12   9    delimiter           )
12   11   reserved keyword    IS
12   14   reserved keyword    BEGIN
13   13   identifier          ANSWER
13   20   operator            :=
13   23   identifier          ANSWER
13   30   operator            *
13   32   identifier          J
13   33   delimiter           ;
14   11   reserved keyword    END
14   14   delimiter           ;
15   5    reserved keyword    BEGIN
16   2    identifier          ANSWER
16   9    operator            :=
16   12   integer             1
16   13   delimiter           ;
17   2    identifier          J
17   4    operator            :=
17   7    integer             1
17   8    delimiter           ;
18   2    identifier          FACT
18   6    delimiter           (
18   7    delimiter           )
18   8    delimiter           ;
19   5    reserved keyword    END
19   8    delimiter           ;
20   1    reserved keyword    BEGIN
21   5    reserved keyword    WRITE
21   11   delimiter           (
21   12   string              "The first 5 factorials are (in descending order):"
21   63   delimiter           )
21   64   delimiter           ;
22   5    identifier          I
22   7    operator            :=
22   10   integer             5
22   11   delimiter           ;
23   5    reserved keyword    LOOP
24   2    reserved keyword    IF
24   5    identifier          I
24   7    operator            <=
24   10   integer             0
24   12   reserved keyword    THEN
24   17   reserved keyword    EXIT
24   21   delimiter           ;
24   23   reserved keyword    END
24   26   delimiter           ;
25   9    identifier          FACTORIAL
25   18   delimiter           (
25   19   delimiter           )
25   20   delimiter           ;
26   9    reserved keyword    WRITE
26   14   delimiter           (
26   15   string              "FACTORIAL("
26   27   delimiter           ,
26   29   identifier          I
26   30   delimiter           ,
26   32   string              ") = "
26   38   delimiter           ,
26   40   identifier          ANSWER
26   46   delimiter           )
26   47   delimiter           ;
27   2    identifier          I
27   4    operator            :=
27   7    identifier          I
27   9    operator            -
27   11   integer             1
27   12   delimiter           ;
28   5    reserved keyword    END
28   8    delimiter           ;
29   1    reserved keyword    END
29   4    delimiter           ;

120 token(s), 0 error(s) found.
