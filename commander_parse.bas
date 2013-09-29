' Copyright (c) 2013, William Breathitt Gray
' All rights reserved.
' 
' Redistribution and use in source and binary forms, with or without modification,
' are permitted provided that the following conditions are met:
' 
'   Redistributions of source code must retain the above copyright notice, this
'   list of conditions and the following disclaimer.
' 
'   Redistributions in binary form must reproduce the above copyright notice, this
'   list of conditions and the following disclaimer in the documentation and/or
'   other materials provided with the distribution.
' 
' THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
' ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
' WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
' DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
' ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
' (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
' LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
' ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
' (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
' SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

DIM xPos AS INTEGER = 1
DIM yPos AS INTEGER = 1

' MAP LEGEND:
' 0 = empty space
' 1 = wall
' 2 = player
' 3 = locked door
' 4 = key
DIM map(9, 9) AS INTEGER = { { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }, _
                             { 1, 2, 1, 0, 0, 0, 0, 0, 0, 1 }, _ 
                             { 1, 0, 1, 1, 0, 1, 1, 1, 0, 1 }, _ 
                             { 1, 0, 1, 1, 0, 1, 1, 1, 1, 1 }, _ 
                             { 1, 0, 0, 0, 0, 0, 0, 0, 0, 3 }, _ 
                             { 1, 0, 1, 1, 1, 1, 1, 0, 1, 1 }, _ 
                             { 1, 0, 1, 0, 0, 0, 1, 0, 1, 1 }, _ 
                             { 1, 0, 1, 0, 4, 0, 0, 0, 0, 1 }, _ 
                             { 1, 0, 1, 0, 0, 0, 1, 1, 0, 1 }, _ 
                             { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 } }

WHILE 1=1
        ' Get command from player
        DIM cmd AS STRING
        INPUT "> ", cmd

        ' Capitalize all letters to make it easier to parse
        cmd = UCase(cmd)
        
        IF Left(cmd, 4) = "HELP" THEN
                PRINT "The following commands are available:"
                PRINT "    HELP    - Prints this help page"
                PRINT "    QUIT    - Quits from the game"
        ELSEIF Left(cmd, 4) = "QUIT" THEN
                PRINT "Bye!"
                EXIT WHILE
        ELSE
                PRINT "You cannot "; cmd; "."
        END IF
WEND
