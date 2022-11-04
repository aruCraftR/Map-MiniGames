$version=Get-Date -Format 'yyyy.MM.dd (hh:mm:ss)'
$versionZ=Get-Date -Format 'yyyy.MM.dd'
$versionD=Get-Date -Format 'yyyy.MM.dd.hh.mm.ss'

function Out-FileUtf8NoBom {

  [CmdletBinding()]
  param(
    [Parameter(Mandatory, Position=0)] [string] $LiteralPath,
    [switch] $Append,
    [switch] $NoClobber,
    [AllowNull()] [int] $Width,
    [Parameter(ValueFromPipeline)] $InputObject
  )

  #requires -version 3

  # Make sure that the .NET framework sees the same working dir. as PS
  # and resolve the input path to a full path.
  [System.IO.Directory]::SetCurrentDirectory($PWD) # Caveat: .NET Core doesn't support [Environment]::CurrentDirectory
  $LiteralPath = [IO.Path]::GetFullPath($LiteralPath)

  # If -NoClobber was specified, throw an exception if the target file already
  # exists.
  if ($NoClobber -and (Test-Path $LiteralPath)) {
    Throw [IO.IOException]"The file '$LiteralPath' already exists."
  }

  # Create a StreamWriter object.
  # Note that we take advantage of the fact that the StreamWriter class by default:
  # - uses UTF-8 encoding
  # - without a BOM.
  $sw = New-Object IO.StreamWriter $LiteralPath, $Append

  $htOutStringArgs = @{}
  if ($Width) {
    $htOutStringArgs += @{ Width = $Width }
  }

  # Note: By not using begin / process / end blocks, we're effectively running
  #       in the end block, which means that all pipeline input has already
  #       been collected in automatic variable $Input.
  #       We must use this approach, because using | Out-String individually
  #       in each iteration of a process block would format each input object
  #       with an indvidual header.
  try {
    $Input | Out-String -Stream @htOutStringArgs | % { $sw.WriteLine($_) }
  } finally {
    $sw.Dispose()
  }

}

echo "Writing the version number to the Datapack."
"tellraw @s [`"\u00a7aMap Version: \u00a7b\u00a7l$version`"]" | Out-FileUtf8NoBom ".\datapacks\map_main\data\minecraft\functions\version\version.mcfunction"
"say Map Version: $version" | Out-FileUtf8NoBom ".\datapacks\map_main\data\minecraft\functions\version\version1.mcfunction"

echo "Adding the GitHub Environment."
Add-Content -Path $env:GITHUB_ENV -Value "version=${version}"
Add-Content -Path $env:GITHUB_ENV -Value "versionDetail=${versionD}"

echo "Compressing the file."
New-Item "../build" -ItemType Directory
Compress-Archive -Path "." -DestinationPath "../build/MiniGames v$versionZ.zip"
