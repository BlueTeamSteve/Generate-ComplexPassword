	<#
		.SYNOPSIS
			Generates a complex long password

		.DESCRIPTION
			Generates a long password of $length with a number of $nonalphanumeric chars. Default is 12 char long with 2 nonalphanumeric chars. 

		.PARAMETER  Length
			Password length - Must be between 6-128

		.PARAMETER  NonAlpha
			Number of non alphanumeric chars. Non alphanumber chars include: !@#$%^&*()_-+=[{]};:<>|./?. 

		.EXAMPLE
			PS C:\> Generate-ComplexPassword -Length 14 -NonAlpha 4
			PS C:\> xDQ;=Xr-P@K/.q

		.EXAMPLE
			PS C:\> ./Generate-ComplexPassword.ps1 8
			PS C:\> ?Ekj!fOv

		.INPUTS
			None. No pipe input accepted

		.OUTPUTS
			System.String

		.NOTES
			Additional information about the function go here.

		.LINK
			http://about.me/steveawcooper

	#>
	[CmdletBinding()]
	[OutputType([System.Int32])]
	param(
		[Parameter(Position=0)]
		[ValidateRange(6,128)]
		[System.Int32]
		$Length = 12,

		[Parameter(Position=1)]
		[ValidateRange(0,127)]
		[System.Int32]
		$NonAlpha = 2
	)
	try {
		Add-Type -Assembly System.Web
		[Web.Security.Membership]::GeneratePassword($Length,$NonAlpha)
	}
	catch {
		throw
	}