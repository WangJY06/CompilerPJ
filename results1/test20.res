Row  Col  Type                Token/Error
1    31   ERROR               [Integer out of range]
4    1    real                123456789012345678901234567890.0
6    43   ERROR               [Strings may not contain tabs or newlines]
9    1    ERROR               [String literals are limited to 255 characters in length]
12   1    string              "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345"
15   1    string              ""
18   1    ERROR               [Identifiers are limited to 255 characters in length]
21   1    identifier          x12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234
24   1    identifier          if
24   4    identifier          x
24   5    operator            <
24   6    integer             7
24   7    identifier          then
24   12   identifier          y
24   13   operator            :=
24   15   identifier          y
24   16   operator            +
24   17   integer             17
27   1    real                123.
27   5    identifier          x
30   1    ERROR               [Bad character: ]
32   1    identifier          xx
33   10   identifier          yy
37   1    ERROR               [Strings must be terminated]
39   1    ERROR               [Comments must be terminated]

18 token(s), 7 error(s) found.
