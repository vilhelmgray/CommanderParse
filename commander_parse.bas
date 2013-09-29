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
' 1 = a stone wall
' 2 = a locked door
' 3 = an old KEY
DIM legend(4) AS STRING = { "empty space", _
                            "a stone wall", _
                            "a locked door", _
                            "an old KEY" }
DIM map(9, 9) AS INTEGER = { { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }, _
                             { 1, 0, 1, 0, 0, 0, 0, 0, 0, 1 }, _ 
                             { 1, 0, 1, 1, 0, 1, 1, 1, 0, 1 }, _ 
                             { 1, 0, 1, 1, 0, 1, 1, 1, 1, 1 }, _ 
                             { 1, 0, 0, 0, 0, 0, 0, 0, 0, 2 }, _ 
                             { 1, 0, 1, 1, 1, 1, 1, 0, 1, 1 }, _ 
                             { 1, 0, 1, 0, 0, 0, 1, 0, 1, 1 }, _ 
                             { 1, 0, 1, 0, 3, 0, 0, 0, 0, 1 }, _ 
                             { 1, 0, 1, 0, 0, 0, 1, 1, 0, 1 }, _ 
                             { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 } }

' item in player's hand
DIM hand AS INTEGER = 0

WHILE 1=1
        ' Get command from player
        DIM cmd AS STRING
        INPUT "> ", cmd

        ' Capitalize all letters to make it easier to parse
        cmd = UCase(cmd)
        
        ' Parse command
        IF Left(cmd, 2) = "GO" THEN
                ' Get direction and trim off leading spaces
                DIM direction AS STRING = LTrim(Mid(cmd, 3))
                
                ' Parse direction
                IF Left(direction, 5) = "NORTH" THEN
                        IF map(yPos-1, xPos) = 0 THEN
                                yPos = yPos - 1
                        ELSE
                                PRINT "Your path is blocked by "; legend(map(yPos-1, xPos)); "." 
                        END IF
                ELSEIF Left(direction, 4) = "EAST" THEN
                        IF map(yPos, xPos+1) = 0 THEN
                                xPos = xPos + 1
                        ELSE
                                PRINT "Your path is blocked by "; legend(map(yPos, xPos+1)); "." 
                        END IF
                ELSEIF Left(direction, 5) = "SOUTH" THEN
                        IF map(yPos+1, xPos) = 0 THEN
                                yPos = yPos + 1
                        ELSE
                                PRINT "Your path is blocked by "; legend(map(yPos+1, xPos)); "." 
                        END IF
                ELSEIF Left(direction, 4) = "WEST" THEN
                        IF map(yPos, xPos-1) = 0 THEN
                                xPos = xPos - 1
                        ELSE
                                PRINT "Your path is blocked by "; legend(map(yPos, xPos-1)); "." 
                        END IF
                ELSE
                        PRINT "GO where?"
                END IF
        ELSEIF Left(cmd, 4) = "GRAB" THEN
                ' Get item name and trim off leading spaces
                DIM item AS STRING = LTrim(Mid(cmd, 5))
                
                ' Parse item
                IF Left(item, 3) = "KEY" THEN
                        ' Look around for a key
                        IF map(yPos-1, xPos) = 2 THEN
                                hand = 2
                                map(yPos-1, xPos) = 0
                        ELSEIF map(yPos, xPos+1) = 2 THEN
                                hand = 2
                                map(yPos, xPos+1) = 0
                        ELSEIF map(yPos+1, xPos) = 2 THEN
                                hand = 2
                                map(yPos+1, xPos) = 0
                        ELSEIF map(yPos, xPos-1) = 2 THEN
                                hand = 2
                                map(yPos, xPos-1) = 0
                        ELSE
                                PRINT "What KEY?"
                        END IF
                ELSE
                        PRINT "GRAB what?"
                END IF
        ELSEIF Left(cmd, 4) = "LOOK" THEN
                PRINT "You see "; legend(map(yPos-1, xPos)); " to the NORTH."
                PRINT "You see "; legend(map(yPos, xPos+1)); " to the EAST."
                PRINT "You see "; legend(map(yPos+1, xPos)); " to the SOUTH."
                PRINT "You see "; legend(map(yPos, xPos-1)); " to the WEST."
        ELSEIF Left(cmd, 4) = "HELP" THEN
                PRINT "The following commands are available:"
                PRINT "    GO      - Move in a specified direction"
                PRINT "    GRAB    - Grab a specified item"
                PRINT "    LOOK    - Look around current position"
                PRINT "    HELP    - Display this help"
                PRINT "    QUIT    - Quit from the game"
        ELSEIF Left(cmd, 4) = "QUIT" THEN
                PRINT "Bye!"
                EXIT WHILE
        ELSE
                PRINT "You cannot "; cmd; "."
        END IF
WEND
