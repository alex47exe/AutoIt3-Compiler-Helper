### AutoIt3 Compiler Helper

A small AutoIt3 script I wrote to help me include all required files for my compiled AutoIt3 projects. 

------

**Requirements:**

1. *AutoIt3* and *AutoIt3 Script Editor* from [https://www.autoitscript.com](https://www.autoitscript.com)
2. An AutoIt3 script - we'll call it *your_script_name.au3* - that you would like to compile

------

**Instructions:**

1. Copy the script next to *your_script_name.au3* and rename it to, you guessed it, *your_script_name.COMPILED.au3*
2. Run it and wait for it to scan for files/folders which should be included  with your compiled project. It can take a few minutes to scan and check the files/folders (up to 10th subfolder level) for complex AutoIt3 projects
3. You can copy/delete other files/folders (not properly detected) using the function *_Files_Manual()* at line 183 - you know how if you're into AutoIt3
4. After doing its magic, you'll have your complete compiled project inside *_COMPILED 'your_script_name.au3'* folder

------

