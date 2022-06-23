# CMPSC 311 Introduction 

# to Systems Programming 

### UNIX Essentials 

## Professors: 

SencunZhu and Suman Saha (Slides are mostly by _ProfessorPatrick McDaniel_ and _ProfessorAbutalib Aghayev_ ) 

---

## The Unix Philosophy 

- Write programs that do one thing and do it well. 

- Write programs to work together. 

- Write programs to handle text streams, because that is a universal interface. 

- Doug McIlroy, Unix patriarch 

- More general programming principles: 

- KISS –“Keep it simple, stupid” 

- Modularity –thinking in terms of components 

- Composability –thinking in terms of interacting components 

- Tr a n s p a r e n c y –making inspection and debugging easier 

- etc... 

---

## Command line interface 

- Command line? Why? 

- Efficient and powerful 

- Scriptable 

- Simple and reliable 

- Always works... even if     everything else is b0rked! 

- What is it? 

- Shell program (“bash” on Linux) 

- Interprets built-in commands 

- Runs other programs 

- Runs shell scripts 

---

## Standard filesystem layout 

- Grouped by type 

- / root directory of the entire filesystem 

- /usr installed software 

- /usr/bin, /usr/lib,... 

- /etc configuration 

- /home users’ own files 

- /dev devices 

- /tmp temporary files 

---

## Root (administrator) 

- Files in Unix have owners 

- Users can (usually) only touch their files 

- Root (Super User) can do anything 

- "Becoming root" 

- Administrative privileges: _su_ 

- Temporar y privileges (per command):     _sudo_ (su“do”) 

CMPSC 311 -Introduction to Systems Programming https://xkcd.com/149/ https://xkcd.com/838 

 We trust you have received the usual lecture from the local System Administrator. It usually boils down to these three things:#1) Respect the privacy of others. #2) Think before you type.#3) With great power comes great responsibility. 

