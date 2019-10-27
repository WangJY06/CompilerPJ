Row  Col  Type                Token/Error
4    1    reserved keyword    PROGRAM
4    9    reserved keyword    IS
5    5    reserved keyword    VAR
5    9    identifier          I
5    10   delimiter           ,
5    12   identifier          ANSWER
5    19   delimiter           :
5    21   identifier          INTEGER
5    29   operator            :=
5    32   integer             0
5    33   delimiter           ;
6    5    reserved keyword    PROCEDURE
6    15   identifier          FACTORIAL
6    24   delimiter           (
6    25   delimiter           )
6    27   reserved keyword    IS
7    2    reserved keyword    VAR
7    6    identifier          J
7    8    delimiter           :
7    10   identifier          INTEGER
7    18   operator            :=
7    21   integer             0
7    22   delimiter           ;
8    2    reserved keyword    PROCEDURE
9    11   identifier          FACT
9    15   delimiter           (
9    16   delimiter           )
9    18   reserved keyword    IS
9    21   reserved keyword    BEGIN
10   6    reserved keyword    IF
10   9    identifier          J
10   11   operator            <=
10   14   identifier          I
10   16   reserved keyword    THEN
10   21   identifier          MULT
10   25   delimiter           (
10   26   delimiter           )
10   27   delimiter           ;
10   29   identifier          J
10   31   operator            :=
10   34   identifier          J
10   36   operator            +
10   38   integer             1
10   39   delimiter           ;
10   41   identifier          FACT
10   45   delimiter           (
10   46   delimiter           )
10   47   delimiter           ;
10   49   reserved keyword    END
10   52   delimiter           ;
11   4    reserved keyword    END
11   7    delimiter           ;
12   4    identifier          MULT
12   8    delimiter           (
12   9    delimiter           )
12   11   reserved keyword    IS
13   6    reserved keyword    VAR
13   10   identifier          I
13   12   delimiter           :
13   14   identifier          INTEGER
13   22   operator            :=
13   25   integer             0
13   26   delimiter           ;
14   4    reserved keyword    BEGIN
15   6    identifier          I
15   8    operator            :=
15   11   identifier          ANSWER
15   17   delimiter           ;
16   13   identifier          I
16   15   operator            :=
16   18   identifier          I
16   20   operator            *
16   22   identifier          J
16   23   delimiter           ;
17   13   identifier          ANSWER
17   20   operator            :=
17   23   identifier          I
17   24   delimiter           ;
18   4    reserved keyword    END
18   7    delimiter           ;
19   5    reserved keyword    BEGIN
20   2    identifier          ANSWER
20   9    operator            :=
20   12   integer             1
20   13   delimiter           ;
21   2    identifier          J
21   4    operator            :=
21   7    integer             1
21   8    delimiter           ;
22   2    identifier          FACT
22   6    delimiter           (
22   7    delimiter           )
22   8    delimiter           ;
23   5    reserved keyword    END
23   8    delimiter           ;
24   1    reserved keyword    BEGIN
25   5    reserved keyword    WRITE
25   11   delimiter           (
25   12   string              "The first 5 factorials are (in ascending order):"
25   62   delimiter           )
25   63   delimiter           ;
26   5    identifier          I
26   7    operator            :=
26   10   integer             1
26   11   delimiter           ;
27   5    reserved keyword    LOOP
28   2    reserved keyword    IF
28   5    identifier          I
28   7    operator            >
28   9    integer             5
28   11   reserved keyword    THEN
28   16   reserved keyword    EXIT
28   20   delimiter           ;
28   22   reserved keyword    END
28   25   delimiter           ;
29   9    identifier          FACTORIAL
29   18   delimiter           (
29   19   delimiter           )
29   20   delimiter           ;
30   9    reserved keyword    WRITE
30   14   delimiter           (
30   15   string              "FACTORIAL("
30   27   delimiter           ,
30   29   identifier          I
30   30   delimiter           ,
30   32   string              ") = "
30   38   delimiter           ,
30   40   identifier          ANSWER
30   46   delimiter           )
30   47   delimiter           ;
31   2    identifier          I
31   4    operator            :=
31   7    identifier          I
31   9    operator            +
31   11   integer             1
31   12   delimiter           ;
32   5    reserved keyword    END
32   8    delimiter           ;
33   1    reserved keyword    END
33   4    delimiter           ;

140 token(s), 0 error(s) found.
