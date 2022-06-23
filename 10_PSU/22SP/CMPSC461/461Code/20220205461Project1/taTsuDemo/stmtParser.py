# authored by Gang Tan; all rights reserved; do not distribute

import json
from codecs import open
from pprint import pprint

import tatsu

def simple_parse():
    grammar = open('stmt_annot.ebnf').read()

    parser = tatsu.compile(grammar)

    try:
        ast = parser.parse('x := 1; y:=x')

        print('# JSON')
        print(json.dumps(ast, indent=4))
    except tatsu.exceptions.ParseError as e: # catch all exceptions
        print("syntax error", e)

def main():
    simple_parse()


if __name__ == '__main__':
    main()
