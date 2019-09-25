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
	UNKNOWN, // ignored token
	ERROR    // 
};

#endif
