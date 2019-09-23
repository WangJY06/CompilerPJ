#ifndef _LEXER_H_
#define _LEXER_H_

enum type {
	T_EOF,
	INTEGER,
	REAL,
	WS,
	RESERVED_KEY,
	ID,
	DELIMITER,
	OPERATOR,
	STRING,
	COMMENT, // ignored token
	DEFAULT  // ignored token
};

#define RESERVED_KEYWORDS (AND)|OR|IF|FOR

#endif
