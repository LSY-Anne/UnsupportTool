$PBExportHeader$u_blob_file_handler.sru
forward
global type u_blob_file_handler from nonvisualobject
end type
end forward

global type u_blob_file_handler from nonvisualobject autoinstantiate
end type

forward prototypes
public function integer uf_get_blob_from_file_original (string as_filename, ref blob ablob_passed)
public function integer uf_put_blob_to_file_original (string as_filename, blob ablob_passed)
public function integer uf_get_blob_from_file (string as_filename, ref blob ablob_passed)
public function integer uf_put_blob_to_file (string as_filename, blob ablob_passed)
end prototypes

public function integer uf_get_blob_from_file_original (string as_filename, ref blob ablob_passed);////////////////////////////////////////////////////////////
//
// Integer global function gf_copy_file_to_blob(
//      string as_Filename    by value,
//      string ablob_Passed    by reference )
//
// Arguments:
// as_Filename = A string whose value is the name of the file
//      you want to copy to a BLOB. If filename is not on the
//      operating system's search path, enter the
//      fully qualified name, e.g.,"c:\pb4\mydata.txt".
//      Note that this function takes exclusive use
//      of the input file during execution.
//
// ablob_Passed = BLOB variable that file is copied to.
//
// Returns 1 if successful, -1 if unsuccessful.
//
// This function copies the contents of a file to a
// BLOB variable. It uses only PowerBuilder function calls.
// All file i/o is done in stream mode. Note that this will
// copy both binary and text files properly.
//
// This function was written in PowerBuilder 4.0.06.
//
// Error handling: The function returns immediately with a
// -1 value if an error occurs. No cleanup is done, i.e., if
// an error occurs while copying a file, upon return the input
// file will still be open.
//
// Possible changes/improvements:
// a) You may want to remove the MessageBox() calls
// depending on how this function is used.
// b) Instead of simply returning when an error occurs, you
// may want to do a FileClose() on any open files.
//
// Author: Michael D. Kersey, Ksys
//
// Modelled after PowerSoft Faxline Document 2020: Note that
// that faxline has an error AFAIK! The document specifies
// using a value of max_bytes=32766, but using that value
// will cause the document's routine to fail if the file size is exactly
// 32766 bytes. In addition that document has several typographical
// errors (missing division symbols) that prevent compilation.
//
////////////////////////////////////////////////////////////

integer fin     // Input  file number.
integer loops     // Number of blobs to copy.
integer i      // Blob counter.
long  flen     // Input file's length in bytes.
long  bytes_read
long  new_pos
// We read into this blob variable.
blob b
// Maximum number of bytes that can be read
// by FileRead() or written by FileWrite().
long  max_bytes = 32765
// When copying, we Yield() occasionally, so other
// processes have a chance to run. For example, if
// copying a file to/from a network drive, it may
// be necessary for the client to tell the server
// that we're still connected( NETBEUI Alive calls).
// Here we're yielding for every MB transferred.
integer yield_every = 30
pointer l_pointer

l_pointer = SetPointer(HourGlass!)
// Get the input file's length in bytes.
flen = FileLength(as_Filename)

// Open the input file. Take exclusive use during the copy.
// Return any error immediately.
fin = FileOpen(as_Filename, StreamMode!, Read!, LockReadWrite!)
IF ( fin < 0 ) THEN 
	SetPointer(l_pointer)
	RETURN fin
END IF

// Determine how many FileRead()'s are required to read the file.
IF ( flen > max_bytes ) THEN
	IF Mod( flen, max_bytes ) = 0 THEN
		loops = flen / max_bytes
	ELSE
		loops = flen / max_bytes + 1
	END IF
ELSE
	loops = 1
END IF

// Loop, reading and writing blobs.
//CST Supplied this Workaround 
// Uncomment the next line
//ablob_Passed = BLOB('')
FOR I = 1 TO loops
	// Yield occasionally.
	IF ( Mod(i, yield_every) = 0 ) THEN Yield()
	// Read a blob.
	bytes_read = FileRead(fin, b)
	// Was Read OK?
	IF ( bytes_read > 0 ) THEN
		// Yes. Append the read BLOB to our result BLOB.
		ablob_Passed = ablob_Passed + b
		// Update the input file pointer.
		new_pos = new_pos + bytes_read
		FileSeek(fin, new_pos, FromBeginning!)
	ELSEIF ( bytes_read = -100 ) THEN
		// Found <EOF> at start of file. No need to write anything.
	ELSEIF ( bytes_read = -1 ) THEN
		// Got error on read: return immediately.
		SetPointer(l_Pointer)
		RETURN -1
	END IF
//	Garbagecollect()
NEXT
// Close files.
IF ( FileClose(fin) = - 1 ) THEN 
	SetPointer(l_pointer)
	RETURN -1
END IF
SetPointer(l_Pointer)

// Successful return.
RETURN 1

//////////////////////////////////////////////////////////////
////
//// Integer global function gf_copy_file_to_blob(
////      string as_Filename    by value,
////      string ablob_Passed    by reference )
////
//// Arguments:
//// as_Filename = A string whose value is the name of the file
////      you want to copy to a BLOB. If filename is not on the
////      operating system's search path, enter the
////      fully qualified name, e.g.,"c:\pb4\mydata.txt".
////      Note that this function takes exclusive use
////      of the input file during execution.
////
//// ablob_Passed = BLOB variable that file is copied to.
////
//// Returns 1 if successful, -1 if unsuccessful.
////
//// This function copies the contents of a file to a
//// BLOB variable. It uses only PowerBuilder function calls.
//// All file i/o is done in stream mode. Note that this will
//// copy both binary and text files properly.
////
//// This function was written in PowerBuilder 4.0.06.
////
//// Error handling: The function returns immediately with a
//// -1 value if an error occurs. No cleanup is done, i.e., if
//// an error occurs while copying a file, upon return the input
//// file will still be open.
////
//// Possible changes/improvements:
//// a) You may want to remove the MessageBox() calls
//// depending on how this function is used.
//// b) Instead of simply returning when an error occurs, you
//// may want to do a FileClose() on any open files.
////
//// Author: Michael D. Kersey, Ksys
////
//// Modelled after PowerSoft Faxline Document 2020: Note that
//// that faxline has an error AFAIK! The document specifies
//// using a value of max_bytes=32766, but using that value
//// will cause the document's routine to fail if the file size is exactly
//// 32766 bytes. In addition that document has several typographical
//// errors (missing division symbols) that prevent compilation.
////
//////////////////////////////////////////////////////////////
//
//integer fin     // Input  file number.
//integer loops     // Number of blobs to copy.
//integer i      // Blob counter.
//long  flen     // Input file's length in bytes.
//long  bytes_read
//long  new_pos
//// We read into this blob variable.
//blob b
//// Maximum number of bytes that can be read
//// by FileRead() or written by FileWrite().
//long  max_bytes = 32765
//// When copying, we Yield() occasionally, so other
//// processes have a chance to run. For example, if
//// copying a file to/from a network drive, it may
//// be necessary for the client to tell the server
//// that we're still connected( NETBEUI Alive calls).
//// Here we're yielding for every MB transferred.
//integer yield_every = 30
//pointer l_pointer
//
//l_pointer = SetPointer(HourGlass!)
//// Get the input file's length in bytes.
//flen = FileLength(as_Filename)
//
//// Open the input file. Take exclusive use during the copy.
//// Return any error immediately.
//fin = FileOpen(as_Filename, StreamMode!, Read!, LockReadWrite!)
//IF ( fin < 0 ) THEN 
//	SetPointer(l_pointer)
//	RETURN fin
//END IF
//
//// Determine how many FileRead()'s are required to read the file.
//IF ( flen > max_bytes ) THEN
//	IF Mod( flen, max_bytes ) = 0 THEN
//		loops = flen / max_bytes
//	ELSE
//		loops = flen / max_bytes + 1
//	END IF
//ELSE
//	loops = 1
//END IF
//GarbageCollect()
//b = BLOB('')
//// Loop, reading and writing blobs.
//FOR I = 1 TO loops
//	// Yield occasionally.
//	IF ( Mod(i, yield_every) = 0 ) THEN Yield()
//	// Read a blob.
//	bytes_read = FileRead(fin, b)
//	// Was Read OK?
//	IF ( bytes_read > 0 ) THEN
//		// Yes. Append the read BLOB to our result BLOB.
//		ablob_Passed = ablob_Passed + b
//		// Update the input file pointer.
//		new_pos = new_pos + bytes_read
//		FileSeek(fin, new_pos, FromBeginning!)
//	ELSEIF ( bytes_read = -100 ) THEN
//		// Found <EOF> at start of file. No need to write anything.
//	ELSEIF ( bytes_read = -1 ) THEN
//		// Got error on read: return immediately.
//		SetPointer(l_Pointer)
//		RETURN -1
//	END IF
//	SetNull(b)
//	GarbageCollect()
//	b = BLOB('')
//NEXT
//SetNull(b)
//GarbageCollect()
//// Close files.
//IF ( FileClose(fin) = - 1 ) THEN 
//	SetPointer(l_pointer)
//	RETURN -1
//END IF
//SetPointer(l_Pointer)
//
//// Successful return.
//RETURN 1
end function

public function integer uf_put_blob_to_file_original (string as_filename, blob ablob_passed);////////////////////////////////////////////////////////////
//
// Integer global function gf_copy_blob_to_file(
//      string ablob_Passed  by reference,
//      string as_Filename  by value )
//
// Arguments:
// ablob_Passed = A BLOB variable that you want to copy to disk.
//
// as_Filename = File to be copied to. If as_Filename
//      does not exist, it will be created.
//
// Returns 1 if successful, -1 if unsuccessful.
//
// This function will copy or append a BLOB of any size to
// a disk file. It uses only PowerBuilder function calls.
// All file i/o is done in stream mode. Note that this will
// copy both binary and text files properly.
//
// This function was written in PowerBuilder 4.0.06.
//
// Error handling: The function returns immediately with a
// -1 value if an error occurs. No cleanup is done, i.e., if
// an error occurs while copying a file, upon return the input
// file and output file will still be open.
//
// Possible changes/improvements:
// a) You may want to remove the MessageBox() calls
// depending on how this function is used.
// b) Instead of simply returning when an error occurs, you
// may want to do a FileClose() on any open files.
//
// Author: Michael D. Kersey, Ksys
//
// Modelled after PowerSoft Faxline Document 2020: Note that
// that faxline has an error AFAIK! The document specifies
// using a value of max_bytes=32766, but using that value
// will cause the routine to fail if the file size is exactly
// 32766 bytes. In addition that document has several typographical
// errors (missing division symbols) that prevent compilation.
//
////////////////////////////////////////////////////////////

integer fout     // Output file number.
integer loops     // Number of blobs to copy.
integer i      // Blob counter.
long  blen     // Input BLOB's length in bytes.
long  bytes_read = 0
long  bytes_written
long  new_pos
// We read into and write from this blob variable.
blob b
// Maximum number of bytes that can be read
// by FileRead() or written by FileWrite().
long  max_bytes = 32765
// When copying, we Yield() occasionally, so other
// processes have a chance to run. For example, if
// copying a file to/from a network drive, it may
// be necessary for the client to tell the server
// that we're still connected( NETBEUI Alive calls).
// Here we're yielding for every MB transferred.
integer yield_every = 30
pointer l_pointer

l_pointer = SetPointer(HourGlass!)
// Warn the user if the target file already exists
// and we're overwriting it's contents. You may want
// to remove this code.
IF FileExists( as_Filename ) THEN
	IF MessageBox("WARNING", "File " + as_Filename + " already exists." + &
      "~r~nOK to overwrite? ", Question!, YesNo!) <> 1 THEN
		SetPointer(l_pointer)
		RETURN -1
	END IF
END IF

// Open the output file in the appropriate mode.
fout = FileOpen( as_Filename, StreamMode!, Write!, LockWrite!, Replace! )

// Return if an error occurs while opening the output file.
IF ( fout < 0 ) THEN 
	SetPointer(l_pointer)
	RETURN fout
END IF

// Get the input BLOB's length in bytes.
blen = Len(ablob_Passed)

// Determine how many BlobMid() calls
// are required to read the BLOB.
IF blen > max_bytes THEN
	IF Mod( blen, max_bytes ) = 0 THEN
		loops = blen / max_bytes
	ELSE
		loops = blen / max_bytes + 1
	END IF
ELSE
	loops = 1
END IF

// Start copying the BLOB at byte 1.
new_pos = 1

// Loop, reading from the BLOB and writing to the file.
FOR I = 1 TO loops
	// Yield occasionally.
	IF ( Mod(i, yield_every) = 0 ) THEN Yield()
	// Get part of the BLOB.
	b = BlobMid(ablob_Passed, new_pos, max_bytes)
	// Write this part of the BLOB to the output file.
	bytes_written = FileWrite(fout, b)
	IF ( bytes_written = -1 ) THEN 
		SetPointer(l_pointer)
		RETURN -1
	END IF
	 // Update the BLOB pointer.
	new_pos = new_pos + max_bytes
NEXT
// Close files.
IF ( FileClose( fout ) = - 1 ) THEN 
	SetPointer(l_pointer)
	RETURN -1
END IF
SetPointer(l_pointer)

// Successful return.
RETURN 1
end function

public function integer uf_get_blob_from_file (string as_filename, ref blob ablob_passed);integer li_Fnum
long ll_Bytes

li_Fnum = FileOpen(as_Filename, StreamMode!)
IF ( li_Fnum < 0 ) THEN 
	RETURN li_Fnum
END IF

//TRY 
	ll_Bytes = FileReadEx(li_Fnum, ablob_passed)
//FINALLY
//	MessageBox('Error', 'There was an error reading the file.  Please check available memory and try again.')
//	FileClose(li_Fnum)
//	RETURN -1
//END TRY

IF ( FileClose(li_Fnum) = - 1 ) THEN 
	RETURN -1
END IF

RETURN 1

end function

public function integer uf_put_blob_to_file (string as_filename, blob ablob_passed);integer li_Fnum

li_Fnum = FileOpen(as_Filename, StreamMode!, Write!, Shared!, Replace!)

//TRY 
	FileWriteEx(li_Fnum, ablob_passed)
//FINALLY
//	MessageBox('Error', 'There was an error writing the file.  Please check available memory and try again.')
//	FileClose(li_Fnum)
//	RETURN -1
//END TRY

IF ( FileClose(li_Fnum) = - 1 ) THEN 
	RETURN -1
END IF

RETURN 1
end function

on u_blob_file_handler.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_blob_file_handler.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

