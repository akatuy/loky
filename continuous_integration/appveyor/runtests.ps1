# This script is meant to be called by the "test" step defined in
# appveyor.yml. See http://appveyor.com/docs for more details.
# Authors: Thomas Moreau
# License: 3-clause BSD

$VERSION=(27, 33, 36)

function TestPythonVersions () {
    Write-Host $PYTHON
    ForEach($ver in $VERSION){
        python ./continuous_integration/appveyor/tox -e py$ver -- -vlx --timeout=15
        If( $LASTEXITCODE -ne 0){
            Exit 1
        }
    }
    Exit 0
}

TestPythonVersions
