# PwshTestImports

This is a project for trying a bunch of different module interdependencies. I've been experimenting with pwsh module structures with a single psm1 file, supported by many ps1 files internally. This project is to test some of the cases around this structure, specifically if Pester cleans up everything as expected.

### Running Tests

```
.\Run-Tests.ps1
```

### File Naming Conventions:

#### Modules and Scripts

The contents of the modules and scripts for the most part match their names. File Z.ps1 contains an alias Test-AliasZ, as well as a function, Test-AliasZ. This is generally but not universally true.

The psm1 files are named for beginning letters of the alphabet, ie A.psm1, B.psm1, etc. The psm1 files are named after the end letters of the alphabet, ie Z.ps1, Y.ps1, X.ps1. If a file imports (by import, we mean using either dot-source or Import-Module) another file, it will be added in the name using a dash '-'. So X-Z.ps1 is a ps1 module containing a Test-AliasX and Test-AliasX and also importing Z.ps1.

V.ps1, W.ps1 - these files create a function or alias without the added checks. Note that powershell's behavior
is that if you try to create an alias that already exists, it will throw an error. If you try to create a function that already exists, it will silently override the existing function.

#### Tests
Tests use numbers in front of the name to enforce order. Executing after each main test is a companion cleanup test with _Cleanup in the name whose job is to guarantee that modules, aliases, and functions from the associated main test were cleaned up.

The test names contain parentheses where items are grouped together according to how they are imported. So if you have an import arrangement like:

```
test file
   -> dot source T.ps1
   -> Import-Module F.psm1
      -> dot source T.ps1
```

In the above example, the test file dot-sources T.ps1 and Import-Module's F.psm1. F.psm1 itself also dot-sources T.ps1. Because the main file has 2 imports, in the file name there 2 groups. The first group is (Ps1) for the T.ps1, the
second group is (Psm1Ps1) representing the import-module of F.psm1 and its dot-source of Ps1. So this results in
###_(Ps1)(Psm1Ps1).Tests.ps1, where ### is some number enforcing execution order.

#### Test Structure
Most tests are around importing a particular order and structure of psm1 and/or ps1 files, and then checking for existence or non-existence of the alias, function, and module of the relevant files. Most of the imported ps1 and psm1 files each contain an alias and a function.


## Known Issues
* https://github.com/pester/Pester/issues/2666 . In the case of ###_(Ps1)(Psm1Ps1)_Cleanup.Tests.ps1 - where a ps1 is loaded directly and then transitively via a psm1, the alias and function are not cleaned up as expected. See Warnings in the code and test output.
