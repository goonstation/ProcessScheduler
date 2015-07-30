// Process status defines
#define PROCESS_STATUS_IDLE 1
#define PROCESS_STATUS_QUEUED 2
#define PROCESS_STATUS_RUNNING 3
#define PROCESS_STATUS_MAYBE_HUNG 4
#define PROCESS_STATUS_PROBABLY_HUNG 5
#define PROCESS_STATUS_HUNG 6

// Process time thresholds
#define PROCESS_DEFAULT_HANG_WARNING_TIME 	300 // 30 seconds
#define PROCESS_DEFAULT_HANG_ALERT_TIME 	600 // 60 seconds
#define PROCESS_DEFAULT_HANG_RESTART_TIME 	900 // 90 seconds
#define PROCESS_DEFAULT_SCHEDULE_INTERVAL 	50  // 50 ticks
#define PROCESS_DEFAULT_SLEEP_INTERVAL		8	// 2 ticks
#define PROCESS_DEFAULT_CPU_THRESHOLD		90  // 90%


//#define UPDATE_QUEUE_DEBUG
// If btime.dll is available, do this shit
#define PRECISE_TIMER_AVAILABLE

#ifdef PRECISE_TIMER_AVAILABLE
var/global/lastTimeOfHour = 0
#define TimeOfHour __btime__timeofhour()
#define __extern__timeofhour text2num(call("btime.[world.system_type==MS_WINDOWS?"dll":"so"]", "gettime")())
proc/__btime__timeofhour()
	if (prob(5) || ((world.timeofday % 36000) > global.lastTimeOfHour))
		global.lastTimeOfHour = __extern__timeofhour
	return global.lastTimeOfHour
#else
#define TimeOfHour world.timeofday % 36000
#endif