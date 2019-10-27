Row  Col  Type                Token/Error
3    1    reserved keyword    PROGRAM
3    9    reserved keyword    IS
4    5    reserved keyword    PROCEDURE
4    15   identifier          FOO
4    18   delimiter           (
4    19   identifier          X
4    20   delimiter           :
4    22   identifier          INT
4    25   delimiter           ;
4    27   identifier          Y
4    28   delimiter           :
4    30   identifier          REAL
4    34   delimiter           )
4    35   delimiter           :
4    36   identifier          REAL
4    41   reserved keyword    IS
5    7    reserved keyword    PROCEDURE
5    17   identifier          BAR
5    20   delimiter           (
5    21   delimiter           )
5    23   reserved keyword    IS
5    26   reserved keyword    BEGIN
5    32   identifier          Y
5    34   operator            :=
5    37   identifier          X
5    39   operator            +
5    41   real                1.0
5    44   delimiter           ;
5    46   reserved keyword    END
5    49   delimiter           ;
6    7    reserved keyword    BEGIN
7    9    identifier          BAR
7    12   delimiter           (
7    13   delimiter           )
7    14   delimiter           ;
8    2    reserved keyword    RETURN
8    9    identifier          Y
8    10   delimiter           ;
9    7    reserved keyword    END
9    10   delimiter           ;
10   5    reserved keyword    VAR
10   9    identifier          C
10   11   delimiter           :
10   13   identifier          REAL
10   18   operator            :=
10   21   integer             0
10   22   delimiter           ;
11   1    reserved keyword    BEGIN
12   5    identifier          C
12   7    operator            :=
12   10   identifier          FOO
12   13   delimiter           (
12   14   integer             3
12   15   delimiter           ,
12   17   real                2.0
12   20   delimiter           )
12   21   delimiter           ;
13   5    reserved keyword    WRITE
13   10   delimiter           (
13   11   string              "C = "
13   17   delimiter           ,
13   19   identifier          C
13   20   delimiter           ,
13   22   string              " (should be 4.0)"
13   40   delimiter           )
13   41   delimiter           ;
14   1    reserved keyword    END
14   4    delimiter           ;

68 token(s), 0 error(s) found.
