/*-------------------------------------------------------------------------
 *
 * pqsignal.h
 *	  prototypes for the reliable BSD-style signal(2) routine.
 *
 *
 * Portions Copyright (c) 1996-2005, PostgreSQL Global Development Group
 * Portions Copyright (c) 1994, Regents of the University of California
 *
 * $PostgreSQL: pgsql/src/interfaces/libpq/pqsignal.h,v 1.19.6.1 2006/05/30 15:58:07 tgl Exp $
 *
 * NOTES
 *	  This shouldn't be in libpq, but the monitor and some other
 *	  things need it...
 *
 *-------------------------------------------------------------------------
 */
#ifndef PQSIGNAL_H
#define PQSIGNAL_H

#include "postgres_fe.h"

typedef void (*pqsigfunc) (int);

extern pqsigfunc pqsignal(int signo, pqsigfunc func);

#endif   /* PQSIGNAL_H */
