Row  Col  Type                Token/Error
2    1    reserved keyword    PROGRAM
2    9    reserved keyword    IS
3    5    reserved keyword    VAR
3    9    identifier          A
3    10   delimiter           ,
3    12   identifier          B
3    14   delimiter           :
3    16   identifier          REAL
3    21   operator            :=
3    24   real                0.0
3    27   delimiter           ;
4    5    reserved keyword    VAR
4    9    identifier          I
4    10   delimiter           ,
4    12   identifier          J
4    14   delimiter           :
4    16   identifier          INTEGER
4    24   operator            :=
4    27   integer             0
4    28   delimiter           ;
5    1    reserved keyword    BEGIN
6    5    identifier          A
6    7    operator            :=
6    10   real                5.0
6    13   delimiter           ;
7    5    identifier          I
7    7    operator            :=
7    10   operator            -
7    11   integer             3
7    12   delimiter           ;
8    5    identifier          J
8    7    operator            :=
8    10   identifier          I
8    12   operator            *
8    14   integer             10
8    16   delimiter           ;
9    5    identifier          B
9    7    operator            :=
9    10   identifier          A
9    12   operator            +
9    14   identifier          I
9    15   delimiter           ;
10   5    identifier          A
10   7    operator            :=
10   10   identifier          J
10   12   operator            /
10   14   identifier          B
10   15   delimiter           ;
11   5    identifier          J
11   7    operator            :=
11   10   identifier          I
11   12   operator            -
11   14   identifier          J
11   15   delimiter           ;
12   5    identifier          I
12   7    operator            :=
12   10   identifier          J
12   12   operator            /
12   14   identifier          I
12   15   delimiter           ;
13   5    identifier          B
13   7    operator            :=
13   10   identifier          I
13   12   operator            -
13   14   identifier          B
13   15   delimiter           ;
14   5    reserved keyword    WRITE
14   11   delimiter           (
14   13   string              " A = "
14   20   delimiter           ,
14   22   operator            -
14   23   identifier          A
14   24   delimiter           ,
14   26   string              " | B = "
14   35   delimiter           ,
14   37   identifier          B
14   38   delimiter           )
14   39   delimiter           ;
15   5    reserved keyword    WRITE
15   11   delimiter           (
15   13   string              ""
15   16   delimiter           )
15   17   delimiter           ;
16   5    reserved keyword    WRITE
16   11   delimiter           (
16   13   string              " I = "
16   20   delimiter           ,
16   22   identifier          I
16   23   delimiter           ,
16   25   string              " |  J = "
16   35   delimiter           ,
16   37   identifier          J
16   39   delimiter           )
16   40   delimiter           ;
18   1    reserved keyword    END
18   4    delimiter           ;

96 token(s), 0 error(s) found.
