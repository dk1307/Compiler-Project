#include<stdio.h>
#include<string.h>
void findans(char arr[]);
int main(){
	int n,i,j,kd=0,l=0,t;
	char p[10],q[10],tp1[20],tp2[20];
	printf("enter number of production:");
	scanf("%d",&n);
	if(n>1){
		printf("enter %d production rule:\n",n);
		scanf("%s",p);
		scanf("%s",q);
		int len1=strlen(p);
		int len2=strlen(q);
		char l1=p[0];
		char l2=q[0];
		tp2[l]=p[0];
		l++;
		tp2[l]=p[1];
		l++;
		tp2[l]=p[2];
		l++;
		for(i=3;i<len1;i++){
			if(p[i]==l2){
				int n=i+1;
				while(p[n]!='|' && p[n]!='\0'){
					tp1[kd]=p[n];
					kd++;
					n++;
				}
				tp1[kd]='\0';

				for(j=3;j<len2;j++){
					while(q[j]!='\0' && q[j]!='|'){
						tp2[l]=q[j];

						l++;
						j++;
					}
					for(t=0;t<strlen(tp1);t++){
						tp2[l]=tp1[t];
						l++;
					}
					tp2[l]='|';
					l++;
				}
				i=n;
			}
			else if(p[i]!=l2){
				tp2[l]=p[i];
				l++;
			}
		}
		tp2[l]='\0';
		findans(tp2);
	}
	else{
		printf("enter production rule\n");
		scanf("%s",p);
		findans(p);
	}
	return 0;
}
void findans(char str[]){
	int i,j=0,t=0,len,l;
	char first[20],sec[20];
	len=strlen(str);
	l=str[0];
	for(i=3;i<len;i++){
		if(str[i]==l){
			int c=i+1;
			while(str[c]!='|' && str[c]!='\0'){
				first[j]=str[c];
				j++;
				c++;
			}
			first[j]='|';
			j++;
			i=c;
			first[j]='\0';
		}
		else if(str[i]!=l){
			int n=i;
			while(str[n]!='\0' && str[n]!='|'){
				sec[t++]=str[n];
				n++;
			}
			sec[t++]='|';
			i=n;
			sec[t]='\0';
		}
	}
	printf("Grammar after removing left recursion is: \n");
	printf("%c->",l);
	for(i=0;sec[i]!='\0';i++){
		if(sec[i]!='|')
			printf("%c",sec[i]);
		else
			printf("%c'|",l);
	}
	printf("\n");
	printf("%c'->",l);
	for(i=0;first[i]!='\0';i++){
		while(first[i]!='|'){
			printf("%c",first[i]);
			i++;
		}
		printf("%c'|",l);
	}
	printf("0");
}
