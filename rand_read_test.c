#include<stdio.h>
#include<stdlib.h>

int main(int argc, char **argv){
	char *cpt;
	FILE *input_file=fopen(argv[1],"r");
        long long unsigned size=strtoull(argv[2],&cpt,10);
	long long unsigned vect_a[size];
	long long unsigned i;
	for(i=0;i<size;++i){
		fscanf(input_file,"%llu/",&vect_a[i]);
	}
	for(i=0;i<size;++i){
                printf("%llu/",vect_a[i]);
        }
	printf("\n");
}
