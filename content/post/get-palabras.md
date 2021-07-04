---
title: "Get Palabras" # Title of the blog post.
author: "Felipoyo"
date: 2021-07-04T18:10:10+02:00 # Date of post creation.
description: "Funcion para contar palabras no repetidas." # Description used for search engine.
featured: true # Sets if post is a featured post, making appear on the home page side bar.
draft: false # Sets whether to render this page. Draft of true will not be rendered.
toc: false # Controls if a table of contents should be generated for first-level links automatically.
# menu: main
#featureImage: "/images/path/file.jpg" # Sets featured image on blog post.
thumbnail: "/images/pwsh.jpg" # Sets thumbnail image appearing inside card on homepage.
shareImage: "/images/pwsh.jpg" # Designate a separate image for social media sharing.
codeMaxLines: 10 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: true # Override global value for showing the figure label.
categories:
  - Technology
tags:
  - Powershell
  - Function
# comment: false # Disable comment if false.
---

Una funcion para contar las palabars de un texto.
<!--more-->

A raiz de una conversacion se me ocurrio crear esta funcion que puede ayudar a contar palabras en un texto deterinado.


```powershell
function Global:Get-Palabras {#Espublico
<#
.SYNOPSIS
  Cuenta palabras dentro de un fichero ejemplo de funcion privada y funcion global
.DESCRIPTION
  Se obtendra el la cantidad de palabras que contiene un texto
.PARAMETER Fichero
    Rutal del archivo a analizar
.PARAMETER Repetido
   Por defecto no se contaran palabras repetidas
   Si desea obtener el total de palabras asigne  $false
.INPUTS
  Archivo en texto plano
.OUTPUTS
  Integer numero de palabras
.NOTES
  Version:        1.1
  Author:         Felipoyo
  Creation Date:  13/05/2021
  Purpose/Change: Se agrega funcionalidad de palabras repetidas.
  
.EXAMPLE
  Get-Palabras -Fichero "C:\Users\XXXXX\Desktop\palabras.txt"  
  Get-Palabras -Fichero "C:\Users\XXXXX\Desktop\demowords.txt"  -Repetido:$false
#>
    Param(
        # Parametro: Fichero : Obligatorio, String
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ -PathType 'Leaf'})]
        [string]
        $Fichero,
        #Parametro: Repetido : Opcional, Boolean = $true
        [bool]
        $Repetido = $true #valur por default
    )
        function  Private:Find-Contenido{#Es privada
         Param(
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ -PathType 'Leaf'})]
        [string]
        $Ruta
 
        )
    $contenido = Get-Content -LiteralPath $Ruta
    $contenido| foreach{
    $linea = $_
    $palabrasdelinea = $linea.replace(".;,`r`n`0","").Split(" ").Split("`t")
    $palabras += $palabrasdelinea
    Return  $palabras
}
}
    $palabras = @()
    Write-debug "Contando palabras del archivo $($Fichero)"
   
    $palabras = Find-Contenido -Ruta $Fichero
 
    if($Repetido -eq $false){
      
      $resultado  =  $($palabras | Where-Object { $_ -ne "" }).count
    
     }else{
     $resultado  =   $($palabras | Where-Object { $_ -ne "" } | select  -Unique).count
     
     }
    Return [int]$resultado

}
```