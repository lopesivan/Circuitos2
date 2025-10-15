; Caminho para o msys.bat
msysBat := "C:\Program Files\Git\git-bash.exe"
; Executa o MSYS
Run, %msysBat%
MYLOCAL:="MINGW32:/c/Documents and Settings/Administrator/My Documents/Tina/02-exemplo"
; Espera a janela com título MINGW32:~ aparecer
WinWait, %MYLOCAL%
; Dá um tempinho extra pra garantir que o shell carregou
Sleep, 1500
; Limpa arquivos não rastreados
ControlSend,, git clean -dfx{Enter}, %MYLOCAL%
; Aguarda um pouco
Sleep, 500
; Reseta mudanças no repositório
ControlSend,, git reset --hard{Enter}, %MYLOCAL%
