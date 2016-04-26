%SystemRoot%\System32\reg.exe ADD "HKEY_CLASSES_ROOT\*\shell\Tab Edit with &Vim"
%SystemRoot%\System32\reg.exe ADD "HKEY_CLASSES_ROOT\*\shell\Tab Edit with &Vim\command" /ve /d "\"D:\\Vim\\vim74\\gvim.exe\" -p --remote-tab-silent \"%%1\" \"%%*\"" /f
