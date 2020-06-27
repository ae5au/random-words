if(!$args)
{
    Write-Host ".\get-words.ps1 5 wordtospell"
    Write-Host "or .\get-words.ps1 15"
}

$Words = Get-Content (Join-Path $PSScriptRoot "word_list.txt")
$Count = $args[0]

if($Word2Spell = $args[1])
{
    for($i = 0; $i -lt $Word2Spell.Length; $i++)
    {
        $Letter = $Word2Spell[$i]
        ($Words | ?{$_ -like "$Letter*"} | Get-Random -Count $Count) -join " "
    }
}
else {
    ($Words | Get-Random -Count $Count) -join " "
}
