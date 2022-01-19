function PruneMissingRemoteGitBranches {
  git branch -v | Select-String gone |
  ForEach-Object { $_ -replace "\s+([^\s]+)\s+.+", '$1' } |
  ForEach-Object { git branch -D "$_" }
}

Export-ModuleMember -Function PruneMissingRemoteGitBranches
