Add-Type -AssemblyName System.Speech
$Speech = New-Object System.Speech.Synthesis.SpeechSynthesizer
$Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ToCharArray() -as [string[]]

while($true) {
    $Letter = $Alphabet[(Get-Random -Minimum 0 -Maximum $Alphabet.Count)]
    $Assignment = "Appuyer sur la lettre $Letter"
    $Speech.Speak($Assignment)
    $Answer = Read-Host -Prompt $Assignment
    if ($Answer.Length -gt 0) {
        if ($Letter -eq $Answer) {
            $Speech.Speak("Correcte! Tu a appuyer sur $Answer.")
        } elseif ($Answer -in $Alphabet) {
            $Speech.Speak("Incorrecte. Tu devais appuyer sur $Letter, Mais tu a appuyer sur $Answer.")
        } else {
            $Speech.Speak("Ceci n'est pas une lettre.")
        }
    } else {
        $Speech.Speak("Tu n'as pas appuyer sur une touche.")
    }
}