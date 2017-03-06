#include<stdio.h>
#include<stdlib.h>
#include<time.h>

struct node{
	long long unsigned data;
	struct node *nextPtr;
};
typedef struct node NODE;
 
void list_insert(NODE **list,long long data){
	NODE *new=(NODE*)malloc(sizeof(NODE));
	if(new!=NULL){
		new->data=data;
		new->nextPtr=NULL;
		if(*list!=NULL){
			NODE *curr=*list;
			while(curr->nextPtr!=NULL){
				curr=curr->nextPtr;
			}
			curr->nextPtr=new;
		}else{
			*list=new;
		}
	}else{	
		fprintf(stderr,"Could not allocate memory");
		exit(1);
	}
}
 
void list_read_at(NODE *list,long long unsigned pos, NODE **prev, NODE **curr){
        long long unsigned i;
        *curr=list;
        *prev=NULL;
        for(i=0;i<pos;++i){
                *prev=*curr;
                *curr=(*curr)->nextPtr;
        }     
}


void list_remove(NODE **list,NODE **prev, NODE **curr){
        if(*prev!=NULL){
                (*prev)->nextPtr=(*curr)->nextPtr;
        }else{
                *list=(*curr)->nextPtr;
        }
        free(*curr);
}


void list_print(NODE *list){
	while(list!=NULL){
		printf("%lld-->",list->data);
        	list=list->nextPtr;
	}
	printf("//\n");
}


void fill_vector(long long unsigned *v,long long unsigned size){
	long long unsigned i,j,index,data;
        NODE *list=NULL;
        srand(time(NULL));
	for(i=0;i<size;++i){
		v[i]=0;
	}
		
        for(i=1;i<size;++i){
                list_insert(&list,i);
        }
        i=size-1;
	j=0;
	NODE *prev;
	NODE *curr;
        while(i>0){
		index=rand()%i;
                list_read_at(list,index,&prev,&curr);
                if(curr->data!=j){
                        v[j]=curr->data;
			j=curr->data;
			list_remove(&list,&prev,&curr);
			--i;
		}
	}
}


int main(int argc, char **argv){
	long long unsigned size;
	long long unsigned i;
	char *cpt;
	if(argc!=2){
		size=8192;
	}else{
		size=strtoull(argv[1],&cpt,10);
	}
	long long unsigned vector_a[size];
	fill_vector(vector_a,size);
	for(i=0;i<size;i++){		
		printf("%llu/",vector_a[i]);
	}
	printf("\n");

	
}
