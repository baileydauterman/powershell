function boilerplate-powershellfunction {
    <#
    .SYNOPSIS 
        Brief synopsis goes here
    .DESCRIPTION 
        Description goes here
    .EXAMPLE 
        Example 1
    .EXAMPLE 
        Example 2
    .EXAMPLE
        Example 3
    .NOTES 
        Created: Date Here
        Last Updated: Date Here
        Contributing Authors:
            AuthorNameHere
    .LINK
       https://linktofunction.com/put_that_here
    #>

    [CmdletBinding()]
    param(
    )

    begin {
        $StartDate = Get-Date -Format u
        $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    }

    process {

    }

    end {
        $stopwatch.stop()
        $elapsed = $stopwatch.elapsed.totalseconds
        Write-Host "This process took $elapsed"
    }
}
