
# name: shi qiu
# PSUid: sbq5043/952826527
# project 1

# purpose:
# creates a Parser object and run

#get code idea from canvas parser.py


#from curses.ascii import isalpha


WEBPACK, STRING, LISTITEM, BOLDED, ITALICIZED, UNORDERED, R_WEBPACK, R_LISTITEM, R_BOLDED, R_ITALICIZED, R_UNORDERED, EOI, INVALID = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13

def typeToString (tp):
    if (tp == WEBPACK): return "Webpack"
    elif (tp == STRING): return "String"
    elif (tp == LISTITEM): return "ListItem"
    elif (tp == BOLDED): return "Bolded"
    elif (tp == ITALICIZED): return "Italicized"
    elif (tp == UNORDERED): return "Unordered"
    elif (tp == R_WEBPACK): return "STRING"
    elif (tp == R_LISTITEM): return "ListItem"
    elif (tp == R_BOLDED): return "Bolded"
    elif (tp == R_ITALICIZED): return "Italicized"
    elif (tp == R_UNORDERED): return "Unordered"
    return "Invalid"


class Token:
    #print("Token Class")


    def __init__(self, type, val):
      self.type=type;
      self.val=val;
      
    def getTokenType(self):
      return self.type;

    def getTokenValue(self):
      return self.val;

    def __repr__(self):
        if (self.type == STRING): 
            return self.val
        elif (self.type == WEBPACK):
            return "<body>"
        elif (self.type == LISTITEM):
            return "<li>"
        elif (self.type == BOLDED):
            return "<b>"
        elif (self.type == ITALICIZED):
            return "<i>"
        elif (self.type == UNORDERED):
            return "<ul>"
        elif (self.type == R_WEBPACK):
            return "</body>"
        elif (self.type == R_LISTITEM):
            return "</li>"
        elif (self.type == R_BOLDED):
            return "</b>"
        elif (self.type == R_ITALICIZED):
            return "</i>"
        elif (self.type == R_UNORDERED):
            return "</ul>"
        elif (self.type == EOI):
            return ""

LETTERS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS = "0123456789"

class Lexer:

    def __init__(self, s):
        #print("Lexer Class")
        self.s=s;
        self.count=0;
        self.nextChar();
        #self.count=0;

    def nextChar(self):
        self.ch = self.s[self.count] 
        self.count = self.count + 1

    def nextToken(self):
        while True:
            #print(test)
            if self.ch=="<":
                self.nextChar()
                if self.ch=="b":#body or bolded
                    self.nextChar()
                    if self.ch=="o":#make sure it is <body>
                        self.nextChar()
                        self.nextChar()
                        self.nextChar()
                        return Token(WEBPACK,"")
                    else : #make sure it is <b>
                        self.nextChar()
                        return Token(BOLDED,"")
                elif self.ch=="i":#make sure it is <body>
                    self.nextChar()
                    return Token(ITALICIZED,"")
                elif self.ch=="u":
                    self.nextChar()
                    self.nextChar()
                    return Token(UNORDERED,"")
                elif self.ch=="l":
                    self.nextChar()
                    self.nextChar()
                    return Token(LISTITEM,"")
                elif self.ch=="/":
                    self.nextChar()
                    if self.ch=="b":
                        self.nextChar()
                        if self.ch=="o":
                            self.nextChar()
                            self.nextChar()
                            self.nextChar()
                            return Token(R_WEBPACK,"")
                        else: 
                            self.nextChar()
                            return Token(R_BOLDED,"")
                    elif self.ch=="i":
                        self.nextChar()
                        return Token(R_ITALICIZED,"")
                    elif self.ch=="u":
                        self.nextChar()
                        self.nextChar()
                        return Token(R_UNORDERED,"")
                    else:
                        self.nextChar()
                        self.nextChar()
                        return Token(R_LISTITEM,"")
            elif self.ch.isdigit()|self.ch.isalpha():
                sTRING = self.consumeChars(LETTERS+DIGITS)
                return Token(STRING, sTRING)
            elif self.ch=='$':
                return Token(EOI,"")
            elif self.ch==' ': self.nextChar()
            else:
                self.nextChar()
                return Token(INVALID, self.ch)




    def consumeChars (self, charSet):#get all following characters and numbers in this token
        r = self.ch
        self.nextChar()
        while (self.ch in charSet):
            r = r + self.ch
            self.nextChar()
        return r

import sys

class Parser:
    def __init__(self, s):
        self.lexer = Lexer(s+"$")
        self.token = self.lexer.nextToken()
        self.countTab=1;

    def run(self):
        #print("<body>")
        self.lexer.nextToken()
        while True:
            self.lexer.nextToken()
            if self.token.getTokenType() == STRING:
                val = self.match(STRING)
                print("\t"*self.countTab+val)
            elif self.token.getTokenType() == WEBPACK:
                print("<body>")
            elif self.token.getTokenType() == LISTITEM:
                self.countTab += 1;
                print("\t"*self.countTab+"<li>")
            elif self.token.getTokenType() == BOLDED:
                self.countTab += 1;
                print("\t"*self.countTab+"<b>")
            elif self.token.getTokenType() == ITALICIZED:
                self.countTab += 1;
                print("\t"*self.countTab+"<i>")
            elif self.token.getTokenType() == UNORDERED:
                self.countTab += 1;
                print("\t"*self.countTab+"<ul>")
            elif self.token.getTokenType() == R_LISTITEM:
                self.countTab -= 1;
                print("\t"*self.countTab+"</li>")
            elif self.token.getTokenType() == R_UNORDERED:
                self.countTab -= 1;
                print("\t"*self.countTab+"</li>")
            elif self.token.getTokenType() == R_ITALICIZED:
                self.countTab -= 1;
                print("\t"*self.countTab+"</li>")
            elif self.token.getTokenType() == R_BOLDED:
                self.countTab -= 1;
                print("\t"*self.countTab+"</li>")
            elif self.token.getTokenType() == R_WEBPACK:
                self.countTab -= 1;
                print("\t"*self.countTab+"</li>")
            else:
                print("Syntax error: " \
                    + "saw:" \
                    + typeToString(self.token.getTokenType()))
                break
            self.token = self.lexer.nextToken()




    def error(self, tp):
        print ("Syntax error: expecting: " + typeToString(tp) \
               + "; saw: " + typeToString(self.token.getTokenType()))
        sys.exit(1)



    def match (self, tp):
        val = self.token.getTokenValue()
        if (self.token.getTokenType() == tp):
            self.token = self.lexer.nextToken()
        else: self.error(tp)
        return val



      



#print("This line will be printed.")
parser = Parser ("<body> google <b><i><b> yahoo</b></i></b></body>");
parser.run();
