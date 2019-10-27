Row  Col  Type                Token/Error
3    1    reserved keyword    PROGRAM
3    9    reserved keyword    IS
4    5    reserved keyword    VAR
4    9    identifier          A
4    10   delimiter           ,
4    12   identifier          B
4    14   delimiter           :
4    16   identifier          REAL
4    21   operator            :=
4    24   real                0.0
4    27   delimiter           ;
5    5    identifier          C
5    7    delimiter           :
5    9    identifier          REAL
5    14   operator            :=
5    17   real                0.0
5    20   delimiter           ;
6    1    reserved keyword    BEGIN
7    5    reserved keyword    WRITE
7    11   delimiter           (
7    12   string              "ENTER TWO REALS:"
7    30   delimiter           )
7    31   delimiter           ;
8    5    reserved keyword    READ
8    10   delimiter           (
8    11   identifier          A
8    12   delimiter           ,
8    14   identifier          B
8    15   delimiter           )
8    16   delimiter           ;
9    5    identifier          C
9    7    operator            :=
9    10   real                8.0
9    13   delimiter           ;
10   5    reserved keyword    WRITE
10   11   delimiter           (
10   12   string              "A="
10   16   delimiter           ,
10   18   identifier          A
10   19   delimiter           ,
10   21   string              ", B="
10   27   delimiter           ,
10   29   identifier          B
10   30   delimiter           ,
10   32   string              ", C="
10   38   delimiter           ,
10   40   identifier          C
10   41   delimiter           )
10   42   delimiter           ;
11   5    identifier          C
11   7    operator            :=
11   10   identifier          A
11   12   operator            -
11   14   delimiter           (
11   15   operator            -
11   16   identifier          B
11   17   delimiter           )
11   19   operator            +
11   21   identifier          C
11   22   delimiter           ;
12   5    identifier          C
12   7    operator            :=
12   10   identifier          C
12   12   operator            *
12   14   identifier          A
12   16   operator            +
12   18   integer             1
12   19   delimiter           ;
13   5    reserved keyword    WRITE
13   11   delimiter           (
13   13   operator            -
13   14   identifier          C
13   16   operator            /
13   17   delimiter           (
13   18   identifier          A
13   20   operator            +
13   22   integer             1
13   23   delimiter           )
13   24   delimiter           )
13   25   delimiter           ;
14   1    reserved keyword    END
14   4    delimiter           ;

82 token(s), 0 error(s) found.
