*** Settings ***
Suite Setup      Run Tests    ${EMPTY}    standard_libraries/process/start_process_preferences.robot
Resource         atest_resource.robot

*** Variables ***
${COMMAND}       python -c "import os; print os.path.abspath(os.curdir);"

*** Test Cases ***
Explicitly run Operating System library keyword
    ${test}=    Check Test Case    ${TESTNAME}
    Check Keyword Data    ${test.kws[0]}    OperatingSystem.Start Process    \${handle}    ${COMMAND}

Explicitly run Process library keyword
    ${test}=    Check Test Case    ${TESTNAME}
    Check Keyword Data    ${test.kws[0]}    Process.Start Process    \${handle}    ${COMMAND}, shell=True

Implicitly run Process library keyword
    ${test}=    Check Test Case    ${TESTNAME}
    Check Keyword Data    ${test.kws[0]}    Process.Start Process    \${handle}    ${COMMAND}, shell=True

Implicitly run Operating System library keyword when library search order is set
    ${test}=    Check Test Case    ${TESTNAME}
    Check Keyword Data    ${test.kws[1]}    OperatingSystem.Start Process    \${handle}    ${COMMAND}

Process switch
    Check Test Case    ${TESTNAME}
