/*
 * Copyright (C) 2015 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Don't edit this file!  It is auto-generated by frameworks/rs/api/gen_runtime.

/*
 * rs_time.rsh: RenderScript time routines
 *
 * This file contains RenderScript functions relating to time and date manipulation.
 */
#ifndef RENDERSCRIPT_RS_TIME_RSH
#define RENDERSCRIPT_RS_TIME_RSH

/*
 * rs_time_t: Seconds since January 1, 1970
 *
 * Calendar time interpreted as seconds elapsed since the Epoch (00:00:00 on
 * January 1, 1970, Coordinated Universal Time (UTC)).
 */
#ifndef __LP64__
typedef int rs_time_t;
#endif

#ifdef __LP64__
typedef long rs_time_t;
#endif


/*
 * rs_tm: Date and time structure
 *
 * Data structure for broken-down time components.
 */
typedef struct {
    int tm_sec; // Seconds after the minute. This ranges from 0 to 59, but possibly up to 60 for leap seconds.
    int tm_min; // Minutes after the hour. This ranges from 0 to 59.
    int tm_hour; // Hours past midnight. This ranges from 0 to 23.
    int tm_mday; // Day of the month. This ranges from 1 to 31.
    int tm_mon; // Months since January. This ranges from 0 to 11.
    int tm_year; // Years since 1900.
    int tm_wday; // Days since Sunday. This ranges from 0 to 6.
    int tm_yday; // Days since January 1. This ranges from 0 to 365.
    int tm_isdst; // Flag to indicate whether daylight saving time is in effect. The value is positive if it is in effect, zero if it is not, and negative if the information is not available.
} rs_tm;


/*
 * Returns the time in seconds since this function was last called in this
 * script.
 *
 * Returns: Time in seconds.
 */
extern float __attribute__((overloadable))
    rsGetDt(void);

/*
 * Converts the time specified by p timer into broken-down time and stores it
 * in p local. This function also returns a pointer to p local. If p local
 * is NULL, this function does nothing and returns NULL.
 *
 * Parameters:
 *   local Broken-down time.
 *   timer Input time as calendar time.
 *
 * Returns: Pointer to broken-down time (same as input p local).
 */
extern rs_tm* __attribute__((overloadable))
    rsLocaltime(rs_tm* local, const rs_time_t* timer);

/*
 * Returns the number of seconds since the Epoch (00:00:00 UTC, January 1,
 * 1970). If p timer is non-NULL, the result is also stored in the memory
 * pointed to by this variable. If an error occurs, a value of -1 is returned.
 *
 * Parameters:
 *   timer Location to also store the returned calendar time.
 *
 * Returns: Seconds since the Epoch.
 */
extern rs_time_t __attribute__((overloadable))
    rsTime(rs_time_t* timer);

/*
 * Returns the current system clock (uptime) in milliseconds.
 *
 * Returns: Uptime in milliseconds.
 */
extern int64_t __attribute__((overloadable))
    rsUptimeMillis(void);

/*
 * Returns the current system clock (uptime) in nanoseconds.
 *
 * Returns: Uptime in nanoseconds.
 */
extern int64_t __attribute__((overloadable))
    rsUptimeNanos(void);

#endif // RENDERSCRIPT_RS_TIME_RSH
