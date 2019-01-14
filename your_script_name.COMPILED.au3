#include <Array.au3>
#include <File.au3>
$cmp_AutoIt3Path = RegRead("HKLM\SOFTWARE\AutoIt v3\AutoIt", "InstallDir")
If @error Then
	MsgBox(48, "AutoIt3 Compiler Error", "Aut2exe.exe NOT FOUND!" & @CRLF & "Reinstall AutoIt3 and try again!")
	Exit
EndIf
$cmp_ScriptName = StringTrimRight(@ScriptName, 13) & ".au3"
$cmp_ScriptFullPath = StringTrimRight(@ScriptFullPath, 13) & ".au3"
Local $f_dir, $f_dir_FILES[1], $f_dir_FOLDERS[1]
If Not FileExists(StringTrimRight($cmp_ScriptFullPath, 4) & ".exe") Then
	; script is not compiled
	If FileExists(StringTrimRight($cmp_ScriptFullPath, 4) & ".cleaned.au3") Then
		; read all lines of the original script
		Local $cmp_ScriptLine[1]
		$cmp_ScriptHandle = FileOpen($cmp_ScriptFullPath, 0)
		$cmp_ScriptLinesNr = _FileCountLines($cmp_ScriptFullPath)
		For $i=1 to $cmp_ScriptLinesNr
			_ArrayAdd($cmp_ScriptLine, FileReadLine($cmp_ScriptHandle, $i))
		Next
		FileClose($cmp_ScriptHandle)
		;---
		For $i=1 to 100
			If StringInStr($cmp_ScriptLine[$i], "#AutoIt3Wrapper_Icon=") Then
				$cmp_ExeIcon_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$i], 21)
				ExitLoop
			Else
				If StringInStr($cmp_ScriptLine[$i], "#AutoIt3Wrapper_Icon = ") Then
					$cmp_ExeIcon_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$i], 23)
					ExitLoop
				Else
					$cmp_ExeIcon_FullPath = $cmp_AutoIt3Path & "\Icons\au3.ico"
				EndIf
			EndIf
		Next
		For $j=1 to 100
			If StringInStr($cmp_ScriptLine[$j], "#AutoIt3Wrapper_Outfile=") Then
				$cmp_ExeName_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$j], 24)
				ExitLoop
			Else
				If StringInStr($cmp_ScriptLine[$j], "#AutoIt3Wrapper_Outfile = ") Then
					$cmp_ExeName_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$j], 26)
					ExitLoop
				Else
					$cmp_ExeName_FullPath = @ScriptDir & "\" & StringTrimRight(@ScriptName, 13) & ".exe"
				EndIf
			EndIf
		Next
		; compile the cleaned version of the script
		RunWait($cmp_AutoIt3Path & '\Aut2exe\Aut2exe.exe /in "' & StringTrimRight($cmp_ScriptFullPath, 4) & '.cleaned.au3' & '"' & ' /out "' & StringTrimRight($cmp_ScriptFullPath, 4) & '.exe' & '"' & ' /icon "' & $cmp_ExeIcon_FullPath & '"', $cmp_AutoIt3Path & "\Aut2exe")
		;ShellExecute('AutoIt3Wrapper.au3', '"' & StringTrimRight($cmp_ScriptFullPath, 4) & '.cleaned.au3' & '"', $cmp_AutoIt3Path & '\SCiTE\AutoIt3Wrapper')
		_Files_All()
	ElseIf FileExists($cmp_ScriptFullPath) Then
		; read all lines of the original script
		Local $cmp_ScriptLine[1]
		$cmp_ScriptHandle = FileOpen($cmp_ScriptFullPath, 0)
		$cmp_ScriptLinesNr = _FileCountLines($cmp_ScriptFullPath)
		For $i=1 to $cmp_ScriptLinesNr
			_ArrayAdd($cmp_ScriptLine, FileReadLine($cmp_ScriptHandle, $i))
		Next
		FileClose($cmp_ScriptHandle)
		;---
		For $i=1 to 100
			If StringInStr($cmp_ScriptLine[$i], "#AutoIt3Wrapper_Icon=") Then
				$cmp_ExeIcon_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$i], 21)
				ExitLoop
			Else
				If StringInStr($cmp_ScriptLine[$i], "#AutoIt3Wrapper_Icon = ") Then
					$cmp_ExeIcon_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$i], 23)
					ExitLoop
				Else
					$cmp_ExeIcon_FullPath = $cmp_AutoIt3Path & "\Icons\au3.ico"
				EndIf
			EndIf
		Next
		For $j=1 to 100
			If StringInStr($cmp_ScriptLine[$j], "#AutoIt3Wrapper_Outfile=") Then
				$cmp_ExeName_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$j], 24)
				ExitLoop
			Else
				If StringInStr($cmp_ScriptLine[$j], "#AutoIt3Wrapper_Outfile = ") Then
					$cmp_ExeName_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$j], 26)
					ExitLoop
				Else
					$cmp_ExeName_FullPath = @ScriptDir & "\" & StringTrimRight(@ScriptName, 13) & ".exe"
				EndIf
			EndIf
		Next
		; compile the original version of the script
		RunWait($cmp_AutoIt3Path & '\Aut2exe\Aut2exe.exe /in "' & $cmp_ScriptFullPath & '"' & ' /out "' & StringTrimRight($cmp_ScriptFullPath, 4) & '.exe' & '"' & ' /icon "' & $cmp_ExeIcon_FullPath & '"', $cmp_AutoIt3Path & "\Aut2exe")
		;ShellExecute('AutoIt3Wrapper.au3', '"' & $cmp_ScriptFullPath & '"', $cmp_AutoIt3Path & '\SCiTE\AutoIt3Wrapper')
		_Files_All()
	Else
		; rename this script to this format 'original_script_name.COMPILED.au3'
	EndIf
Else
	; script is compiled
	If FileExists(StringTrimRight($cmp_ScriptFullPath, 4) & ".cleaned.au3") Then
		; read all lines of the original script
		Local $cmp_ScriptLine[1]
		$cmp_ScriptHandle = FileOpen($cmp_ScriptFullPath, 0)
		$cmp_ScriptLinesNr = _FileCountLines($cmp_ScriptFullPath)
		For $i=1 to $cmp_ScriptLinesNr
			_ArrayAdd($cmp_ScriptLine, FileReadLine($cmp_ScriptHandle, $i))
		Next
		FileClose($cmp_ScriptHandle)
		;---
		For $i=1 to 100
			If StringInStr($cmp_ScriptLine[$i], "#AutoIt3Wrapper_Icon=") Then
				$cmp_ExeIcon_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$i], 21)
				ExitLoop
			Else
				If StringInStr($cmp_ScriptLine[$i], "#AutoIt3Wrapper_Icon = ") Then
					$cmp_ExeIcon_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$i], 23)
					ExitLoop
				Else
					$cmp_ExeIcon_FullPath = $cmp_AutoIt3Path & "\Icons\au3.ico"
				EndIf
			EndIf
		Next
		For $j=1 to 100
			If StringInStr($cmp_ScriptLine[$j], "#AutoIt3Wrapper_Outfile=") Then
				$cmp_ExeName_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$j], 24)
				ExitLoop
			Else
				If StringInStr($cmp_ScriptLine[$j], "#AutoIt3Wrapper_Outfile = ") Then
					$cmp_ExeName_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$j], 26)
					ExitLoop
				Else
					$cmp_ExeName_FullPath = @ScriptDir & "\" & StringTrimRight(@ScriptName, 13) & ".exe"
				EndIf
			EndIf
		Next
		; compile the cleaned version of the script
		RunWait($cmp_AutoIt3Path & '\Aut2exe\Aut2exe.exe /in "' & StringTrimRight($cmp_ScriptFullPath, 4) & '.cleaned.au3' & '"' & ' /out "' & StringTrimRight($cmp_ScriptFullPath, 4) & '.exe' & '"' & ' /icon "' & $cmp_ExeIcon_FullPath & '"', $cmp_AutoIt3Path & "\Aut2exe")
		;ShellExecute('AutoIt3Wrapper.au3', '"' & StringTrimRight($cmp_ScriptFullPath, 4) & '.cleaned.au3' & '"', $cmp_AutoIt3Path & '\SCiTE\AutoIt3Wrapper')
		_Files_All()
	ElseIf FileExists($cmp_ScriptFullPath) Then
		; read all lines of the original script
		Local $cmp_ScriptLine[1]
		$cmp_ScriptHandle = FileOpen($cmp_ScriptFullPath, 0)
		$cmp_ScriptLinesNr = _FileCountLines($cmp_ScriptFullPath)
		For $i=1 to $cmp_ScriptLinesNr
			_ArrayAdd($cmp_ScriptLine, FileReadLine($cmp_ScriptHandle, $i))
		Next
		FileClose($cmp_ScriptHandle)
		;---
		For $i=1 to 100
			If StringInStr($cmp_ScriptLine[$i], "#AutoIt3Wrapper_Icon=") Then
				$cmp_ExeIcon_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$i], 21)
				ExitLoop
			Else
				If StringInStr($cmp_ScriptLine[$i], "#AutoIt3Wrapper_Icon = ") Then
					$cmp_ExeIcon_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$i], 23)
					ExitLoop
				Else
					$cmp_ExeIcon_FullPath = $cmp_AutoIt3Path & "\Icons\au3.ico"
				EndIf
			EndIf
		Next
		For $j=1 to 100
			If StringInStr($cmp_ScriptLine[$j], "#AutoIt3Wrapper_Outfile=") Then
				$cmp_ExeName_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$j], 24)
				ExitLoop
			Else
				If StringInStr($cmp_ScriptLine[$j], "#AutoIt3Wrapper_Outfile = ") Then
					$cmp_ExeName_FullPath = @ScriptDir & "\" & StringTrimLeft($cmp_ScriptLine[$j], 26)
					ExitLoop
				Else
					$cmp_ExeName_FullPath = @ScriptDir & "\" & StringTrimRight(@ScriptName, 13) & ".exe"
				EndIf
			EndIf
		Next
		; compile the original version of the script
		RunWait($cmp_AutoIt3Path & '\Aut2exe\Aut2exe.exe /in "' & $cmp_ScriptFullPath & '"' & ' /out "' & StringTrimRight($cmp_ScriptFullPath, 4) & '.exe' & '"' & ' /icon "' & $cmp_ExeIcon_FullPath & '"', $cmp_AutoIt3Path & "\Aut2exe")
		;ShellExecute('AutoIt3Wrapper.au3', '"' & $cmp_ScriptFullPath & '"', $cmp_AutoIt3Path & '\SCiTE\AutoIt3Wrapper')
		_Files_All()
	Else
		; rename this script to this format 'original_script_name.COMPILED.au3'
	EndIf
EndIf

Func _Files_Manual()
	; use this function  to copy/delete other files/folders which might not be detected by this script
EndFunc

Func _Files_All()
	If FileExists(StringTrimRight($cmp_ScriptFullPath, 4) & ".cleaned.au3") Then
		;Local $cmp_ScriptLine[1]
		;$cmp_ScriptHandle = FileOpen(StringTrimRight($cmp_ScriptFullPath, 4) & ".cleaned.au3", 0)
		;$cmp_ScriptLinesNr = _FileCountLines(StringTrimRight($cmp_ScriptFullPath, 4) & ".cleaned.au3")
		;For $i=1 to $cmp_ScriptLinesNr
		;	_ArrayAdd($cmp_ScriptLine, FileReadLine($cmp_ScriptHandle, $i))
		;Next
		;FileClose($cmp_ScriptHandle)
		;---
		_DirRemoveContent(@ScriptDir & "\_COMPILED '" & $cmp_ScriptName & "'")
		_Files_Auto()
		_Files_Manual()
	ElseIf FileExists($cmp_ScriptFullPath) Then
		;Local $cmp_ScriptLine[1]
		;$cmp_ScriptHandle = FileOpen($cmp_ScriptFullPath, 0)
		;$cmp_ScriptLinesNr = _FileCountLines($cmp_ScriptFullPath)
		;For $i=1 to $cmp_ScriptLinesNr
		;	_ArrayAdd($cmp_ScriptLine, FileReadLine($cmp_ScriptHandle, $i))
		;Next
		;FileClose($cmp_ScriptHandle)
		;---
		_DirRemoveContent(@ScriptDir & "\_COMPILED '" & $cmp_ScriptName & "'")
		_Files_Auto()
		_Files_Manual()
	EndIf
EndFunc

Func _Files_Auto()
	Local $cmp_Project_files[1], $cmp_Project_folders[1], $cmp_Project_folders_relative[1]
	Local $cmp_Project_filesTemp1[1], $cmp_Project_filesTemp2[1], $cmp_Project_filesTemp3[1], $cmp_Project_filesTemp4[1], $cmp_Project_filesTemp5[1], $cmp_Project_filesTemp6[1]
	Local $cmp_Project_filesTemp7[1], $cmp_Project_filesTemp8[1], $cmp_Project_filesTemp9[1], $cmp_Project_filesTemp10[1], $cmp_Project_filesTemp11[1]
	;---
	$cmp_Project_filesTemp1 = _FileListToArray(@ScriptDir, "*", 0)
	$cmp_Project_filesTempCount1 = UBound($cmp_Project_filesTemp1)-1
	For $a=1 to $cmp_Project_filesTempCount1
		If Not StringInStr(FileGetAttrib($cmp_Project_filesTemp1[$a]), "D") Then
			_ArrayAdd($cmp_Project_files, $cmp_Project_filesTemp1[$a])
			_ArrayAdd($cmp_Project_folders, @ScriptDir)
			_ArrayAdd($cmp_Project_folders_relative, "")
		Else
			If Not StringInStr($cmp_Project_filesTemp1[$a], "_COMPILED ") Then
			$cmp_Project_filesTemp2 = _FileListToArray($cmp_Project_filesTemp1[$a], "*", 0)
			$cmp_Project_filesTempCount2 = UBound($cmp_Project_filesTemp2)-1
			For $b=1 to $cmp_Project_filesTempCount2
				If Not StringInStr(FileGetAttrib($cmp_Project_filesTemp2[$b]), "D") Then
					_ArrayAdd($cmp_Project_files, $cmp_Project_filesTemp2[$b])
					_ArrayAdd($cmp_Project_folders, @ScriptDir & "\" & _
													$cmp_Project_filesTemp1[$a])
					_ArrayAdd($cmp_Project_folders_relative, $cmp_Project_filesTemp1[$a])
				Else
					If Not StringInStr($cmp_Project_filesTemp2[$b], "_COMPILED ") Then
					$cmp_Project_filesTemp3 = _FileListToArray($cmp_Project_filesTemp2[$b], "*", 0)
					$cmp_Project_filesTempCount3 = UBound($cmp_Project_filesTemp3)-1
					For $c=1 to $cmp_Project_filesTempCount3
						If Not StringInStr(FileGetAttrib($cmp_Project_filesTemp3[$c]), "D") Then
							_ArrayAdd($cmp_Project_files, $cmp_Project_filesTemp3[$c])
							_ArrayAdd($cmp_Project_folders, @ScriptDir & "\" & _
															$cmp_Project_filesTemp1[$a] & "\" & _
															$cmp_Project_filesTemp2[$b])
							_ArrayAdd($cmp_Project_folders_relative, $cmp_Project_filesTemp1[$a] & "\" & _
																	$cmp_Project_filesTemp2[$b])
						Else
							If Not StringInStr($cmp_Project_filesTemp3[$c], "_COMPILED ") Then
							$cmp_Project_filesTemp4 = _FileListToArray($cmp_Project_filesTemp3[$c], "*", 0)
							$cmp_Project_filesTempCount4 = UBound($cmp_Project_filesTemp4)-1
							For $d=1 to $cmp_Project_filesTempCount4
								If Not StringInStr(FileGetAttrib($cmp_Project_filesTemp4[$d]), "D") Then
									_ArrayAdd($cmp_Project_files, $cmp_Project_filesTemp4[$d])
									_ArrayAdd($cmp_Project_folders, @ScriptDir & "\" & _
																	$cmp_Project_filesTemp1[$a] & "\" & _
																	$cmp_Project_filesTemp2[$b] & "\" & _
																	$cmp_Project_filesTemp3[$c])
									_ArrayAdd($cmp_Project_folders_relative, $cmp_Project_filesTemp1[$a] & "\" & _
																			$cmp_Project_filesTemp2[$b] & "\" & _
																			$cmp_Project_filesTemp3[$c])
								Else
									If Not StringInStr($cmp_Project_filesTemp4[$d], "_COMPILED ") Then
									$cmp_Project_filesTemp5 = _FileListToArray($cmp_Project_filesTemp4[$d], "*", 0)
									$cmp_Project_filesTempCount5 = UBound($cmp_Project_filesTemp5)-1
									For $e=1 to $cmp_Project_filesTempCount5
										If Not StringInStr(FileGetAttrib($cmp_Project_filesTemp5[$e]), "D") Then
											_ArrayAdd($cmp_Project_files, $cmp_Project_filesTemp5[$e])
											_ArrayAdd($cmp_Project_folders, @ScriptDir & "\" & _
																			$cmp_Project_filesTemp1[$a] & "\" & _
																			$cmp_Project_filesTemp2[$b] & "\" & _
																			$cmp_Project_filesTemp3[$c] & "\" & _
																			$cmp_Project_filesTemp4[$d])
											_ArrayAdd($cmp_Project_folders_relative, $cmp_Project_filesTemp1[$a] & "\" & _
																					$cmp_Project_filesTemp2[$b] & "\" & _
																					$cmp_Project_filesTemp3[$c] & "\" & _
																					$cmp_Project_filesTemp4[$d])
										Else
											If Not StringInStr($cmp_Project_filesTemp5[$e], "_COMPILED ") Then
											$cmp_Project_filesTemp6 = _FileListToArray($cmp_Project_filesTemp5[$e], "*", 0)
											$cmp_Project_filesTempCount6 = UBound($cmp_Project_filesTemp4)-1
											For $f=1 to $cmp_Project_filesTempCount6
												If Not StringInStr(FileGetAttrib($cmp_Project_filesTemp6[$f]), "D") Then
													_ArrayAdd($cmp_Project_files, $cmp_Project_filesTemp6[$f])
													_ArrayAdd($cmp_Project_folders, @ScriptDir & "\" & _
																					$cmp_Project_filesTemp1[$a] & "\" & _
																					$cmp_Project_filesTemp2[$b] & "\" & _
																					$cmp_Project_filesTemp3[$c] & "\" & _
																					$cmp_Project_filesTemp4[$d] & "\" & _
																					$cmp_Project_filesTemp5[$e])
													_ArrayAdd($cmp_Project_folders_relative, $cmp_Project_filesTemp1[$a] & "\" & _
																							$cmp_Project_filesTemp2[$b] & "\" & _
																							$cmp_Project_filesTemp3[$c] & "\" & _
																							$cmp_Project_filesTemp4[$d] & "\" & _
																							$cmp_Project_filesTemp5[$e])
												Else
													If Not StringInStr($cmp_Project_filesTemp6[$f], "_COMPILED ") Then
													$cmp_Project_filesTemp7 = _FileListToArray($cmp_Project_filesTemp6[$f], "*", 0)
													$cmp_Project_filesTempCount7 = UBound($cmp_Project_filesTemp7)-1
													For $g=1 to $cmp_Project_filesTempCount7
														If Not StringInStr(FileGetAttrib($cmp_Project_filesTemp7[$g]), "D") Then
															_ArrayAdd($cmp_Project_files, $cmp_Project_filesTemp7[$g])
															_ArrayAdd($cmp_Project_folders, @ScriptDir & "\" & _
																							$cmp_Project_filesTemp1[$a] & "\" & _
																							$cmp_Project_filesTemp2[$b] & "\" & _
																							$cmp_Project_filesTemp3[$c] & "\" & _
																							$cmp_Project_filesTemp4[$d] & "\" & _
																							$cmp_Project_filesTemp5[$e] & "\" & _
																							$cmp_Project_filesTemp6[$f])
															_ArrayAdd($cmp_Project_folders_relative, $cmp_Project_filesTemp1[$a] & "\" & _
																									$cmp_Project_filesTemp2[$b] & "\" & _
																									$cmp_Project_filesTemp3[$c] & "\" & _
																									$cmp_Project_filesTemp4[$d] & "\" & _
																									$cmp_Project_filesTemp5[$e] & "\" & _
																									$cmp_Project_filesTemp6[$f])
														Else
															If Not StringInStr($cmp_Project_filesTemp7[$g], "_COMPILED ") Then
															$cmp_Project_filesTemp8 = _FileListToArray($cmp_Project_filesTemp7[$g], "*", 0)
															$cmp_Project_filesTempCount8 = UBound($cmp_Project_filesTemp8)-1
															For $h=1 to $cmp_Project_filesTempCount8
																If Not StringInStr(FileGetAttrib($cmp_Project_filesTemp8[$h]), "D") Then
																	_ArrayAdd($cmp_Project_files, $cmp_Project_filesTemp8[$h])
																	_ArrayAdd($cmp_Project_folders, @ScriptDir & "\" & _
																									$cmp_Project_filesTemp1[$a] & "\" & _
																									$cmp_Project_filesTemp2[$b] & "\" & _
																									$cmp_Project_filesTemp3[$c] & "\" & _
																									$cmp_Project_filesTemp4[$d] & "\" & _
																									$cmp_Project_filesTemp5[$e] & "\" & _
																									$cmp_Project_filesTemp6[$f] & "\" & _
																									$cmp_Project_filesTemp7[$g])
																	_ArrayAdd($cmp_Project_folders_relative, $cmp_Project_filesTemp1[$a] & "\" & _
																											$cmp_Project_filesTemp2[$b] & "\" & _
																											$cmp_Project_filesTemp3[$c] & "\" & _
																											$cmp_Project_filesTemp4[$d] & "\" & _
																											$cmp_Project_filesTemp5[$e] & "\" & _
																											$cmp_Project_filesTemp6[$f] & "\" & _
																											$cmp_Project_filesTemp7[$g])
																Else
																	If Not StringInStr($cmp_Project_filesTemp8[$h], "_COMPILED ") Then
																	$cmp_Project_filesTemp9 = _FileListToArray($cmp_Project_filesTemp8[$h], "*", 0)
																	$cmp_Project_filesTempCount9 = UBound($cmp_Project_filesTemp9)-1
																	For $i=1 to $cmp_Project_filesTempCount9
																		If Not StringInStr(FileGetAttrib($cmp_Project_filesTemp9[$i]), "D") Then
																			_ArrayAdd($cmp_Project_files, $cmp_Project_filesTemp9[$i])
																			_ArrayAdd($cmp_Project_folders, @ScriptDir & "\" & _
																											$cmp_Project_filesTemp1[$a] & "\" & _
																											$cmp_Project_filesTemp2[$b] & "\" & _
																											$cmp_Project_filesTemp3[$c] & "\" & _
																											$cmp_Project_filesTemp4[$d] & "\" & _
																											$cmp_Project_filesTemp5[$e] & "\" & _
																											$cmp_Project_filesTemp6[$f] & "\" & _
																											$cmp_Project_filesTemp7[$g] & "\" & _
																											$cmp_Project_filesTemp8[$h])
																			_ArrayAdd($cmp_Project_folders_relative, $cmp_Project_filesTemp1[$a] & "\" & _
																													$cmp_Project_filesTemp2[$b] & "\" & _
																													$cmp_Project_filesTemp3[$c] & "\" & _
																													$cmp_Project_filesTemp4[$d] & "\" & _
																													$cmp_Project_filesTemp5[$e] & "\" & _
																													$cmp_Project_filesTemp6[$f] & "\" & _
																													$cmp_Project_filesTemp7[$g] & "\" & _
																													$cmp_Project_filesTemp8[$h])
																		Else
																			If Not StringInStr($cmp_Project_filesTemp9[$i], "_COMPILED ") Then
																			$cmp_Project_filesTemp10 = _FileListToArray($cmp_Project_filesTemp9[$i], "*", 0)
																			$cmp_Project_filesTempCount10 = UBound($cmp_Project_filesTemp10)-1
																			For $j=1 to $cmp_Project_filesTempCount10
																				If Not StringInStr(FileGetAttrib($cmp_Project_filesTemp10[$j]), "D") Then
																					_ArrayAdd($cmp_Project_files, $cmp_Project_filesTemp10[$j])
																					_ArrayAdd($cmp_Project_folders, @ScriptDir & "\" & _
																													$cmp_Project_filesTemp1[$a] & "\" & _
																													$cmp_Project_filesTemp2[$b] & "\" & _
																													$cmp_Project_filesTemp3[$c] & "\" & _
																													$cmp_Project_filesTemp4[$d] & "\" & _
																													$cmp_Project_filesTemp5[$e] & "\" & _
																													$cmp_Project_filesTemp6[$f] & "\" & _
																													$cmp_Project_filesTemp7[$g] & "\" & _
																													$cmp_Project_filesTemp8[$h] & "\" & _
																													$cmp_Project_filesTemp9[$i])
																					_ArrayAdd($cmp_Project_folders_relative, $cmp_Project_filesTemp1[$a] & "\" & _
																															$cmp_Project_filesTemp2[$b] & "\" & _
																															$cmp_Project_filesTemp3[$c] & "\" & _
																															$cmp_Project_filesTemp4[$d] & "\" & _
																															$cmp_Project_filesTemp5[$e] & "\" & _
																															$cmp_Project_filesTemp6[$f] & "\" & _
																															$cmp_Project_filesTemp7[$g] & "\" & _
																															$cmp_Project_filesTemp8[$h] & "\" & _
																															$cmp_Project_filesTemp9[$i])
																				Else
																					If Not StringInStr($cmp_Project_filesTemp10[$j], "_COMPILED ") Then
																					$cmp_Project_filesTemp11 = _FileListToArray($cmp_Project_filesTemp10[$j], "*", 0)
																					$cmp_Project_filesTempCount11 = UBound($cmp_Project_filesTemp11)-1
																					For $k=1 to $cmp_Project_filesTempCount11
																						If Not StringInStr(FileGetAttrib($cmp_Project_filesTemp11[$k]), "D") Then
																							_ArrayAdd($cmp_Project_files, $cmp_Project_filesTemp11[$k])
																							_ArrayAdd($cmp_Project_folders, @ScriptDir & "\" & _
																															$cmp_Project_filesTemp1[$a] & "\" & _
																															$cmp_Project_filesTemp2[$b] & "\" & _
																															$cmp_Project_filesTemp3[$c] & "\" & _
																															$cmp_Project_filesTemp4[$d] & "\" & _
																															$cmp_Project_filesTemp5[$e] & "\" & _
																															$cmp_Project_filesTemp6[$f] & "\" & _
																															$cmp_Project_filesTemp7[$g] & "\" & _
																															$cmp_Project_filesTemp8[$h] & "\" & _
																															$cmp_Project_filesTemp9[$i] & "\" & _
																															$cmp_Project_filesTemp10[$j])
																							_ArrayAdd($cmp_Project_folders_relative, $cmp_Project_filesTemp1[$a] & "\" & _
																																	$cmp_Project_filesTemp2[$b] & "\" & _
																																	$cmp_Project_filesTemp3[$c] & "\" & _
																																	$cmp_Project_filesTemp4[$d] & "\" & _
																																	$cmp_Project_filesTemp5[$e] & "\" & _
																																	$cmp_Project_filesTemp6[$f] & "\" & _
																																	$cmp_Project_filesTemp7[$g] & "\" & _
																																	$cmp_Project_filesTemp8[$h] & "\" & _
																																	$cmp_Project_filesTemp9[$i] & "\" & _
																																	$cmp_Project_filesTemp10[$j])
																						EndIf
																					Next
																					EndIf
																				EndIf
																			Next
																			EndIf
																		EndIf
																	Next
																	EndIf
																EndIf
															Next
															EndIf
														EndIf
													Next
													EndIf
												EndIf
											Next
											EndIf
										EndIf
									Next
									EndIf
								EndIf
							Next
							EndIf
						EndIf
					Next
					EndIf
				EndIf
			Next
			EndIf
		EndIf
	Next
	;---
	Local $cmp_Project_folders_relative_copy[1], $cmp_Project_folders_relative_copy_FileInstallCheck[1], $cmp_Project_files_copy[1], $cmp_Project_files_copy_FileInstallCheck[1]
	For $i=1 to UBound($cmp_Project_folders_relative)-1
		_ArrayAdd($cmp_Project_folders_relative_copy, "0")
		_ArrayAdd($cmp_Project_folders_relative_copy_FileInstallCheck, "0")
	Next
	For $j=1 to UBound($cmp_Project_files)-1
		_ArrayAdd($cmp_Project_files_copy, "0")
		_ArrayAdd($cmp_Project_files_copy_FileInstallCheck, "0")
	Next
	;$cmp_ScriptHandle = FileOpen($cmp_ScriptFullPath, 0)
	;$cmp_ScriptLinesNr = _FileCountLines($cmp_ScriptFullPath)
	For $i=1 to $cmp_ScriptLinesNr
		;_ArrayAdd($cmp_ScriptLine, FileReadLine($cmp_ScriptHandle, $i))
		For $j=1 to UBound($cmp_Project_files)-1
			If ($cmp_Project_folders_relative_copy[$j] <> "1") And ($cmp_Project_folders_relative_copy_FileInstallCheck[$j] <> "1") Then
				If (StringInStr($cmp_ScriptLine[$i], '"\' & $cmp_Project_folders_relative[$j] & '"')) Or  (StringInStr($cmp_ScriptLine[$i], '"' & $cmp_Project_folders_relative[$j] & '"')) Then
					If Not StringInStr($cmp_Project_folders_relative[$j], ".") Then
						If (Not StringInStr($cmp_ScriptLine[$i], "FileInstall")) And (Not StringInStr($cmp_ScriptLine[$i], "#")) Then
							$cmp_Project_folders_relative_copy[$j] = "1"
							$cmp_Project_folders_relative_copy_FileInstallCheck[$j] = "0"
						Else
							$cmp_Project_folders_relative_copy[$j] = "0"
							$cmp_Project_folders_relative_copy_FileInstallCheck[$j] = "1"
						EndIf
					Else
						$cmp_Project_folders_relative_copy[$j] = "0"
					EndIf
				Else
					$cmp_Project_folders_relative_copy[$j] = "0"
				EndIf
			EndIf
			If ($cmp_Project_files_copy[$j] <> "1") And ($cmp_Project_files_copy_FileInstallCheck[$j] <> "1") Then
				If (StringInStr($cmp_ScriptLine[$i], '"\' & $cmp_Project_folders_relative[$j] & "\" & $cmp_Project_files[$j] & '"')) Or (StringInStr($cmp_ScriptLine[$i], '"' & $cmp_Project_folders_relative[$j] & '\' & $cmp_Project_files[$j] & '"')) Then
					If StringInStr($cmp_Project_files[$j], ".") Then
						If (Not StringInStr($cmp_ScriptLine[$i], "FileInstall")) And (Not StringInStr($cmp_ScriptLine[$i], "#")) Then
							$cmp_Project_files_copy[$j] = "1"
							$cmp_Project_files_copy_FileInstallCheck[$j] = "0"
						Else
							$cmp_Project_files_copy[$j] = "0"
							$cmp_Project_files_copy_FileInstallCheck[$j] = "1"
						EndIf
					Else
						$cmp_Project_files_copy[$j] = "0"
					EndIf
				Else
					$cmp_Project_files_copy[$j] = "0"
				EndIf
			EndIf
		Next
	Next
	;FileClose($cmp_ScriptHandle)
	For $i=1 to UBound($cmp_Project_files)-1
		If $cmp_Project_folders_relative[$i] == "" Then
			If $cmp_Project_files_copy[$i] == "1" Then
				FileCopy($cmp_Project_folders[$i] & "\" & $cmp_Project_files[$i], @ScriptDir & "\_COMPILED '" & $cmp_ScriptName & "'\" & $cmp_Project_files[$i], 9)
			EndIf
		Else
			If $cmp_Project_folders_relative_copy[$i] == "1" Then
				DirCreate(@ScriptDir & "\_COMPILED '" & $cmp_ScriptName & "'\" & $cmp_Project_folders_relative[$i])
			EndIf
			If $cmp_Project_files_copy[$i] == "1" Then
				FileCopy($cmp_Project_folders[$i] & "\" & $cmp_Project_files[$i], @ScriptDir & "\_COMPILED '" & $cmp_ScriptName & "'\" & $cmp_Project_folders_relative[$i] & "\" & $cmp_Project_files[$i], 9)
			EndIf
		EndIf
	Next
	;---
	If FileExists(StringTrimRight($cmp_ScriptFullPath, 4) & ".cleaned.exe") Then
		FileCopy(StringTrimRight($cmp_ScriptFullPath, 4) & ".cleaned.exe", @ScriptDir & "\_COMPILED '" & $cmp_ScriptName & "'\" & StringTrimLeft($cmp_ExeName_FullPath, StringLen(@ScriptDir)+1), 9)
		FileDelete(StringTrimRight($cmp_ScriptFullPath, 4) & ".cleaned.exe")
	Else
		FileCopy(StringTrimRight($cmp_ScriptFullPath, 4) & ".exe", @ScriptDir & "\_COMPILED '" & $cmp_ScriptName & "'\" & StringTrimLeft($cmp_ExeName_FullPath, StringLen(@ScriptDir)+1), 9)
		FileDelete(StringTrimRight($cmp_ScriptFullPath, 4) & ".exe")
	EndIf
EndFunc

Func _DirRemoveContent($f_dir)
	$f_dir_FILES = _FileListToArray($f_dir, "*", 1)
	For $i = 1 To UBound($f_dir_FILES)-1
		FileDelete($f_dir & "\" & $f_dir_FILES[$i])
	Next
	$f_dir_FOLDERS = _FileListToArray($f_dir, "*", 2)
	For $j = 1 To UBound($f_dir_FOLDERS)-1
		DirRemove($f_dir & "\" & $f_dir_FOLDERS[$j], 1)
	Next
EndFunc