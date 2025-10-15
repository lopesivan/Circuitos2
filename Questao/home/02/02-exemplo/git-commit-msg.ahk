; Git Commit com mensagem customizável
; Uso: Execute o script e digite a mensagem quando solicitado

; Caminho para o msys.bat
msysBat := "C:\Program Files\Git\git-bash.exe"

; Solicita mensagem do commit
InputBox, commitMsg, Git Commit, Digite a mensagem do commit:, , 400, 130
if ErrorLevel
    ExitApp

; Se mensagem vazia, usa "wip"
if (commitMsg = "")
    commitMsg := "wip"

; Executa o MSYS
Run, %msysBat%
MYLOCAL:="MINGW32:/c/Documents and Settings/Administrator/My Documents/Tina/02-exemplo"

; Espera a janela aparecer
WinWait, %MYLOCAL%
Sleep, 1500

; Envia o comando com a mensagem
ControlSend,, git commit -m "%commitMsg%"{Enter}, %MYLOCAL%
