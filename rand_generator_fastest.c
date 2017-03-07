#include<stdio.h>
#include<stdlib.h>
#include<time.h>

void fill_vector(long long unsigned *v,long long unsigned size){
	long long unsigned i,j,index,data;
        srand(time(NULL));
	long long unsigned v_tmp[size];
	for(i=0;i<size;++i){
		v[i]=0;
		v_tmp[i]=i;
	}
	long long unsigned tmp_len=size;
	i=size-1;
	j=0;		
        while(i>0){
		index=rand()%tmp_len; 
                if(j!=v_tmp[index]&&v_tmp[index]>0){
                        v[j]=v_tmp[index];
			j=v_tmp[index];
			v_tmp[index]=0;
			--i;
		}
	}
}


int main(int argc, char **argv){
	long long unsigned size;
	long long unsigned i;
	char *cpt;
	size=strtoull(argv[1],&cpt,10);
	long long unsigned vector_a[size];

	fill_vector(vector_a,size);
	for(i=0;i<size;i++){		
		printf("%llu/",vector_a[i]);
	}
	printf("\n");
}
