*** Settings ***

Library         DiffLibrary

*** Keywords ***

Compare file
    [Arguments]    ${file1}    ${file2}

    ${diff_file}    Diff Files    file1=${file1}    file2=${file2}    fail=${True}
    RETURN   ${diff_file}