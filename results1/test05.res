Row  Col  Type                Token/Error
3    1    reserved keyword    PROGRAM
3    9    reserved keyword    IS
4    5    reserved keyword    VAR
4    9    identifier          I
4    11   delimiter           :
4    13   identifier          INTEGER
4    21   operator            :=
4    24   integer             0
4    25   delimiter           ;
5    5    reserved keyword    TYPE
5    10   identifier          COMPLEX
5    18   reserved keyword    IS
5    21   reserved keyword    RECORD
5    28   identifier          R
5    29   delimiter           :
5    31   identifier          REAL
5    35   delimiter           ;
5    37   identifier          I
5    39   delimiter           :
5    41   identifier          REAL
5    45   delimiter           ;
5    47   reserved keyword    END
5    50   delimiter           ;
6    5    reserved keyword    TYPE
6    10   identifier          PAIR
6    15   reserved keyword    IS
6    18   reserved keyword    RECORD
6    25   identifier          FIRST
6    30   delimiter           :
6    32   identifier          COMPLEX
6    39   delimiter           ;
6    41   identifier          SECOND
6    48   delimiter           :
6    50   identifier          COMPLEX
6    57   delimiter           ;
6    59   reserved keyword    END
6    62   delimiter           ;
7    5    reserved keyword    VAR
7    9    identifier          C
7    11   delimiter           :
7    13   identifier          COMPLEX
7    21   operator            :=
7    24   identifier          COMPLEX
7    32   delimiter           {
7    34   identifier          R
7    36   operator            :=
7    39   real                0.0
7    42   delimiter           ;
7    44   identifier          I
7    46   operator            :=
7    49   real                0.0
7    53   delimiter           }
7    54   delimiter           ;
8    5    reserved keyword    VAR
8    9    identifier          P
8    11   delimiter           :
8    13   identifier          PAIR
8    18   operator            :=
8    21   identifier          PAIR
8    26   delimiter           {
8    28   identifier          FIRST
8    34   operator            :=
8    37   identifier          COMPLEX
8    45   delimiter           {
8    47   identifier          R
8    49   operator            :=
8    52   real                0.0
8    55   delimiter           ;
8    57   identifier          I
8    59   operator            :=
8    62   real                0.0
8    66   delimiter           }
8    67   delimiter           ;
9    28   identifier          SECOND
9    35   operator            :=
9    38   identifier          COMPLEX
9    46   delimiter           {
9    48   identifier          R
9    50   operator            :=
9    53   real                0.0
9    56   delimiter           ;
9    58   identifier          I
9    60   operator            :=
9    63   real                0.0
9    67   delimiter           }
9    69   delimiter           }
9    70   delimiter           ;
10   5    reserved keyword    PROCEDURE
10   15   identifier          PRINT
10   20   delimiter           (
10   21   delimiter           )
10   23   reserved keyword    IS
10   26   reserved keyword    BEGIN
11   2    reserved keyword    WRITE
11   7    delimiter           (
11   8    string              "    ("
11   15   delimiter           ,
11   17   identifier          C
11   18   delimiter           .
11   19   identifier          R
11   20   delimiter           ,
11   22   string              ", "
11   26   delimiter           ,
11   28   identifier          C
11   29   delimiter           .
11   30   identifier          I
11   31   delimiter           ,
11   33   string              ")"
11   36   delimiter           )
11   37   delimiter           ;
12   5    reserved keyword    END
12   8    delimiter           ;
13   1    reserved keyword    BEGIN
14   5    identifier          C
14   6    delimiter           .
14   7    identifier          R
14   9    operator            :=
14   12   real                1.0
14   15   delimiter           ;
15   5    identifier          C
15   6    delimiter           .
15   7    identifier          I
15   9    operator            :=
15   12   real                0.0
15   15   delimiter           ;
16   5    identifier          P
16   6    delimiter           .
16   7    identifier          FIRST
16   13   operator            :=
16   16   identifier          C
16   17   delimiter           ;
17   5    identifier          C
17   6    delimiter           .
17   7    identifier          R
17   9    operator            :=
17   12   real                0.0
17   15   delimiter           ;
18   5    identifier          C
18   6    delimiter           .
18   7    identifier          I
18   9    operator            :=
18   12   real                1.0
18   15   delimiter           ;
19   5    identifier          P
19   6    delimiter           .
19   7    identifier          SECOND
19   14   operator            :=
19   17   identifier          C
19   18   delimiter           ;
20   5    identifier          C
20   7    operator            :=
20   10   identifier          P
20   11   delimiter           .
20   12   identifier          FIRST
20   17   delimiter           ;
21   5    reserved keyword    WRITE
21   11   delimiter           (
21   12   string              "The first complex number should be (1.0, 0.0):"
21   60   delimiter           )
21   61   delimiter           ;
22   5    identifier          PRINT
22   10   delimiter           (
22   11   delimiter           )
22   12   delimiter           ;
23   5    identifier          C
23   7    operator            :=
23   10   identifier          P
23   11   delimiter           .
23   12   identifier          SECOND
23   18   delimiter           ;
24   5    reserved keyword    WRITE
24   11   delimiter           (
24   12   string              "The second complex number should be (0.0, 1.0):"
24   61   delimiter           )
24   62   delimiter           ;
25   5    identifier          PRINT
25   10   delimiter           (
25   11   delimiter           )
25   12   delimiter           ;
26   5    reserved keyword    IF
26   8    identifier          P
26   9    delimiter           .
26   10   identifier          FIRST
26   15   delimiter           .
26   16   identifier          R
26   18   operator            <>
26   21   identifier          P
26   22   delimiter           .
26   23   identifier          SECOND
26   29   delimiter           .
26   30   identifier          R
26   32   reserved keyword    THEN
27   2    reserved keyword    WRITE
27   8    delimiter           (
27   9    string              "and these two complex numbers are not equal!"
27   55   delimiter           )
27   56   delimiter           ;
28   5    reserved keyword    ELSIF
28   11   identifier          P
28   12   delimiter           .
28   13   identifier          FIRST
28   18   delimiter           .
28   19   identifier          I
28   21   operator            <>
28   24   identifier          P
28   25   delimiter           .
28   26   identifier          SECOND
28   32   delimiter           .
28   33   identifier          I
28   35   reserved keyword    THEN
29   2    reserved keyword    WRITE
29   8    delimiter           (
29   9    string              "and these two complex numbers are not equal!"
29   55   delimiter           )
29   56   delimiter           ;
30   5    reserved keyword    ELSE
31   2    reserved keyword    WRITE
31   8    delimiter           (
31   9    string              "and these two complex numbers are equal?"
31   51   delimiter           )
31   52   delimiter           ;
32   5    reserved keyword    END
32   8    delimiter           ;
33   1    reserved keyword    END
33   4    delimiter           ;

225 token(s), 0 error(s) found.
