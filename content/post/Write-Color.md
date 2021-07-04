---
title: "Write-Color" # Title of the blog post.
date: 2021-07-02 # Date of post creation.
description: "Article description." # Description used for search engine.
featured: true # Sets if post is a featured post, making appear on the home page side bar.
toc: false # Controls if a table of contents should be generated for first-level links automatically.
author: "Ulises Bermejo"
# menu: main
#featureImage: "/images/pwsh.jpg" # Sets featured image on blog post.
thumbnail: "/images/pwsh.jpg" # Sets thumbnail image appearing inside card on homepage.
shareImage: "/images/pwsh.jpg" # Designate a separate image for social media sharing.
codeMaxLines: 50 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: true # Override global value for showing the figure label.
categories:
  - Technology
tags:
  - Write-Host
  - Funcion
  - Powershell
# comment: false # Disable comment if false.
---

Primer post de esta nueva andadura escribiendo sobre PowerShell. Compartiremos un poco de codigo y aprenderemos por el camino.  
<!--more-->

Una pequeña funciona a raiz de una conversacion en [Telegram](https://t.me/PowershellSpanish)

```powershell
function Write-Color {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory)]
    [ValidateSet('RA','PL','ND')]
    [string] $var
  )
  $colores = @{
    RA = "red"
    PL = "darkblue"
    ND = "green"
  }
  Write-Host $var -ForegroundColor $colores.$var
}
```
