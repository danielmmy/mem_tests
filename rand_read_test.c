#include<stdio.h>
#include<stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/time.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <asm/unistd.h>
#include <linux/perf_event.h>

enum events{
	INSTRUCTIONS,
	CYCLES,
	CACHE_REFERENCES,
	CACHE_MISSES,
	BRANCHES_MISSPREDICTED,
	EVENTS_COUNT
}EVENTS;

/*Open perf event.
pid->if 0 measures current process, if -1 measures all process;
cpu->-1 to measure on all cpus;
group_fd->allows for more than one event to measured by a single syscall, -1 to open a single event
*/
long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags){
	return syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
}


/*
Scales the result obtained by the ratio enabled(time actually measuring)/running(time of the execution)
*/
static inline unsigned long long perf_count(unsigned long long *values) {
	return (unsigned long long)((float)values[0]*(float)values[1]/(float)values[2]);
}



int main(int argc, char **argv){
	char *cpt;
	FILE *input_file=fopen(argv[1],"r");
        long long unsigned size=strtoull(argv[2],&cpt,10);
	long long unsigned vect_a[size];
	long long unsigned i;
	for(i=0;i<size;++i){
		fscanf(input_file,"%llu/",&vect_a[i]);
	}

	//measure clock wall time
	struct timeval start_time, stop_time;


	//Gets the results from counter
        unsigned long long counts[3];
        //Definig perf event attributes
        struct perf_event_attr attr;
        memset(&attr, 0, sizeof(attr));
        attr.type = PERF_TYPE_HARDWARE;
        attr.size = sizeof(struct perf_event_attr);
        attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_TOTAL_TIME_RUNNING;
        attr.config = PERF_COUNT_HW_INSTRUCTIONS;
        attr.disabled = 1;
        attr.exclude_kernel = 1;//Only read user space
        attr.exclude_hv = 1;//ONly read user space

	//File descriptor for events
	int fd[EVENTS_COUNT];
	fd[INSTRUCTIONS]=perf_event_open(&attr, 0, -1, -1, 0);
        if (fd[INSTRUCTIONS] == -1){
                printf("cannot open perf_counter for instructions\n");
                exit(0);
        }
	attr.type = PERF_TYPE_HARDWARE;
	attr.config = PERF_COUNT_HW_CPU_CYCLES;
	fd[CYCLES]=perf_event_open(&attr, 0, -1, -1, 0);
        if (fd[CYCLES] == -1){
                printf("cannot open perf_counter for cycles\n");
                exit(0);
        }
	
	attr.type = PERF_TYPE_RAW;
	attr.config=0x10;
        fd[BRANCHES_MISSPREDICTED]=perf_event_open(&attr, 0, -1, -1, 0);
        if (fd[BRANCHES_MISSPREDICTED] == -1){
                printf("cannot open perf_counter for BRANCHES_MISSPREDICTED\n");
                exit(0);
        }

	attr.type = PERF_TYPE_HARDWARE;
	attr.config = PERF_COUNT_HW_CACHE_REFERENCES;
        fd[CACHE_REFERENCES]=perf_event_open(&attr, 0, -1, -1, 0);
        if (fd[CACHE_REFERENCES] == -1){
                printf("cannot open perf_counter for cache references\n");
                exit(0);
        }
	attr.type = PERF_TYPE_HARDWARE;
	attr.config = PERF_COUNT_HW_CACHE_MISSES;
        fd[CACHE_MISSES]=perf_event_open(&attr, 0, -1, -1, 0);
        if (fd[CACHE_MISSES] == -1){
                printf("cannot open perf_counter for cache misses\n");
                exit(0);
        }
	

	//Resets counter
	for(i=0;i<EVENTS_COUNT;++i)
	        ioctl(fd[i], PERF_EVENT_IOC_RESET,0);
	//Enable counter
	for(i=0;i<EVENTS_COUNT;++i)
	        ioctl(fd[i], PERF_EVENT_IOC_ENABLE,0);
	//wall clock start
	gettimeofday(&start_time,0);
        //Read memory test
	i=0;
	do{
		i=vect_a[i];
	}while(i!=0);
        //Stops counter
	for(i=0;i<EVENTS_COUNT;++i)
	        ioctl(fd[i], PERF_EVENT_IOC_DISABLE, 0);
	//Wall clock stop
	gettimeofday(&stop_time,0);

	
	//prints time
	unsigned long long us=0;
	us=(stop_time.tv_sec-start_time.tv_sec)*1000000;
	us+=stop_time.tv_usec-start_time.tv_usec;
	printf("Wall clock time[gettimeofday(2)] = %llu us\n",us);
	//prints counters
	printf("PMU statistics:\n");
        read(fd[INSTRUCTIONS], counts, sizeof(counts));
	printf("Instructions = %llu %s.\n",perf_count(counts),counts[1]==counts[2]?"real":"scaled");
	read(fd[CYCLES], counts, sizeof(counts));
        printf("Cycles = %llu %s.\n",perf_count(counts),counts[1]==counts[2]?"real":"scaled");
	read(fd[BRANCHES_MISSPREDICTED], counts, sizeof(counts));
	printf("Banches misspredicted = %llu %s.\n",perf_count(counts),counts[1]==counts[2]?"real":"scaled");
        read(fd[CACHE_REFERENCES], counts, sizeof(counts));
	printf("Cache references = %llu %s.\n",perf_count(counts),counts[1]==counts[2]?"real":"scaled");
	read(fd[CACHE_MISSES], counts, sizeof(counts));
printf("Cache misses = %llu %s.\n",perf_count(counts),counts[1]==counts[2]?"real":"scaled");
}
