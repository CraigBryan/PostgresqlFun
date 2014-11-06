.\\" auto-generated by docbook2man-spec $Revision: 1.1.1.1 $
.TH "SPI_copytuple" "" "2007-02-01" "" "PostgreSQL 8.1.7 Documentation"
.SH NAME
SPI_copytuple \- make a copy of a row in the upper executor context

.SH SYNOPSIS
.sp
.nf
HeapTuple SPI_copytuple(HeapTuple \fIrow\fR)
.sp
.fi
.SH "DESCRIPTION"
.PP
\fBSPI_copytuple\fR makes a copy of a row in the
upper executor context. This is normally used to return a modified
row from a trigger. In a function declared to return a composite
type, use \fBSPI_returntuple\fR instead.
.SH "ARGUMENTS"
.TP
\fBHeapTuple \fIrow\fB\fR
row to be copied
.SH "RETURN VALUE"
.PP
the copied row; \fBNULL\fR only if
\fItuple\fR is \fBNULL\fR