.\\" auto-generated by docbook2man-spec $Revision: 1.1.1.1 $
.TH "ALTER TABLESPACE" "" "2007-02-01" "SQL - Language Statements" "SQL Commands"
.SH NAME
ALTER TABLESPACE \- change the definition of a tablespace

.SH SYNOPSIS
.sp
.nf
ALTER TABLESPACE \fIname\fR RENAME TO \fInewname\fR
ALTER TABLESPACE \fIname\fR OWNER TO \fInewowner\fR
.sp
.fi
.SH "DESCRIPTION"
.PP
\fBALTER TABLESPACE\fR changes the definition of
a tablespace.
.PP
You must own the tablespace to use \fBALTER TABLESPACE\fR.
To alter the owner, you must also be a direct or indirect member of the new
owning role.
(Note that superusers have these privileges automatically.)
.SH "PARAMETERS"
.TP
\fB\fIname\fB\fR
The name of an existing tablespace.
.TP
\fB\fInewname\fB\fR
The new name of the tablespace. The new name cannot
begin with pg_, as such names
are reserved for system tablespaces.
.TP
\fB\fInewowner\fB\fR
The new owner of the tablespace.
.SH "EXAMPLES"
.PP
Rename tablespace index_space to fast_raid:
.sp
.nf
ALTER TABLESPACE index_space RENAME TO fast_raid;
.sp
.fi
.PP
Change the owner of tablespace index_space:
.sp
.nf
ALTER TABLESPACE index_space OWNER TO mary;
.sp
.fi
.SH "COMPATIBILITY"
.PP
There is no \fBALTER TABLESPACE\fR statement in
the SQL standard.
.SH "SEE ALSO"
CREATE TABLESPACE [\fBcreate_tablespace\fR(l)], DROP TABLESPACE [\fBdrop_tablespace\fR(l)]