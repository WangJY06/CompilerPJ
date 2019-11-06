Row  Col  Type                Token/Error
3    1    reserved keyword    PROGRAM
3    9    reserved keyword    IS
4    5    reserved keyword    VAR
4    9    identifier          I
4    10   delimiter           ,
4    11   identifier          J
4    13   delimiter           :
4    15   identifier          INTEGER
4    23   operator            :=
4    26   integer             0
4    27   delimiter           ;
5    1    reserved keyword    BEGIN
6    2    reserved keyword    WRITE
6    7    delimiter           (
6    8    string              "Ascending loop:"
6    25   delimiter           )
6    26   delimiter           ;
7    2    reserved keyword    FOR
7    6    identifier          I
7    8    operator            :=
7    11   integer             1
7    13   reserved keyword    TO
7    16   integer             5
7    18   reserved keyword    DO
8    4    reserved keyword    WRITE
8    9    delimiter           (
8    10   string              "I = "
8    16   delimiter           ,
8    18   identifier          I
8    19   delimiter           )
8    20   delimiter           ;
9    9    reserved keyword    END
9    12   delimiter           ;
10   2    reserved keyword    WRITE
10   7    delimiter           (
10   8    string              "Descending loop:"
10   26   delimiter           )
10   27   delimiter           ;
11   2    reserved keyword    FOR
11   6    identifier          I
11   8    operator            :=
11   11   integer             5
11   13   reserved keyword    TO
11   16   integer             1
11   18   reserved keyword    BY
11   21   operator            -
11   22   integer             1
11   24   reserved keyword    DO
12   4    reserved keyword    WRITE
12   9    delimiter           (
12   10   string              "I = "
12   16   delimiter           ,
12   18   identifier          I
12   19   delimiter           )
12   20   delimiter           ;
13   9    reserved keyword    END
13   12   delimiter           ;
14   2    reserved keyword    WRITE
14   7    delimiter           (
14   8    string              "Double loop:"
14   22   delimiter           )
14   23   delimiter           ;
15   2    reserved keyword    FOR
15   6    identifier          I
15   8    operator            :=
15   11   integer             1
15   13   reserved keyword    TO
15   16   integer             5
15   18   reserved keyword    DO
16   6    reserved keyword    FOR
16   10   identifier          J
16   12   operator            :=
16   15   identifier          I
16   17   reserved keyword    TO
16   20   identifier          I
16   21   operator            +
16   22   integer             10
16   25   reserved keyword    BY
16   28   integer             2
16   30   reserved keyword    DO
17   8    reserved keyword    WRITE
17   13   delimiter           (
17   14   string              "I,J = "
17   22   delimiter           ,
17   24   identifier          I
17   25   delimiter           ,
17   27   string              ", "
17   31   delimiter           ,
17   33   identifier          J
17   34   delimiter           )
17   35   delimiter           ;
18   11   reserved keyword    END
18   14   delimiter           ;
19   9    reserved keyword    END
19   12   delimiter           ;
20   1    reserved keyword    END
20   4    delimiter           ;

97 token(s), 0 error(s) found.
